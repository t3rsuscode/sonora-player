import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/database_provider.dart';

class LibraryScreen extends ConsumerWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tracks = ref.watch(libraryTracksProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sonora'),
        actions: [
          IconButton(
            tooltip: 'Поиск',
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            tooltip: 'Настройки',
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: tracks.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text('Не удалось открыть медиатеку: $error'),
          ),
        ),
        data: (items) {
          if (items.isEmpty) {
            return ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Text(
                  'Твоя музыка',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  'Здесь появятся аудиофайлы, добавленные в медиатеку.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 32),
                Icon(
                  Icons.library_music_outlined,
                  size: 72,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(height: 16),
                const Center(child: Text('Пока нет добавленных треков')),
                const SizedBox(height: 8),
                const Center(
                  child: Text('Импорт и сканирование устройства — следующий шаг.'),
                ),
              ],
            );
          }

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final track = items[index];
              return ListTile(
                leading: const CircleAvatar(child: Icon(Icons.music_note)),
                title: Text(
                  track.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  '${track.artist} • ${track.album}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {},
              );
            },
          );
        },
      ),
    );
  }
}
