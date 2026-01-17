<div align="center">

# 💫 Celoris Desktop

**The Next-Generation Desktop Environment for Cyanite OS**

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.0-0175C2?logo=dart)](https://dart.dev)
[![Style](https://img.shields.io/badge/Style-Material_3-6750A4?logo=material-design)](https://m3.material.io/)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)

*Concept Art / Experimental Build*

[Design Philosophy](#-design-philosophy) • [Running Modes](#-running-modes) • [Installation](#-installation) • [Roadmap](#-roadmap)

</div>

---

## 🌌 Introduction

**Celoris Desktop** is the official desktop environment for the upcoming **Cyanite OS**. It is built with **Flutter**, utilizing the expressive power of Dart to create a fluid, beautiful, and highly responsive user interface.

Embracing the **Material Design 3** language, Celoris reimagines the desktop experience with a focus on "Stage Presence" — where every app is a performer, and the user is the producer.

> *"The stage is set. The lights are on. It's time to perform."* — Stargazer

## 🎨 Design Philosophy

Celoris is distinct from traditional desktop environments. It uses a theatrical metaphor for its UI components:

*   **Stage (Desktop):** The main workspace where windows reside.
*   **Backstage (Dock/Taskbar):** Where running apps wait for their cue.
*   **Curtain (Launcher):** The app drawer that reveals your installed modules.
*   **Spotlight (Window Manager):** The focus system that highlights the active task.

## 🚀 Running Modes

Celoris is designed to be versatile. It adapts its behavior based on the host operating system.

### 1. 🎭 App Experience Mode (Demo)
*   **Target:** Windows / macOS
*   **Description:** Runs as a standalone windowed application.
*   **Purpose:** For designers and developers to test the UI/UX animations and Material 3 theming without replacing the host OS shell.
*   **Limitations:** System settings (Wi-Fi, Bluetooth, Audio) are mocked and functionally disabled.

### 2. 🐧 Linux Desktop Mode (Wayland)
*   **Target:** Linux (Arch, Debian, etc.)
*   **Protocol:** Wayland
*   **Description:** Acts as a full-screen Desktop Shell.
*   **Features:**
    *   Reads `.desktop` files from `/usr/share/applications`.
    *   Categorizes apps automatically.
    *   Launches Linux native apps via `Process.run`.
    *   System tray integration (Experimental).

### 3. 💠 Cyanite Mode (Coming Soon)
*   **Target:** Cyanite OS (Bare Metal / QMS)
*   **Protocol:** Custom **Hikari Protocol** & Wayland
*   **Description:** The ultimate form of Celoris.
*   **Features:**
    *   Direct communication with **Hikari Kernel**.
    *   **Resonance Link** support (Device continuity).
    *   **Zero-Latency** rendering pipeline.

## 🛠️ Development & Build

### Prerequisites
*   Flutter SDK (Channel stable)
*   Clang/Ninja (for Linux builds)
*   Visual Studio (for Windows builds)
*   Xcode (for macOS builds)

### Getting Started

Clone the repository:
```bash
git clone https://github.com/CyaniAgent/Celoris-Desktop.git
cd Celoris-Desktop

Run in App Experience Mode (Default)
```bash
flutter run -d windows  # or macos
```

Run in Linux Desktop Mode
Ensure you are in a Wayland session.
```bash
# Pass the mode flag to enable shell logic
flutter run -d linux --dart-define=MODE=linux_shell
```

### 📂 Project Structure
lib/
├── core/
│   ├── env/            # Platform Adaptors (The magic behind Running Modes)
│   └── styles/         # MD3 Theme Extensions & Color Seeds
├── modules/
│   ├── curtain/        # App Launcher Logic
│   ├── backstage/      # Dock & Status Bar
│   └── stage/          # Wallpaper & Widgets
└── platforms/          # FFI Bindings for Linux/Cyanite

### 🤝 Contribution
We welcome Stargazers from all over the world!
If you love **Hatsune Miku, THE IDOLM@STER Gakuen**, or just sleek UI design, feel free to open a PR.

### 📄 License
This project is licensed under the MIT License - see the LICENSE file for details.

<div align="center">
Built with 💙 for Miku & Saki Hanami
</div>
