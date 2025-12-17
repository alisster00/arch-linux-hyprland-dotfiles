#!/usr/bin/env bash 

BASE_DIR="$HOME/.config/themes-manager/"
THEMES_DIR="$BASE_DIR/themes"

THEME=$(ls "$THEMES_DIR" | rofi -dmenu -p " 󰔎 Themes ")

if [[ -n "$THEME" ]]; then 
  "$BASE_DIR/apply-theme.sh" "$THEME"
fi
