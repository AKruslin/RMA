import 'dart:async';
import 'dart:convert';

import 'package:birdwatcher_app/model/birdwatcher.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  BirdWatcher data = BirdWatcher.initialStart();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  CounterBloc() : super(CounterInitial(Colors.white, 0));

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    final SharedPreferences prefs = await _prefs;
    if (event is LoadData) {
      String birdwatcherData = prefs.getString("birdWatcher") ?? "empty";
      print(Colors.white.value);
      if (birdwatcherData == "empty") {
        data = BirdWatcher(color: Colors.white.value, counterValue: 0);
        yield CounterInitial(Color(data.color), data.counterValue);
      } else {
        Map<String, dynamic> sharedPrefData = jsonDecode(birdwatcherData);
        data.color = sharedPrefData["color"];
        data.counterValue = sharedPrefData["counterValue"];
        yield CounterInitial(
            Color(sharedPrefData["color"]), sharedPrefData["counterValue"]);
      }
    }
    if (event is UpdateCounter) {
      data.color = event.newColor.value;
      data.counterValue++;
      prefs.setString("birdWatcher", jsonEncode(data.toJson()));
      yield CounterIncreased(Color(data.color), data.counterValue);
    }
    if (event is ResetCounter) {
      data.counterValue = 0;
      data.color = Colors.white.value;
      prefs.setString("birdWatcher", jsonEncode(data.toJson()));
      yield CounterInitial(Color(data.color), data.counterValue);
    }
  }
}

