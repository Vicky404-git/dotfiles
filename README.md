# ⚡ Minimalist Linux Dotfiles

Welcome to my personal system configurations (dotfiles). This repository contains everything needed to replicate my exact Linux desktop environment, terminal aesthetic, and Neovim coding workflow. 

It is built to be fast, keyboard-centric, and entirely distraction-free.

## 🛠️ The Stack
This setup is currently running on **Debian 13 (Trixie)** but will work on almost any Debian/Ubuntu-based distribution.

* **Window Managers:** Dual-setup configured for both `i3` (X11) and `Hyprland` (Wayland).
* **Terminal:** `kitty` (GPU-accelerated, fast, custom fonts, glass UI).
* **Shell:** `zsh` with Oh-My-Zsh and custom aliases.
* **Code Editor:** `nvim` (Neovim powered by LazyVim, fully configured for Python/AIML development).
* **Bars & Menus:** `waybar` / `polybar` for status, `rofi` for the app launcher.
* **File Manager:** `yazi` (blazing fast terminal file manager).
* **System Monitor:** `btop`.
* **Aesthetics:** `fastfetch` + `pokemon-colorscripts` for the terminal greeting.

---

## 🚀 One-Command Install

You do not need to manually link files. I have written an interactive installation script that will download all necessary packages, back up your current configurations, and wire up the environment automatically.

Open your terminal and run:

```bash
git clone [https://github.com/Vicky404-git/dotfiles.git](https://github.com/Vicky404-git/dotfiles.git) ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```


The script will ask you whether you want to deploy the X11 (i3) or Wayland (Hyprland) stack.

## 🧠 Note on DaemonV Integration
This i3 configuration includes a built-in autostart hook for my custom context-aware system observer, DaemonV.

If you are deploying these dotfiles on your own machine and do not want to use DaemonV:
- Open i3/config and comment out line 26.

## ⌨️ Key Keybindings to Know
(Note: The 'Super' key is the Windows/Command key)

Super + Enter = Open Kitty Terminal

Super + D = Open Rofi App Launcher

Super + Shift + Q = Close the focused window

Super + [1-9] = Switch to workspace 1-9

Super + Shift + C = Reload Config

Super + Shift + E = Exit i3/Hyprland via Custom Power Menu

Built for the terminal. No mouse required.
