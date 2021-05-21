import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data.dart';
import '../widgets/location_item.dart';
import 'new_location_screen.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Moje destinacije'),
        trailing: CupertinoButton(
          child: Icon(
            CupertinoIcons.add,
          ),
          onPressed: () {
            Navigator.of(context)
                .pushNamed(NewDestinationScreen.routeName)
                .then((value) => setState(() {}));
          },
        ),
      ),
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          final item = data[index].id.toString();
          return Dismissible(
            key: Key(item),
            onDismissed: (direction) {
              setState(() {
                data.removeAt(index);
              });
            },
            background: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20.0),
              color: CupertinoColors.systemRed,
              child: Icon(CupertinoIcons.delete, color: CupertinoColors.white),
            ),
            direction: DismissDirection.endToStart,
            confirmDismiss: (DismissDirection direction) async {
              return await showCupertinoDialog(
                context: context,
                builder: (BuildContext context) {
                  return CupertinoAlertDialog(
                    title: const Text('Potvrdi'),
                    content: const Text('Obrisi destinaciju?'),
                    actions: [
                      CupertinoButton(
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: CupertinoColors.activeBlue,
                          ),
                        ),
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                      CupertinoButton(
                        child: Text(
                          'DELETE',
                          style: TextStyle(
                            color: CupertinoColors.systemRed,
                          ),
                        ),
                        onPressed: () => Navigator.of(context).pop(true),
                      ),
                    ],
                  );
                },
              );
            },
            child: LocationItem(
              location: data[index],
            ),
          );
        },
        itemCount: data.length,
      ),
    );
  }
}
