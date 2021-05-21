import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:rma_lv6_lv7/screens/location_details_screen.dart';

import '../models/location.dart';

class LocationItem extends StatelessWidget {
  final Location location;

  LocationItem({
    @required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      leading: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 44,
          minHeight: 44,
          maxWidth: 64,
          maxHeight: 64,
        ),
        child: Image.network(location.locationUrl),
      ),
      title: Text(location.name),
      subtitle: Text(location.details),
      onTap: () {
        Navigator.of(context).pushNamed(LocationDetailsScreen.routeName,arguments: location);
      },
    );
  }
}
