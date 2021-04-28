// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'birdwatcherDB.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  BirdWatcherDao? _birdwatcherDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `BirdWatcher` (`id` TEXT NOT NULL, `color` INTEGER NOT NULL, `counterValue` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  BirdWatcherDao get birdwatcherDao {
    return _birdwatcherDaoInstance ??=
        _$BirdWatcherDao(database, changeListener);
  }
}

class _$BirdWatcherDao extends BirdWatcherDao {
  _$BirdWatcherDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _birdWatcherInsertionAdapter = InsertionAdapter(
            database,
            'BirdWatcher',
            (BirdWatcher item) => <String, Object?>{
                  'id': item.id,
                  'color': item.color,
                  'counterValue': item.counterValue
                }),
        _birdWatcherUpdateAdapter = UpdateAdapter(
            database,
            'BirdWatcher',
            ['id'],
            (BirdWatcher item) => <String, Object?>{
                  'id': item.id,
                  'color': item.color,
                  'counterValue': item.counterValue
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<BirdWatcher> _birdWatcherInsertionAdapter;

  final UpdateAdapter<BirdWatcher> _birdWatcherUpdateAdapter;

  @override
  Future<BirdWatcher?> getBirdWatcherData() async {
    return _queryAdapter.query(
        'SELECT * FROM BirdWatcher WHERE id = "birdwatcher001"',
        mapper: (Map<String, Object?> row) => BirdWatcher(
            color: row['color'] as int,
            counterValue: row['counterValue'] as int));
  }

  @override
  Future<void> insertBirdWatcher(BirdWatcher watcherData) async {
    await _birdWatcherInsertionAdapter.insert(
        watcherData, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateBirdWatcher(BirdWatcher watcherData) async {
    await _birdWatcherUpdateAdapter.update(
        watcherData, OnConflictStrategy.abort);
  }
}
