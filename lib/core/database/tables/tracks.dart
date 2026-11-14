import 'package:drift/drift.dart';

@DataClassName('Track')
@TableIndex(name: 'tracks_title_idx', columns: {#title})
@TableIndex(name: 'tracks_artist_idx', columns: {#artist})
@TableIndex(name: 'tracks_album_idx', columns: {#album})
class Tracks extends Table {
  IntColumn get id => integer().autoIncrement()();

  /// Stable media URI or canonical file path used for de-duplication.
  TextColumn get path => text().unique()();

  TextColumn get title => text().withDefault(const Constant('Unknown title'))();
  TextColumn get artist => text().withDefault(const Constant('Unknown artist'))();
  TextColumn get album => text().withDefault(const Constant('Unknown album'))();
  TextColumn get albumArtist => text().nullable()();
  TextColumn get genre => text().nullable()();
  TextColumn get mimeType => text().nullable()();
  TextColumn get artworkPath => text().nullable()();

  IntColumn get durationMs => integer().nullable()();
  IntColumn get fileSizeBytes => integer().nullable()();
  IntColumn get trackNumber => integer().nullable()();
  IntColumn get discNumber => integer().nullable()();

  DateTimeColumn get dateAdded =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get lastModified => dateTime().nullable()();
  DateTimeColumn get lastPlayedAt => dateTime().nullable()();

  IntColumn get playCount => integer().withDefault(const Constant(0))();
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();
}
