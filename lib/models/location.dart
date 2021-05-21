import 'package:flutter/cupertino.dart';

class Location {
  UniqueKey id = UniqueKey();
  String name;
  String details;
  String locationUrl;

  Location({
    @required this.name,
    @required this.details,
    @required this.locationUrl,
  });
}
