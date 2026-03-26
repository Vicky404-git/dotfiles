# ⚡ Minimalist Linux Dotfiles

Welcome to my personal system configurations (dotfiles). This repository contains everything needed to replicate my exact Linux desktop environment, terminal aesthetic, and Neovim coding workflow. 

It is built to be fast, keyboard-centric, and entirely distraction-free.

## 🛠️ The Stack
This setup is currently running on **Debian 13 (Trixie)** but will work on almost any Linux distribution (Arch, Ubuntu, Fedora, etc.).

* **Window Managers:** Dual-setup configured for both `i3` (X11) and `Hyprland` (Wayland).
* **Terminal:** `kitty` (GPU-accelerated, fast, custom fonts).
* **Shell:** `zsh` with Oh-My-Zsh and custom aliases.
* **Code Editor:** `nvim` (Neovim powered by LazyVim, fully configured for Python/AIML).
* **Bars & Menus:** `waybar` / `polybar` for status, `rofi` for the app launcher.
* **File Manager:** `yazi` (blazing fast terminal file manager).
* **System Monitor:** `btop`.
* **Aesthetics:** `fastfetch` + `pokemon-colorscripts` for the terminal greeting.

---

## 🚀 For Beginners: What is this?
In Linux, hidden configuration files (the ones that control how your desktop looks and acts) are called "dotfiles" because they usually live in hidden folders that start with a dot (like `~/.config`). 

By downloading this repository, you can instantly apply my custom fonts, colors, transparency, and keyboard shortcuts to your own laptop.

---

## ⚙️ How to Install (Safely)

> **⚠️ Warning:** Do not just copy-paste this blindly if you already have a custom setup. This will override your current configurations! 

### 1. Clone the Repository
Open your terminal and download this folder to your home directory:
```bash
cd ~
git clone [https://github.com/YOUR_GITHUB_NAME/dotfiles.git](https://github.com/YOUR_GITHUB_NAME/dotfiles.git)
```
``` 
```
```
### 2. Backup Your Old Stuff
Before linking my configs, rename your old ~/.config folders so you don't lose them:

Bash
mv ~/.config/i3 ~/.config/i3.backup
mv ~/.config/kitty ~/.config/kitty.backup
mv ~/.config/nvim ~/.config/nvim.backup
3. Create the Symlinks
We use "symlinks" (symbolic links). This creates a shortcut in your .config folder that points directly to this downloaded repository. Run these commands:

Bash
ln -s ~/dotfiles/i3 ~/.config/i3
ln -s ~/dotfiles/kitty ~/.config/kitty
ln -s ~/dotfiles/rofi ~/.config/rofi
ln -s ~/dotfiles/fastfetch ~/.config/fastfetch
ln -s ~/dotfiles/nvim ~/.config/nvim
(Repeat this command for any other apps in this repo you want to use, like hypr, waybar, or yazi).

4. Reload Your System
For i3: Press Super + Shift + C to reload the config.

For Kitty/Neovim: Close the terminal and open a new one.

⌨️ Key Keybindings to Know
(Note to friends: The 'Super' key is the Windows/Command key)

Super + Enter = Open Kitty Terminal

Super + D = Open Rofi App Launcher

Super + Shift + Q = Close the focused window

Super + [1-9] = Switch to workspace 1-9

Super + Shift + E = Exit i3/Hyprland
