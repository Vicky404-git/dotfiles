#!/bin/bash

# --- Color Variables for Aesthetic Output ---
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}=======================================${NC}"
echo -e "${GREEN}   Vicky-404's Universal Installer   ${NC}"
echo -e "${BLUE}=======================================${NC}"

# --- Step 1: Choose the Window Manager ---
echo "Which environment are you installing?"
echo "1) i3 (X11 - Stable, Classic)"
echo "2) Hyprland (Wayland - Modern, Animations)"
read -p "Enter 1 or 2: " wm_choice

# --- Step 2: System Update & Core Hardware Services ---
echo -e "\n${BLUE}[*] Updating package lists and existing software...${NC}"
sudo apt update -y && sudo apt upgrade -y

echo -e "\n${BLUE}[*] Installing Core Hardware Services (Wi-Fi, Bluetooth, Audio)...${NC}"
# apt automatically skips packages that are already installed and up-to-date
sudo apt install -y network-manager network-manager-gnome bluez blueman pipewire wireplumber

echo -e "\n${BLUE}[*] Enabling Network and Bluetooth Daemons...${NC}"
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now bluetooth

# --- Step 3: Install Core Terminal Utilities ---
echo -e "\n${BLUE}[*] Installing terminal utilities and aesthetics...${NC}"
sudo apt install -y kitty zsh neovim git curl wget btop rofi dunst lsd playerctl brightnessctl fastfetch

# --- Step 4: Install WM Specific Packages ---
if [ "$wm_choice" == "1" ]; then
  echo -e "${BLUE}[*] Installing i3 and X11 utilities...${NC}"
  sudo apt install -y i3 picom polybar feh flameshot
  WM_DIR="i3"
elif [ "$wm_choice" == "2" ]; then
  echo -e "${BLUE}[*] Installing Hyprland and Wayland utilities...${NC}"
  sudo apt install -y hyprland waybar swaybg
  WM_DIR="hypr"
else
  echo -e "${RED}[!] Invalid choice. Exiting.${NC}"
  exit 1
fi

# --- Step 5: Backup Existing Configurations ---
echo -e "\n${BLUE}[*] Backing up existing configurations to ~/.config/*.bak...${NC}"
mkdir -p ~/.config

# Array of folders we are about to symlink
configs=("kitty" "nvim" "btop" "rofi" "dunst" "fastfetch" "yazi" "$WM_DIR")

if [ "$wm_choice" == "1" ]; then configs+=("polybar" "picom"); fi
if [ "$wm_choice" == "2" ]; then configs+=("waybar"); fi

for config in "${configs[@]}"; do
  if [ -d "$HOME/.config/$config" ] && [ ! -L "$HOME/.config/$config" ]; then
    mv "$HOME/.config/$config" "$HOME/.config/${config}.bak"
    echo -e "Backed up $config"
  fi
done

# --- Step 6: Create the Symlinks ---
echo -e "\n${BLUE}[*] Wiring symlinks to ~/dotfiles...${NC}"

for config in "${configs[@]}"; do
  # Remove existing symlink if it exists
  rm -rf "$HOME/.config/$config" 2>/dev/null
  # Create new symlink
  ln -s "$HOME/dotfiles/$config" "$HOME/.config/$config"
  echo -e "${GREEN}✔ Linked $config${NC}"
done

# --- Step 7: Change Default Shell ---
echo -e "\n${BLUE}[*] Setting ZSH as the default shell...${NC}"
chsh -s $(which zsh)

echo -e "\n${GREEN}=======================================${NC}"
echo -e "${GREEN}   Installation Complete! 🚀           ${NC}"
echo -e "${GREEN}=======================================${NC}"
echo "Wi-Fi and Bluetooth services have been activated."
echo "Please completely reboot your system to apply all hardware changes."
