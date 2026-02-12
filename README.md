# 🐫 Camlboy-Games
A collection of homebrew Game Boy games written in Z80 Assembly, designed for the **Camlboy** OCaml emulator.

## 🕹️ Included Games
- **Bounce:** Tests Sprite-to-Background collision.
- **Palette Test:** Verifies DMG color shades and `rBGP` register mapping.
- **Snake:** Tests CPU logic and input handling for the `rP1` (Joypad) register.

## 🛠️ How to Compile
Requires [RGBDS](https://github.com/rednex/rgbds).
```bash
make
