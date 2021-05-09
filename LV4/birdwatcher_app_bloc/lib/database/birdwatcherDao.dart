import 'package:birdwatcher_app/database/birdwatcherEntity.dart';
import 'package:floor/floor.dart';

@dao
abstract class BirdWatcherDao {
  @insert
  Future<void> insertBirdWatcher(BirdWatcher watcherData);

  @update
  Future<void> updateBirdWatcher(BirdWatcher watcherData);

  @Query('SELECT * FROM BirdWatcher WHERE id = "birdwatcher001"')
  Future<BirdWatcher?> getBirdWatcherData();
}