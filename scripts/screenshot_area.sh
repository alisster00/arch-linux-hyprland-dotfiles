#!/bin/bash

#
#LOCKFILE="/tmp/screenshot.lock"
#if [ -f "$LOCKFILE" ]; then
#    exit 1
#fi
#touch "$LOCKFILE"
#trap 'rm -f "$LOCKFILE"' EXIT

# Ruta del directorio
RUTA="$HOME/Imágenes/Screenshots"
mkdir -p "$RUTA"

# Fecha y hora de la captura
FECHA=$(date +"%Y-%m-%d_%H-%M-%S")

# Ruta, nombre y formato
CAPTURA="$RUTA/Screenshot_$FECHA.png"

# Selecciona un área de la pantalla con slurp y recorta con grim
grim -g "$(slurp)" "$CAPTURA"

# Copia la captura en clipboard
cat "$CAPTURA" | wl-copy

notify-send -i "$CAPTURA" "Screenshot Realizada " "Archivo copiado en portapapeles."
