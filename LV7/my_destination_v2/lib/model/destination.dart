import 'package:flutter/cupertino.dart';

class Destination {
  final UniqueKey id = UniqueKey();
  String name;
  String description;
  String long;
  String lat;
  String url;

  Destination({
    this.name,
    this.description,
    this.long,
    this.lat,
    this.url,
  });
}
