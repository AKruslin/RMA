import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_destination_v1/model/destination.dart';
import 'package:my_destination_v1/screens/addDestination.dart';
import 'package:my_destination_v1/screens/destinationDetails.dart';

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
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DestinationDetailsScreen(
                      destination: destinationList[index],
                    ),
                  ),
                ),
                child: Dismissible(
                  key: destinationList[index].id,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        destinationList[index].url != ""
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: 100,
                                  width: 100,
                                  child:
                                      Image.network(destinationList[index].url),
                                ),
                              )
                            : Container(
                                padding: const EdgeInsets.all(8.0),
                                width: 120,
                                height: 100,
                              ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                destinationList[index].name,
                                style: TextStyle(fontSize: 23),
                              ),
                              Text(destinationList[index].description),
                              Divider()
                            ]),
                      ],
                    ),
                  ),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.white,
                  ),
                  secondaryBackground: Container(
                    color: Colors.red,
                    child: Icon(
                      CupertinoIcons.delete,
                      color: Colors.white,
                    ),
                  ),
                  confirmDismiss: (a) => showCupertinoDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: Text("Obrisi destinaciju?"),
                      actions: [
                        CupertinoButton(
                            child: Text("Cancel"),
                            onPressed: () => Navigator.pop(context)),
                        CupertinoButton(
                            child: Text(
                              "Delete",
                              style: TextStyle(color: Colors.red),
                            ),
                            onPressed: () {
                              setState(() {
                                destinationList.removeAt(index);
                              });
                              Navigator.pop(context);
                            }),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
