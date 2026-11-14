# Sonora Player

A privacy-first local music player for Android and iOS.

## Project status

The project is in its architecture and foundation stage. The initial implementation targets Android first, while keeping the application structure portable to iOS.

## Planned stack

- Flutter and Dart
- Riverpod for application state and dependency wiring
- Drift with SQLite for the local music library
- Native playback integrations: Android Media3 and iOS AVFoundation
- Clean Architecture with feature-oriented modules

## Principles

- Local files and user-controlled sources only
- No advertising or tracking by default
- No DRM circumvention or unauthorized content sources
- Heavy scanning and indexing must not block the UI

See [PLAN.md](docs/PLAN.md), [PROGRESS.md](docs/PROGRESS.md), and [ARCHITECTURE.md](docs/ARCHITECTURE.md) for the project plan and technical decisions.

## Current implementation status

Architecture and repository foundation are being established. Playback, codec coverage, and background audio will be marked complete only after implementation and device-level verification.
