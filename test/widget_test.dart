import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sonora_player/app/sonora_app.dart';

void main() {
  testWidgets('shows the library and player navigation', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: SonoraApp()));

    expect(find.text('Твоя музыка'), findsOneWidget);
    expect(find.text('Библиотека'), findsOneWidget);
    expect(find.text('Плеер'), findsOneWidget);

    await tester.tap(find.text('Плеер'));
    await tester.pumpAndSettle();

    expect(find.text('Ничего не воспроизводится'), findsOneWidget);
  });
}
