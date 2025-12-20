#!/bin/bash

# Obtener estado del micrófono
MUTE=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}')
VOLUME=$(pactl get-source-volume @DEFAULT_SOURCE@ | awk '/Volume:/ {print $5}' | tr -d '%')

# Manejar argumentos (para cambios desde Waybar)
case "$1" in
"toggle")
  pactl set-source-mute @DEFAULT_SOURCE@ toggle
  ;;
"up")
  pactl set-source-volume @DEFAULT_SOURCE@ +5%
  ;;
"down")
  pactl set-source-volume @DEFAULT_SOURCE@ -5%
  ;;
esac

# Actualizar valores después de cambios
MUTE=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}')
VOLUME=$(pactl get-source-volume @DEFAULT_SOURCE@ | awk '/Volume:/ {print $5}' | tr -d '%')

# Mostrar icono según estado
if [ "$MUTE" = "yes" ]; then
  echo "{\"text\":\"󰍭 0%\", \"tooltip\":\"Micrófono silenciado\", \"class\":\"muted\"}"
else
  echo "{\"text\":\"󰍬 $VOLUME%\", \"tooltip\":\"Volumen del micrófono: $VOLUME%\", \"class\":\"unmuted\"}"
fi
