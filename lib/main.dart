import 'package:flutter/cupertino.dart';
import 'package:rma_lv6_lv7/screens/location_details_screen.dart';

import 'screens/location_screen.dart';
import 'screens/new_location_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'lv6_lv7',
      home: LocationScreen(),
      routes: {
        NewDestinationScreen.routeName: (ctx) => NewDestinationScreen(),
        LocationDetailsScreen.routeName: (ctx) => LocationDetailsScreen(),
      },
    );
  }
}
