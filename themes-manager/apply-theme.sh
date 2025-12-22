#!/usr/bin/env bash

set -e 

THEME="$1"
BASE_DIR="$HOME/.config/themes-manager"
THEME_DIR="$BASE_DIR/themes/$THEME"
CURRENT_DIR="$BASE_DIR/current"

if [[ -z "$THEME" ]]; then 
  echo "Uso: apply-theme.sh <nombre-del-tema>"
  exit 1
fi 

if [[ ! -d "$THEME_DIR" ]]; then 
  echo "Tema no encontrado: $THEME"
  exit 1
fi 

echo "Aplicando tema: $THEME"

# Waybar 
if [[ -f "$THEME_DIR/waybar.css" ]]; then 
  ln -sf "$THEME_DIR/waybar.css" "$HOME/.config/waybar/current.css"
  pkill -SIGUSR2 waybar 2>/dev/null || true
fi 

# Kitty
if [[ -f "$THEME_DIR/kitty.conf" ]]; then 
  ln -sf "$THEME_DIR/kitty.conf" "$HOME/.config/kitty/theme.conf"
  kitty @ set-colors --all "$HOME/.config/kitty/theme.conf" 2>/dev/null || true
fi 

# Hyprland
if [[ -f "$THEME_DIR/hyprland.conf" ]]; then 
  ln -sf "$THEME_DIR/hyprland.conf" "$HOME/.config/hypr/theme.conf"
  hyprctl reload 2>/dev/null || true 
fi

# Rofi
if [[ -f "$THEME_DIR/rofi.rasi" ]]; then 
  ln -sf "$THEME_DIR/rofi.rasi" "$HOME/.config/rofi/theme.rasi"
fi

# Dunst
if [[ -f $THEME_DIR/dunst.conf ]]; then 
  ln -sf "$THEME_DIR/dunst.conf" "$HOME/.config/dunst/dunstrc.d/current.conf"
  dunstctl reload 2>/dev/null || pkill dunst && dunst &
fi

echo "Tema '$THEME' aplicado correctamente"
