# Sonora Player — архитектура

## Направление
Flutter/Dart отвечает за общий UI, состояние и прикладные сценарии. Платформенные аудиовозможности реализуются нативно: Android Media3 и iOS AVFoundation.

## Слои
- **Presentation** — экраны, виджеты и Riverpod providers.
- **Application** — сценарии сканирования, поиска, очереди и управления воспроизведением.
- **Domain** — сущности и контракты репозиториев/аудиодвижка без Flutter-зависимостей.
- **Data** — Drift/SQLite, файловая система, чтение тегов и кэш обложек.
- **Platform** — нативные адаптеры Media3 и AVFoundation через стабильный plugin/channel API.

## Целевая структура
```
lib/
  app/
  core/
    database/
    errors/
    logging/
    platform/
  features/
    library/{domain,application,data,presentation}/
    player/{domain,application,data,presentation}/
    albums/
    artists/
    playlists/
    search/
    favorites/
    settings/
```

## Данные и производительность
- Drift/SQLite — источник истины для индекса медиатеки.
- Индексы по нормализованным title/artist/album и путям.
- Пагинация и lazy lists; не загружать всю медиатеку в память.
- Сканирование и анализ тегов — пакетами вне UI isolate.
- Обложки — файловый кэш с ограничением размера.
- Поиск — debounce; целевой показатель <150 мс на 10k записей.

## Воспроизведение
- Общий Dart-контракт PlayerEngine.
- Android adapter: Media3/ExoPlayer и foreground media service.
- iOS adapter: AVPlayer/AVAudioSession и background audio capability.
- Поддержку кодеков подтверждать на реальных устройствах.
- FFmpeg/другие декодеры оценивать отдельно с учётом лицензирования и размера.

## Решения
- Начать с Android, сохраняя архитектурную возможность iOS.
- Не смешивать UI с доступом к файлам и аудио API.
- Не считать UI-заглушки работающими функциями.
- Не добавлять аналитику и рекламные SDK по умолчанию.
