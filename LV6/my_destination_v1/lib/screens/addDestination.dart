import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_destination_v1/model/destination.dart';

class AddDestinationScreen extends StatefulWidget {
  List<Destination> list;
  AddDestinationScreen({
    this.list,
  });
  @override
  _AddDestinationScreenState createState() => _AddDestinationScreenState();
}

class _AddDestinationScreenState extends State<AddDestinationScreen> {
  String newName = "";
  String newDescription = "";
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoNavigationBarBackButton(
          previousPageTitle: "Back",
        ),
      ),
      child: SafeArea(
        child: SizedBox(
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Naziv:",
                    style: TextStyle(),
                  ),
                  Container(
                      width: 300,
                      child: CupertinoTextField(
                        onChanged: (value) {
                          newName = value;
                        },
                      )),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Opis:"),
                  Container(
                      width: 300,
                      child: CupertinoTextField(
                        onChanged: (value) {
                          newDescription = value;
                        },
                      )),
                ],
              ),
              CupertinoButton(
                child: Text("Save"),
                onPressed: () {
                  widget.list.add(
                      Destination(name: newName, description: newDescription));
                  Navigator.pop(context);
                },
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
