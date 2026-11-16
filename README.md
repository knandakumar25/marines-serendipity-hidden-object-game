# Serendipity (Hidden Object Game)

[![Godot Engine](https://img.shields.io/badge/Engine-Godot_4.4-blue.svg)](https://godotengine.org/)
[![Language](https://img.shields.io/badge/Language-GDScript-brightgreen.svg)]()
[![Platform](https://img.shields.io/badge/Platform-Windows_|_macOS_|_Linux-orange.svg)]()
[![Course](https://img.shields.io/badge/Course-CSC_486-purple.svg)]()
[![Team](https://img.shields.io/badge/Developed_By-The_Marines-red.svg)]()

> A timed hidden-object survival adventure where stranded castaways search across beaches, caves, and sunken shipwrecks to gather survival gear and decipher the mysteries of the ocean deity Varuna.

---

## Overview

**Serendipity** is an atmospheric 2D hidden-object puzzle game developed in **Godot 4.4** by **The Marines** for CSC 486.

Following a devastating ocean shipwreck, survivors awaken on an uncharted island. Stranded without provisions or shelter, players must scour detailed environments against a relentless countdown to locate survival essentials. As you search through the sand, subterranean caverns, and fractured ship timber, you uncover torn diary pages and lost relics illuminating the mythological presence of **Varuna**, the ocean god.

---

## Core Gameplay Features

```
       ┌────────────────────────┐
       │   Shipwreck Disaster   │
       └───────────┬────────────┘
                   ▼
       ┌────────────────────────┐
       │ Beach Scavenging (35s) │ ──> Coconuts, Berries, Firewood, Canteen
       └───────────┬────────────┘
                   ▼
       ┌────────────────────────┐
       │  Dark Cave Exploration │ ──> Flashlight Shader Mechanics, Tools
       └───────────┬────────────┘
                   ▼
       ┌────────────────────────┐
       │ Shipwreck & Lore Clues │ ──> Torn Diary Pages, Deity Varuna Relics
       └───────────┬────────────┘
                   ▼
       ┌────────────────────────┐
       │    The End / Escape    │
       └────────────────────────┘
```

### 1. Timed Scavenger Hunts
Each search scenario is bound by a strict countdown (e.g., 35-second timer). Players must quickly scan the environment to find and collect all designated items before time runs out.

### 2. Interactive Item Gathering
Click directly on concealed items within the scene. An on-screen HUD updates dynamically as items are successfully discovered:
- **Food & Sustenance**: Wild berries, ripe coconuts
- **Survival Tools & Materials**: Dry wood, axe, sickle, survival knife
- **Medical & Hydration**: Clean water canteens, glass bottles, sterile bandages

### 3. Custom Flashlight Shader (`flashlight.gd`)
In low-light environments such as the subterranean cave (`scenes/cave.tscn`), ambient light drops to pitch black. A custom 2D illumination shader anchors a dynamic circular light beam to the player's mouse cursor, requiring players to physically sweep the flashlight over dark crevices to reveal hidden items.

### 4. Narrative Journal & Lore Recovery
Scattered across the island are torn journal fragments (`torn_page.tscn`), a mariner's lost diary (`diary.tscn`), and icons of the deity Varuna (`varuna.tscn`). Discovering these reveals the island's tragic past and lore connections to the maritime universe.

---

## Controls

| Action | Input |
| :--- | :--- |
| **Search / Collect Object** | `Left Mouse Button` |
| **Move Flashlight Beam** | `Mouse Cursor` |
| **Toggle Inventory / Inspect** | `I` Key |
| **Advance / Continue** | UI On-Screen Buttons |

---

## Running the Game in Godot

### Prerequisites
- [Godot Engine 4.4](https://godotengine.org/download) (Standard Edition).

### Execution Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/knandakumar25/marines-serendipity-hidden-object-game.git
   ```
2. Launch Godot Engine and choose **Import**.
3. Select the `project.godot` file in this directory.
4. Click **Import & Edit**.
5. Press **F5** to run the project from its starting scene (`res://scenes/black.tscn`).

---

## Project Structure

```
marines-serendipity-hidden-object-game/
├── project.godot       # Godot 4.4 engine configurations and key bindings
├── scenes/             # Game scenes, UI layers, and GDScript controllers
│   ├── black.tscn / .gd      # Prologue, narrative intro, and scene transitions
│   ├── beach.tscn / .gd      # Beach shoreline item hunting scene
│   ├── cave.tscn / .gd       # Underground cave with flashlight mechanic
│   ├── ship.tscn / .gd       # Wrecked ship interior search
│   ├── the_end.tscn / .gd    # Resolution scene
│   ├── flashlight.gd         # Dynamic cursor light shader logic
│   ├── collectable.gd        # Reusable click-to-collect item component
│   └── *_orb.tscn / items    # Individual item scenes (coconut, berries, knife, etc.)
├── *.webp / *.png / *.jpg# High-resolution backdrops, textures, item sprites
└── README.md           # Project documentation
```

---

## Credits

- **Development Team**: The Marines (CSC 486)
- **Engine**: [Godot Engine](https://godotengine.org/)
