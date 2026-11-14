import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sonora_player/app/sonora_app.dart';
import 'package:sonora_player/core/database/app_database.dart';
import 'package:sonora_player/core/database/database_provider.dart';

void main() {
  testWidgets('shows the library and player navigation', (tester) async {
    final database = AppDatabase.forTesting(NativeDatabase.memory());
    addTearDown(database.close);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          databaseProvider.overrideWith((ref) => database),
        ],
        child: const SonoraApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Твоя музыка'), findsOneWidget);
    expect(find.text('Библиотека'), findsOneWidget);
    expect(find.text('Плеер'), findsOneWidget);

    await tester.tap(find.text('Плеер'));
    await tester.pumpAndSettle();

    expect(find.text('Ничего не воспроизводится'), findsOneWidget);
  });
}
