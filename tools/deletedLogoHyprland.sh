#!/bin/bash
# ============================
# Remove Plymouth + Hyprland Logo
# ============================

set -e

LOG_FILE="/tmp/remove-plymouth.log"
MKINITCPIO_CONF="/etc/mkinitcpio.conf"
GRUB_CONF="/etc/default/grub"
PLYMOUTH_THEME_DIR="/usr/share/plymouth/themes"

ACTION="\e[34m[ ACTION ]\e[0m"
OK="\e[32m[  OK  ]\e[0m"
ERROR="\e[31m[ ERROR ]\e[0m"
NOTE="\e[33m[ NOTE ]\e[0m"

echo -e "$ACTION Starting Plymouth removal...$RESET"

# Step 1: Remove Hyprland Plymouth theme if exists
if [ -d "$PLYMOUTH_THEME_DIR/hyprland-logo" ]; then
  echo -e "$ACTION Removing Hyprland Plymouth theme...$RESET"
  sudo rm -rf "$PLYMOUTH_THEME_DIR/hyprland-logo"
  echo -e "$OK Hyprland theme removed.$RESET"
else
  echo -e "$NOTE Hyprland theme not found. Skipping.$RESET"
fi

# Step 2: Remove plymouth hook from mkinitcpio.conf
if grep -q "plymouth" "$MKINITCPIO_CONF"; then
  echo -e "$ACTION Removing plymouth hook from mkinitcpio.conf...$RESET"
  sudo sed -i 's/plymouth//g' "$MKINITCPIO_CONF"
  echo -e "$OK Removed plymouth hook.$RESET"
else
  echo -e "$NOTE Plymouth hook not present in mkinitcpio.conf.$RESET"
fi

# Step 3: Remove quiet splash from GRUB
if [ -f "$GRUB_CONF" ]; then
  echo -e "$ACTION Removing quiet splash from GRUB config...$RESET"
  sudo sed -i 's/quiet splash//g; s/quiet//g; s/splash//g' "$GRUB_CONF"
  sudo grub-mkconfig -o /boot/grub/grub.cfg &>>"$LOG_FILE"
  echo -e "$OK GRUB updated successfully.$RESET"
else
  echo -e "$ERROR $GRUB_CONF not found. Skipping GRUB update.$RESET"
fi

# Step 4: Rebuild initramfs
echo -e "$ACTION Rebuilding initramfs...$RESET"
sudo mkinitcpio -P &>>"$LOG_FILE"
echo -e "$OK Initramfs rebuilt.$RESET"

# Step 5: Uninstall Plymouth
if pacman -Qi plymouth &>/dev/null; then
  echo -e "$ACTION Removing Plymouth package...$RESET"
  sudo pacman -Rns --noconfirm plymouth &>>"$LOG_FILE"
  echo -e "$OK Plymouth removed completely.$RESET"
else
  echo -e "$NOTE Plymouth not installed. Skipping.$RESET"
fi

echo -e "$OK !! Plymouth and Hyprland logo theme have been removed. Reboot to apply changes. !!$RESET"
