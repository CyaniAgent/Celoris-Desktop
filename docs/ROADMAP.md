# 🗺️ Celoris Desktop Roadmap

This document outlines the development trajectory of **Celoris Desktop**, from its initial UI prototyping to its final form as the native shell of **Cyanite OS**.

The roadmap is divided into four distinct "Acts," mirroring the progression of a stage performance.

---

## 🎭 Act I: The Rehearsal (UI Prototyping)
**Version Target:** v0.1.0 — v0.3.0
**Focus:** Visual Fidelity & "App Experience Mode"

The goal of this phase is to establish the visual language (Material Design 3) and the core architectural patterns without worrying about low-level system integration.

- [ ] **Core Architecture Setup**
    - [ ] Initialize Flutter project structure.
    - [ ] Implement `SystemDelegate` interface for the "App Experience Mode" (Mock Data).
    - [ ] Set up `Riverpod` for global state management.

- [ ] **The Stage (Desktop Area)**
    - [ ] Implement dynamic wallpaper support.
    - [ ] Create the "Icon Grid" layout algorithm.
    - [ ] Integrate `material_color_utilities` for wallpaper-based dynamic theming.

- [ ] **The Backstage (Dock)**
    - [ ] Build the responsive Dock widget with hover animations.
    - [ ] Implement "Minimization" animations (Scale & Opacity).

- [ ] **The Curtain (Launcher)**
    - [ ] Create the App Drawer UI with search functionality.
    - [ ] Implement basic categorization UI (even with mock data).

---

## 🎬 Act II: The Debut (Linux Integration)
**Version Target:** v0.4.0 — v0.8.0
**Focus:** "Linux Desktop Mode" (Wayland)

The goal is to make Celoris a functional Desktop Environment (DE) that can replace GNOME or KDE on a standard Linux distribution (e.g., Arch Linux).

- [ ] **System Plumbing (Linux)**
    - [ ] Implement `LinuxWaylandDelegate`.
    - [ ] **App Discovery:** Parse `.desktop` files from `/usr/share/applications` via `xdg_directories`.
    - [ ] **Icon Loading:** Implement a GTK icon theme parser to load system icons into Flutter.
    - [ ] **Process Management:** Ability to launch apps (`Process.start`) and track their PID.

- [ ] **Wayland Shell Integration**
    - [ ] Integrate with `flutter-pi` or a custom Wayland compositor backend.
    - [ ] Implement Window Decoration (Title bars) for non-CSD (Client-Side Decoration) apps.

- [ ] **System Status**
    - [ ] Fetch real-time battery, volume, and brightness via `dbus` or `/sys/class`.
    - [ ] Implement the "Control Center" (Quick Settings) panel.

---

## 🌟 Act III: The Premiere (Cyanite "Hanami")
**Version Target:** v0.9.0 — v1.0.0 (Code: Hanami)
**Focus:** "Cyanite Mode" & Hikari Kernel Integration

This phase marks the transition from a "Linux Skin" to a "Native OS Shell." This is the official release for the Cyanite OS v1.0.

- [ ] **Hikari Kernel Bridge**
    - [ ] Implement `CyaniteNativeDelegate`.
    - [ ] Use `dart:ffi` to bind to custom Hikari Syscalls (e.g., `hikari_set_stage_focus`).
    - [ ] **Performance:** Implement the "Overdrive Scheduler" trigger (UI tells Kernel to prioritize foreground app).

- [ ] **QMS Visualization**
    - [ ] Visual distinction between "Native Apps" and "QMS (Linux) Apps."
    - [ ] **Quantum Container UI:** Add a subtle "Cyan Glow" border to Linux apps running via QMS.

- [ ] **Stargazer Tools**
    - [ ] Implement "God Mode" visual indicators when Root privileges are active.
    - [ ] **Resonance Link (Basic):** Show a notification/widget when a paired mobile device is nearby.

---

## 🔮 Act IV: The World Tour (Ecosystem Expansion)
**Version Target:** v1.1.0+ (Code: Tsukimura / Fujita)
**Focus:** Refinement, Customization & "Resonance"

- [ ] **Advanced Resonance Link**
    - [ ] "Handoff" media playback from phone to desktop instantly.
    - [ ] Shared clipboard between devices.

- [ ] **The "Module" Store**
    - [ ] A dedicated UI for the `Module` package manager.
    - [ ] Support for downloading community-made Themes and Wallpapers.

- [ ] **Time Machine (CYAN FS)**
    - [ ] UI for browsing file system snapshots (visualized as a timeline).

---

## 📅 Estimated Timeline

| Phase | Estimated Duration | Key Deliverable |
| :--- | :--- | :--- |
| **Act I** | Months 1-2 | A draggable, clickable UI demo on Windows. |
| **Act II** | Months 3-6 | A daily-driver DE on Arch Linux. |
| **Act III** | Months 7-12 | Cyanite OS Alpha ISO with Celoris pre-installed. |
| **Act IV** | Year 2+ | Ecosystem maturity. |