import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Твоя музыка', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text(
            'Локальная музыкальная библиотека будет собрана на устройстве.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          const _LibraryAction(
            icon: Icons.folder_open,
            title: 'Добавить музыку',
            subtitle: 'Выбрать папку или файлы на устройстве',
          ),
          const SizedBox(height: 12),
          const _LibraryAction(
            icon: Icons.album_outlined,
            title: 'Альбомы',
            subtitle: 'Альбомы появятся после сканирования',
          ),
          const SizedBox(height: 12),
          const _LibraryAction(
            icon: Icons.person_outline,
            title: 'Исполнители',
            subtitle: 'Треки будут сгруппированы по исполнителям',
          ),
          const SizedBox(height: 12),
          const _LibraryAction(
            icon: Icons.queue_music,
            title: 'Плейлисты',
            subtitle: 'Создавай собственные подборки',
          ),
          const SizedBox(height: 28),
          const Center(
            child: Text('Сканирование медиатеки — следующий этап разработки.'),
          ),
        ],
      ),
    );
  }
}

class _LibraryAction extends StatelessWidget {
  const _LibraryAction({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, size: 28),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}
