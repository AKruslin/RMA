// database.dart

// required package imports
import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:birdwatcher_app/database/birdwatcherDao.dart';
import 'package:birdwatcher_app/database/birdwatcherEntity.dart';

part 'birdwatcherDB.g.dart'; // the generated code will be there

@Database(version: 1, entities: [BirdWatcher])
abstract class AppDatabase extends FloorDatabase {
  BirdWatcherDao get birdwatcherDao;
}

class BirdWatcherDB {
  static final BirdWatcherDB _instance = BirdWatcherDB._internal();

  factory BirdWatcherDB() {
    return _instance;
  }

  BirdWatcherDB._internal();

  Future<AppDatabase> getDatabase() async {
    return await $FloorAppDatabase.databaseBuilder("birdDatabase.db").build();
  }
}
