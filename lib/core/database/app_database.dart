import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'tables/tracks.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Tracks])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'sonora_library'));

  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 1;

  Stream<List<Track>> watchAllTracks() {
    return (select(tracks)
          ..orderBy([
            (row) => OrderingTerm(expression: row.title),
            (row) => OrderingTerm(expression: row.artist),
          ]))
        .watch();
  }

  Future<List<Track>> searchTracks(String query) {
    final normalizedQuery = query.trim();
    if (normalizedQuery.isEmpty) {
      return (select(tracks)
            ..orderBy([(row) => OrderingTerm(expression: row.title)]))
          .get();
    }

    return (select(tracks)
          ..where(
            (row) =>
                row.title.contains(normalizedQuery) |
                row.artist.contains(normalizedQuery) |
                row.album.contains(normalizedQuery),
          )
          ..orderBy([(row) => OrderingTerm(expression: row.title)]))
        .get();
  }

  Future<int> upsertTrack(TracksCompanion entry) {
    return into(tracks).insert(
      entry,
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<int> removeTrackByPath(String path) {
    return (delete(tracks)..where((row) => row.path.equals(path))).go();
  }

  Future<int> setFavorite(int trackId, bool isFavorite) {
    return (update(tracks)..where((row) => row.id.equals(trackId))).write(
      TracksCompanion(isFavorite: Value(isFavorite)),
    );
  }
}
