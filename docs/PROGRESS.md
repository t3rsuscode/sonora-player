# Sonora Player — прогресс

## Текущий статус
Этап 2: фундамент локальной медиатеки.

## Выполнено
- Репозиторий инициализирован.
- Flutter package, Riverpod и Drift подключены в манифесте.
- Базовая навигация и UI-заготовки библиотеки/плеера.
- Drift-таблица Tracks с уникальным путём и индексами title/artist/album.
- Базовые операции: поток треков, поиск, вставка/замена, удаление и избранное.
- Riverpod providers для базы и потока библиотеки.
- Экран библиотеки подключён к потоку БД.

## Пока не реализовано
- Генерация app_database.g.dart и проверка компиляции в Flutter SDK.
- Фактическое сканирование MediaStore/локальных файлов.
- Воспроизведение аудио и фоновые media controls.
- Android/iOS platform directories и APK.

## Следующая проверка
В среде с Flutter SDK выполнить:
1. `flutter pub get`
2. `dart run build_runner build --delete-conflicting-outputs`
3. `dart format .`
4. `flutter analyze`
5. `flutter test`

Далее реализовать Android MediaStore scanner с runtime permissions и прогрессом.
