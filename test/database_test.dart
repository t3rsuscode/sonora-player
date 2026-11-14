import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sonora_player/core/database/app_database.dart';

void main() {
  late AppDatabase database;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
  });

  tearDown(() async {
    await database.close();
  });

  test('inserts and searches a track', () async {
    await database.upsertTrack(
      TracksCompanion.insert(
        path: '/music/example.flac',
        title: const Value('Northern Lights'),
        artist: const Value('Example Artist'),
        album: const Value('First Album'),
      ),
    );

    final results = await database.searchTracks('Northern');
    expect(results, hasLength(1));
    expect(results.single.title, 'Northern Lights');
  });

  test('does not return tracks for an unmatched search', () async {
    await database.upsertTrack(
      TracksCompanion.insert(path: '/music/example.mp3'),
    );

    expect(await database.searchTracks('not found'), isEmpty);
  });
}
