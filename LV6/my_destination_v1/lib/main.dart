import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_destination_v1/model/destination.dart';
import 'package:my_destination_v1/screens/addDestination.dart';

List<Destination> destinationList = [];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'My Destinations V1',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Moje Destinacije"),
        trailing: CupertinoButton(
            child: Icon(CupertinoIcons.add),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AddDestinationScreen(list: destinationList),
                ),
              );
              setState(() {});
            }),
      ),
      child: SafeArea(
        child: ListView.builder(
            itemCount: destinationList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        destinationList[index].name,
                        style: TextStyle(fontSize: 23),
                      ),
                      Text(destinationList[index].description),
                      Divider()
                    ]),
              );
            }),
      ),
    );
  }
}
