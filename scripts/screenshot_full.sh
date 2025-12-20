#!/bin/bash

# Ruta donde se guardan las capturas
DIRECTORIO="$HOME/Imágenes/Screenshots"
mkdir -p "$DIRECTORIO"

# Fecha y hora de la captura
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

NOMBRE="Screeenshot_$TIMESTAMP.png"

# Ruta, nombre y formato de la captura
CAPTURA="$DIRECTORIO/Screenshot_$TIMESTAMP.png"

# captura de pantalla con grim
grim "$CAPTURA"

paplay /usr/share/sounds/freedesktop/stereo/camera-shutter.oga &

# Copia la captura en el portapapeles
# cat "$CAPTURA" | wl-copy
wl-copy <"$CAPTURA"

# notify-send "Nueva captura de pantalla" "Captura guardada y copiado al portapapeles."
notify-send -i "$CAPTURA" "Screenshot Realizada " "Archivo copiado en portapapeles." # -h string:bgcolor:#1e1e2e -h string:fgcolor:#cdd6f4
