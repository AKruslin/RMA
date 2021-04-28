import 'dart:async';

import 'package:birdwatcher_app/database/birdwatcherDB.dart';
import 'package:birdwatcher_app/database/birdwatcherEntity.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  BirdWatcher currentData = BirdWatcher.initialStart();
  final database = BirdWatcherDB().getDatabase();
  CounterBloc() : super(CounterInitial(Colors.white, 0));

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is LoadData) {
      AppDatabase appDatabase = await database;
      final birdwatcherData =
          await appDatabase.birdwatcherDao.getBirdWatcherData();
      if (birdwatcherData == null) {
        await appDatabase.birdwatcherDao.insertBirdWatcher(currentData);
        yield CounterInitial(Colors.white, 0);
      } else {
        currentData.color = birdwatcherData.color;
        currentData.counterValue = birdwatcherData.counterValue;
        yield CounterInitial(
            Color(birdwatcherData.color), birdwatcherData.counterValue);
      }
    }
    if (event is UpdateCounter) {
      currentData.color = event.newColor.value;
      currentData.counterValue++;
      AppDatabase appDatabase = await database;
      await appDatabase.birdwatcherDao.updateBirdWatcher(currentData);
      yield CounterIncreased(Color(currentData.color), currentData.counterValue);
    }
    if (event is ResetCounter) {
      currentData.counterValue = 0;
      currentData.color = Colors.white.value;
      AppDatabase appDatabase = await database;
      await appDatabase.birdwatcherDao.updateBirdWatcher(currentData);
      yield CounterInitial(Color(currentData.color), currentData.counterValue);
    }
  }
}
