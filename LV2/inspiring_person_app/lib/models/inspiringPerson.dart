import 'package:flutter/cupertino.dart';

class InspiringPerson {
  UniqueKey id = UniqueKey();
  String image;
  DateTime birthday;
  String description;
  String quote;

  InspiringPerson({this.image, this.birthday, this.description, this.quote});
}
