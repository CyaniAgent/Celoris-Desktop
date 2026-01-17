# 🎨 Celoris Design Guide

> *"Elegance is not just what it looks like, but how it feels."*

This document serves as the single source of truth for the visual design of **Celoris Desktop**. Based on the [Symbolism & Lore](SYMBOLISM.md), it translates abstract concepts into concrete UI specifications.

---

## 1. Color System (The "Miku-Saki" Palette)

We use a modified version of the Material 3 Color System, seeded from our primary brand colors.

### Core Colors
| Token | Color | Hex | Role |
| :--- | :--- | :--- | :--- |
| **Primary** | **Cyanite Teal** | `#39C5BB` | Main brand color. Used for FABs, active states, and key highlights. Based on Hatsune Miku. |
| **Secondary** | **Hanami Pink** | `#FF4081` | Accent color. Used for notifications, urgent alerts, and specific "v1.0" branding. Based on Saki Hanami. |
| **Background** | **Void Black** | `#121212` | The deep space background. Used for the Stage (Desktop) default color. |
| **Surface** | **Glass Grey** | `#1E1E1E` | Used for window backgrounds, with opacity applied. |

### Semantic Colors
*   **Error:** `#CF6679` (Soft Red)
*   **Success:** `#00E676` (Bright Green)
*   **Warning:** `#FFD740` (Amber)

---

## 2. Typography

Celoris uses a clean, geometric sans-serif stack to maintain clarity.

*   **Primary Font:** `Inter` (or System Default San-Serif)
*   **Monospace Font:** `JetBrains Mono` or `Fira Code` (for Terminal/Code).

### Type Scale
| Role | Size | Weight | usage |
| :--- | :--- | :--- | :--- |
| **Display Large** | 57px | Regular | Large clocks, greetings on the desktop. |
| **Headline Medium** | 28px | SemiBold | Window Titles, Modal Headers. |
| **Body Large** | 16px | Regular | Standard App text. |
| **Label Small** | 11px | Medium | Icon labels, tiny badges. |

---

## 3. Component Specs

### The "Glassmorphism" Standard
All floating elements (Dock, Window Frames, Popups) must adhere to the **Hikari Glass** standard:
*   **Blur:** `BackdropFilter` with `sigmaX: 20`, `sigmaY: 20`.
*   **Opacity:** Background color with `0.7` to `0.85` opacity.
*   **Border:** `1px` solid White with `0.1` opacity (Subtle rim light).

### 1. The Stage (Desktop)
*   **Layout:** Free-form grid.
*   **Icon Size:** `64x64` dp (Standard), `48x48` dp (Small).
*   **Grid Padding:** `16dp` from edges.

### 2. The Backstage (Dock)
*   **Height:** `80dp` (Fixed).
*   **Margin:** `16dp` from bottom.
*   **Shape:** `RoundedRectangle` with `radius: 24dp`.
*   **Icon Size:** `48x48` dp.
*   **Interaction:**
    *   *Hover:* Icon scales to `1.2x`.
    *   *Active Dot:* A small Cyan dot appears below running apps.

### 3. Application Windows
*   **Corner Radius:** `12dp` (Standard Linux/Windows feel) or `16dp` (Modern).
*   **Shadow:** `BoxShadow` with `y: 4, blur: 16` (Elevation 4).
*   **Title Bar:** `32dp` height. Clean, minimal controls.

---

## 4. Animation & Motion

*   **Standard Curve:** `Curves.easeOutCubic` (Swift/Snappy).
*   **Duration:**
    *   *Micro-interaction (Hover):* `200ms`.
    *   *Window Open/Close:* `300ms`.
    *   *Launcher Reveal:* `400ms`.

---

> *Design is intelligence made visible.*
