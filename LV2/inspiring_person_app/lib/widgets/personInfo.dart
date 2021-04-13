import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspiring_person_app/models/inspiringPerson.dart';
import 'package:intl/intl.dart';

class PersonInfo extends StatelessWidget {
  const PersonInfo({
    Key key,
    @required this.person,
  }) : super(key: key);

  final InspiringPerson person;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(DateFormat.yMMMd().format(person.birthday)),
          Text(person.description),
        ],
      ),
    );
  }
}
