import 'package:flutter/material.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Сейчас играет')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: const SizedBox(
                  width: 240,
                  height: 240,
                  child: Icon(Icons.music_note, size: 96),
                ),
              ),
              const SizedBox(height: 28),
              Text('Ничего не воспроизводится',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              const Text('Выбери трек из библиотеки, чтобы начать.'),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: null,
                    icon: const Icon(Icons.shuffle),
                    iconSize: 28,
                  ),
                  const SizedBox(width: 12),
                  IconButton.filled(
                    onPressed: null,
                    icon: const Icon(Icons.play_arrow),
                    iconSize: 36,
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    onPressed: null,
                    icon: const Icon(Icons.repeat),
                    iconSize: 28,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
