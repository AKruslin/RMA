import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AudioCache player = AudioCache();
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              //player.load("boat.mp3");
              player.play("boat.mp3");
            },
            child: const Text("Boat"),
          ),
          ElevatedButton(
            onPressed: () {
              //player.load("dogBarking.mp3");
              player.play("dogBarking.mp3");
            },
            child: const Text("dogBarking"),
          ),
          ElevatedButton(
            onPressed: () {
              player.load("harleyDavidson.mp3");
              player.play("harleyDavidson.mp3");
            },
            child: const Text("harleyDavidson"),
          ),
          ElevatedButton(
            onPressed: () {
              player.load("serviceBell.mp3");
              player.play("serviceBell.mp3");
            },
            child: const Text("serviceBell"),
          ),
        ],
      ),
    ));
  }
}
