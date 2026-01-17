Here is the `ARCHITECTURE.md` file for the **Celoris Desktop** project. It is written in English, formatted in 
# 🏛️ Celoris Desktop Architecture

This document outlines the technical architecture, technology stack, and design patterns used in **Celoris Desktop**. The project aims to provide a unified, fluid desktop experience using Flutter, scalable across simulated environments (Windows/macOS), standard Linux (Wayland), and the native Cyanite OS.

## 1. Technology Stack

### Core Technologies
*   **Language:** [Dart 3.x](https://dart.dev) (Null Safety enabled)
*   **UI Framework:** [Flutter](https://flutter.dev) (Stable Channel)
*   **Design System:** [Material Design 3 (M3)](https://m3.material.io)
*   **Low-Level Interop:** `dart:ffi` (Foreign Function Interface) for C/C++ binding.

### Key Libraries & Packages
*   **State Management:** `flutter_riverpod` (For reactive state caching and dependency injection).
*   **Immutability:** `freezed` & `json_serializable`.
*   **Window Management (Cross-Platform):** `window_manager` & `bitsdojo_window` (For App Experience Mode).
*   **Linux Integration:** `xdg_directories`, `dbus` (For Linux Desktop Mode).
*   **Color Utilities:** `material_color_utilities` (For dynamic wallpaper-based theming).

---

## 2. Architectural Pattern

Celoris follows a **Layered Architecture** combined with the **Adapter Pattern** to handle the distinct "Running Modes."

### High-Level Layers

```mermaid
graph TD
    UI[Presentation Layer (Stage/Backstage)] --> Domain[Domain Layer (Logic/Entities)]
    Domain --> Infra[Infrastructure Layer (Repositories)]
    Infra --> Adapter[Platform Adapter Interface]
    
    Adapter -->|Impl| Win[Windows/macOS Mock]
    Adapter -->|Impl| Linux[Linux Wayland/DBus]
    Adapter -->|Impl| Cyan[Cyanite/Hikari Native]
```

1.  **Presentation Layer (UI):**
    *   Contains Flutter Widgets.
    *   Strictly follows Material 3 guidelines.
    *   **Components:** `Stage` (Desktop), `Backstage` (Dock), `Curtain` (Launcher).
    *   **State:** Uses `Riverpod` Providers to listen to changes.

2.  **Domain Layer (Business Logic):**
    *   Pure Dart code. Platform agnostic.
    *   Defines entities like `AppModel`, `WindowModel`, `SystemStatus`.
    *   Contains use cases (e.g., `LaunchAppUseCase`, `SortAppsByCategory`).

3.  **Infrastructure Layer (Platform Control):**
    *   Handles data retrieval and system commands.
    *   **The Adapter Core:** This is the most critical part of Celoris.

---

## 3. The Running Mode Adapter System

To support the three distinct running modes, Celoris uses an abstract base class (Interface) injected at runtime.

### The Interface: `SystemDelegate`
Located in `lib/core/env/system_delegate.dart`.

```dart
abstract class SystemDelegate {
  Future<List<AppModel>> getInstalledApps();
  Future<void> launchApp(String appId);
  Stream<double> getBatteryLevel();
  Future<void> shutdown();
}
```

### Implementations

#### A. App Experience Mode (Simulated)
*   **File:** `lib/core/env/impl/desktop_mock_delegate.dart`
*   **Target:** Windows, macOS.
*   **Behavior:** Returns hardcoded/mock data.
    *   *Battery:* Always returns 100% or simulates a drain loop.
    *   *Apps:* Returns a static list of "Demo Apps" (e.g., "Settings", "Music").
    *   *Launch:* specific apps open internal Flutter routes; others show a "Not supported in Demo" toast.

#### B. Linux Desktop Mode (Real-World)
*   **File:** `lib/core/env/impl/linux_wayland_delegate.dart`
*   **Target:** Linux (Wayland/X11).
*   **Behavior:**
    *   *Apps:* Parses standard `.desktop` files from `/usr/share/applications` and `~/.local/share/applications`.
    *   *Icons:* Looks up system GTK icon themes.
    *   *Launch:* Uses `Process.start` to detach and spawn processes.
    *   *Window Protocol:* Communicates with the Wayland Compositor (via FFI or helper CLI tools) to manage surface placement.

#### C. Cyanite Mode (Native/Experimental)
*   **File:** `lib/core/env/impl/cyanite_native_delegate.dart`
*   **Target:** Cyanite OS (QMS).
*   **Behavior:**
    *   Uses `dart:ffi` to call **Hikari Kernel** syscalls directly.
    *   Integrates with the **Resonance Link** subsystem for device continuity.
    *   Implements the custom "Stage Protocol" for zero-latency rendering.

---

## 4. Component Design (The Lore)

The codebase uses specific terminology to reflect the project's design philosophy.

| Component | Technical Name | Responsibility |
| :--- | :--- | :--- |
| **Stage** | `DesktopScaffold` | The root container. Manages the wallpaper, desktop icons grid, and window z-indexing (Stack). |
| **Backstage** | `DockWidget` | The taskbar. Handles running app indicators, pinned apps, and system tray (status indicators). |
| **Curtain** | `AppLauncherOverlay` | The app drawer. Implements grid view, search filtering, and categorization logic. |
| **Spotlight** | `WindowFrame` | The window decoration widget. Handles title bars, close/minimize buttons, and focus states. |
| **Terminagi** | `TerminalWidget` | An embedded terminal emulator widget (xterm.dart) integrated into the system. |

---

## 5. Directory Structure

```text
lib/
├── main.dart                  # Entry point (Dependency Injection setup)
├── app.dart                   # Root Material App config
├── core/
│   ├── constants/             # Assets paths, global strings
│   ├── env/                   # SystemDelegate Interface & Implementations
│   ├── theme/                 # Material 3 ColorSeeds and Typography
│   └── utils/                 # FFI helpers, String extensions
├── data/
│   ├── models/                # AppModel, SystemState (Freezed classes)
│   └── repositories/          # AppRepository (Data fetching logic)
└── features/
    ├── stage/                 # Desktop background & Window Stack logic
    ├── backstage/             # Dock & Status Bar UI
    ├── curtain/               # Launcher UI & Search logic
    └── settings/              # Internal System Settings UI
```

## 6. Build Pipeline & Flags

Since the project supports multiple modes, we use compile-time flags to determine the environment.

**Build for Linux Desktop (Wayland):**
```bash
flutter build linux --release --dart-define=MODE=linux_shell
```

**Build for Windows (App Experience):**
```bash
flutter build windows --release --dart-define=MODE=demo
```

**Build for Cyanite (Cross-compilation):**
```bash
Coming Soon.
```

## 7. Future Considerations (Cyanite Roadmap)

*   **Hikari Protocol:** A custom binary protocol over a shared memory socket is planned to replace standard Wayland interactions for higher performance in Cyanite OS.
*   **QMS Integration:** The `Curtain` launcher will eventually distinguish between "Native Cyan Apps" and "Containerized Linux Apps" visually (e.g., adding a specific badge or glow effect).