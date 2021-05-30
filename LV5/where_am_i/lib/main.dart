import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:maps_launcher/maps_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

Location location = Location();
bool? _serviceEnabled;
PermissionStatus? _permissionGranted;
LocationData? _locationData;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                _serviceEnabled = await location.serviceEnabled();
                if (!_serviceEnabled!) {
                  _serviceEnabled = await location.requestService();
                  if (!_serviceEnabled!) {
                    return;
                  }
                }

                _permissionGranted = await location.hasPermission();
                if (_permissionGranted == PermissionStatus.denied) {
                  _permissionGranted = await location.requestPermission();
                  if (_permissionGranted != PermissionStatus.granted) {
                    return;
                  }
                }
                _locationData = await location.getLocation();
                setState(() {});
              },
              child: const Text("Find my Location"),
            ),
            Center(
              child: _locationData != null
                  ? ElevatedButton(
                      onPressed: () => MapsLauncher.launchCoordinates(
                          _locationData!.latitude!,
                          _locationData!.longitude!,
                          'You are here'),
                      child: const Text('Open Map'),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
