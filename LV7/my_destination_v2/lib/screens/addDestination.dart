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
  String name = "";
  String description = "";
  String imageUrl = "";
  String long = "";
  String lat = "";
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(previousPageTitle: "Moja Destinacija",),
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
                          name = value;
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
                        description = value;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("URL:"),
                  Container(
                    width: 300,
                    child: CupertinoTextField(
                      onChanged: (value) {
                        imageUrl = value;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Lat:"),
                  Container(
                    width: 300,
                    child: CupertinoTextField(
                      onChanged: (value) {
                        lat = value;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Long:"),
                  Container(
                    width: 300,
                    child: CupertinoTextField(
                      onChanged: (value) {
                        long = value;
                      },
                    ),
                  ),
                ],
              ),
              CupertinoButton(
                child: Text("Save"),
                onPressed: () {
                  widget.list.add(
                    Destination(
                        name: name,
                        description: description,
                        lat: lat,
                        long: long,
                        url: imageUrl),
                  );
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
