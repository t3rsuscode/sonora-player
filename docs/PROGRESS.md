# Sonora Player — прогресс

## Текущий статус
Этап 1: архитектурная основа и UI-каркас.

## Выполнено
- Репозиторий инициализирован.
- Добавлен Flutter package manifest с Riverpod и Drift.
- Добавлена точка входа с ProviderScope.
- Добавлена навигация между библиотекой и плеером.
- Добавлены начальные UI-экраны.
- Добавлен smoke widget test.
- Добавлены план и архитектурные решения.

## Пока не реализовано
- Сканирование локальных файлов.
- Drift schema и database bindings.
- Воспроизведение аудио.
- Фоновый сервис, media controls и lock-screen интеграция.
- Android/iOS platform directories и APK.

## Следующая проверка
В среде с Flutter SDK выполнить:
1. `flutter pub get`
2. `dart format .`
3. `flutter analyze`
4. `flutter test`

Затем добавить платформенные проекты и перейти к модели медиатеки.
