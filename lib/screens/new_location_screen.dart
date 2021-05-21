import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/location.dart';

import '../data.dart';

// ignore: must_be_immutable
class NewDestinationScreen extends StatelessWidget {
  static const routeName = '/newLocation';
  String name = '';
  String details = '';
  String locationUrl = '';
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Unos nove destinacije'),
        previousPageTitle: 'Back',
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    child: Text('Naziv:'),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: CupertinoTextField(
                      padding: EdgeInsets.all(8.0),
                      onChanged: (value) => name = value,
                      decoration: BoxDecoration(
                        border: Border.all(color: CupertinoColors.systemGrey),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    child: Text('Opis:'),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: CupertinoTextField(
                      padding: EdgeInsets.all(8.0),
                      onChanged: (value) => details = value,
                      decoration: BoxDecoration(
                        border: Border.all(color: CupertinoColors.systemGrey),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    child: Text('URL:'),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: CupertinoTextField(
                      padding: EdgeInsets.all(8.0),
                      onChanged: (value) => locationUrl = value,
                      decoration: BoxDecoration(
                        border: Border.all(color: CupertinoColors.systemGrey),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CupertinoButton(
              child: Text(
                'Save',
                style: TextStyle(
                  color: CupertinoColors.activeBlue,
                  fontSize: 25.0,
                ),
              ),
              onPressed: () {
                if (details != '' && locationUrl != '' && name != '') {
                  data.add(
                    Location(
                        details: details, locationUrl: locationUrl, name: name),
                  );
                  Navigator.pop(context);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
