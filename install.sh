#!/bin/bash

# =========================================
# Vicky-404 Universal Linux Installer
# Supports:
# - Debian / Ubuntu
# - Gentoo
# =========================================

# ---------- Colors ----------
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

# ---------- Detect Distro ----------
if [ -f /etc/gentoo-release ]; then
    DISTRO="gentoo"

elif [ -f /etc/debian_version ]; then
    DISTRO="debian"

else
    DISTRO="unknown"
fi

# ---------- Detect sudo ----------
SUDO=""

if [ "$EUID" -ne 0 ]; then
    SUDO="sudo"
fi

# ---------- Banner ----------
clear

echo -e "${BLUE}===========================================${NC}"
echo -e "${GREEN}      Vicky-404 Universal Installer        ${NC}"
echo -e "${BLUE}===========================================${NC}"

echo -e "${YELLOW}Detected distro:${NC} $DISTRO"

if [ "$DISTRO" = "unknown" ]; then
    echo -e "${RED}[!] Unsupported distro${NC}"
    exit 1
fi

# ---------- WM Selection ----------
echo
echo "Choose your environment:"
echo "1) i3 (X11 - Stable, Lightweight)"
echo "2) Hyprland (Wayland - Modern)"
echo

read -p "Enter choice (1 or 2): " wm_choice

# =========================================
# PACKAGE INSTALL FUNCTIONS
# =========================================

install_debian_core() {

    echo -e "\n${BLUE}[*] Updating system...${NC}"

    $SUDO apt update -y
    $SUDO apt upgrade -y

    echo -e "\n${BLUE}[*] Installing core packages...${NC}"

    $SUDO apt install -y \
        git \
        curl \
        wget \
        vim \
        neovim \
        kitty \
        zsh \
        tmux \
        htop \
        btop \
        fastfetch \
        rofi \
        dunst \
        yazi \
        playerctl \
        brightnessctl \
        network-manager \
        network-manager-gnome \
        bluez \
        blueman \
        pipewire \
        wireplumber \
        feh \
        unzip \
        flameshot \
        picom

    echo -e "\n${BLUE}[*] Enabling services...${NC}"

    $SUDO systemctl enable --now NetworkManager
    $SUDO systemctl enable --now bluetooth
}

install_gentoo_core() {

    echo -e "\n${BLUE}[*] Syncing Portage...${NC}"

    emerge --sync

    echo -e "\n${BLUE}[*] Installing core packages...${NC}"

    emerge \
        app-editors/neovim \
        app-editors/vim \
        app-shells/zsh \
        app-shells/tmux \
        app-admin/htop \
        sys-process/btop \
        x11-terms/kitty \
        x11-misc/rofi \
        x11-misc/dunst \
        media-gfx/feh \
        app-misc/fastfetch \
        net-misc/networkmanager \
        net-wireless/blueman \
        media-video/pipewire \
        media-video/wireplumber \
        app-misc/yazi \
        media-gfx/flameshot \
        x11-misc/picom \
        dev-vcs/git \
        net-misc/curl \
        net-misc/wget

    echo -e "\n${BLUE}[*] Enabling services...${NC}"

    rc-update add NetworkManager default
    rc-update add bluetooth default

    rc-service NetworkManager start
    rc-service bluetooth start
}

# =========================================
# INSTALL CORE
# =========================================

if [ "$DISTRO" = "debian" ]; then
    install_debian_core

elif [ "$DISTRO" = "gentoo" ]; then
    install_gentoo_core
fi

# =========================================
# WINDOW MANAGER INSTALL
# =========================================

if [ "$wm_choice" = "1" ]; then

    echo -e "\n${BLUE}[*] Installing i3 setup...${NC}"

    if [ "$DISTRO" = "debian" ]; then

        $SUDO apt install -y \
            i3 \
            polybar

    elif [ "$DISTRO" = "gentoo" ]; then

        emerge \
            x11-wm/i3 \
            x11-misc/polybar
    fi

    WM_DIR="i3"

elif [ "$wm_choice" = "2" ]; then

    echo -e "\n${BLUE}[*] Installing Hyprland setup...${NC}"

    if [ "$DISTRO" = "debian" ]; then

        $SUDO apt install -y \
            hyprland \
            waybar \
            swaybg

    elif [ "$DISTRO" = "gentoo" ]; then

        emerge \
            gui-wm/hyprland \
            gui-apps/waybar \
            gui-apps/swaybg
    fi

    WM_DIR="hypr"

else
    echo -e "${RED}[!] Invalid choice${NC}"
    exit 1
fi

# =========================================
# BACKUP CONFIGS
# =========================================

echo -e "\n${BLUE}[*] Backing up configs...${NC}"

mkdir -p "$HOME/.config"

configs=(
    "kitty"
    "nvim"
    "btop"
    "rofi"
    "dunst"
    "fastfetch"
    "yazi"
    "$WM_DIR"
)

if [ "$wm_choice" = "1" ]; then
    configs+=("polybar" "picom")
fi

if [ "$wm_choice" = "2" ]; then
    configs+=("waybar")
fi

for config in "${configs[@]}"; do

    if [ -d "$HOME/.config/$config" ] && [ ! -L "$HOME/.config/$config" ]; then

        mv \
            "$HOME/.config/$config" \
            "$HOME/.config/${config}.bak"

        echo -e "${YELLOW}Backed up:${NC} $config"
    fi
done

# =========================================
# CREATE SYMLINKS
# =========================================

echo -e "\n${BLUE}[*] Creating symlinks...${NC}"

for config in "${configs[@]}"; do

    rm -rf "$HOME/.config/$config" 2>/dev/null

    ln -s \
        "$HOME/dotfiles/$config" \
        "$HOME/.config/$config"

    echo -e "${GREEN}✔ Linked:${NC} $config"
done

# =========================================
# SHELL SETUP
# =========================================

echo -e "\n${BLUE}[*] Setting zsh as default shell...${NC}"

chsh -s "$(which zsh)"

# =========================================
# FINAL MESSAGE
# =========================================

echo
echo -e "${GREEN}===========================================${NC}"
echo -e "${GREEN}         Installation Complete 🚀          ${NC}"
echo -e "${GREEN}===========================================${NC}"

echo
echo -e "${YELLOW}Next Steps:${NC}"
echo "1. Reboot system"
echo "2. Login into i3/Hyprland"
echo "3. Run: fastfetch"
echo "4. Enjoy the setup"
echo
