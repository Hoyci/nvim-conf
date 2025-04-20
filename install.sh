#!/usr/bin/env bash

set -e

NERD_FONT="FiraCode"
VERSION="3.1.1"
URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v${VERSION}/${NERD_FONT}.zip"
TEMP_DIR="/tmp/nerd-fonts"

# Detecta o SO
OS="$(uname -s)"
IS_WINDOWS=false
IS_LINUX=false

if [[ "$OS" == "Linux" ]]; then
    IS_LINUX=true
elif [[ "$OS" == "Darwin" ]]; then
    IS_MAC=true
elif [[ "$OS" == "MINGW"* || "$OS" == "CYGWIN"* || "$OS" == "MSYS"* ]]; then
    IS_WINDOWS=true
fi

echo "Detectado sistema operacional: $OS"

# Baixar a fonte
mkdir -p "$TEMP_DIR"
cd "$TEMP_DIR"
echo "Baixando Nerd Font $NERD_FONT..."
curl -LO "$URL"

# Extrair
unzip -o "${NERD_FONT}.zip" -d "$TEMP_DIR/$NERD_FONT"

# Instalar
if $IS_LINUX || $IS_MAC; then
    mkdir -p ~/.local/share/fonts
    cp "$TEMP_DIR/$NERD_FONT"/*.ttf ~/.local/share/fonts/
    fc-cache -fv
    echo "Fonte instalada em ~/.local/share/fonts"
elif $IS_WINDOWS; then
    FONTS_DIR="$WINDIR/Fonts"
    for font in "$TEMP_DIR/$NERD_FONT"/*.ttf; do
        cp "$font" "$FONTS_DIR"
    done
    echo "Fontes copiadas para a pasta de fontes do Windows. Você pode precisar instalá-las manualmente."
fi

echo "Instalação concluída!"

