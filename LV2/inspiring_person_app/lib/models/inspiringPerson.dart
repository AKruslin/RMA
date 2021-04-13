import 'package:flutter/cupertino.dart';

class InspiringPerson {
  UniqueKey id = UniqueKey();
  String image;
  DateTime birthday;
  String description;
  String quote;

  InspiringPerson({this.image, this.birthday, this.description, this.quote});
  InspiringPerson.withID(UniqueKey id, String image, DateTime birthday,
      String description, String quote) {
    this.id = id;
    this.image = image;
    this.birthday = birthday;
    this.description = description;
    this.quote = quote;
  }
}
