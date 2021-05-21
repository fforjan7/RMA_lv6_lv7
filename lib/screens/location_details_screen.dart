import 'package:flutter/cupertino.dart';

import '../models/location.dart';

// ignore: must_be_immutable
class LocationDetailsScreen extends StatelessWidget {
  static const routeName = '/locationDetails';

  @override
  Widget build(BuildContext context) {
    final location = ModalRoute.of(context).settings.arguments as Location;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Row(
          children: [
            Icon(
              CupertinoIcons.back,
              size: 30,
            ),
            Expanded(
              child: CupertinoButton(
                padding: EdgeInsets.all(0.0),
                child: Text(
                  'Moje destinacije',
                  style: TextStyle(
                    color: CupertinoColors.systemBlue,
                  ),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                location.name,
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                location.details,
                style: TextStyle(
                  fontSize: 20,
                  color: CupertinoColors.systemGrey,
                ),
              ),
            ),
            Container(
              height: 350,
              width: double.infinity,
              child: Image.network(
                location.locationUrl,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
