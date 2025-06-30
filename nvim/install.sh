# This script is designed to be run on Ubuntu 22.04 and requires execution permissions (chmod +x install.sh).
# It performs the following tasks:
# 1. Updates the system and installs essential dependencies.
# 2. Installs Neovim and adds it to the PATH in ~/.bashrc.
# 3. Installs clipboard utilities (xclip and xsel) for Neovim clipboard support.
# 4. Checks if Go is installed; if not, installs it and verifies the installation.
# 5. Installs required Python packages: python3-dev, python3-pip, and python3-venv, if not already installed.
# 6. Ensures the unzip utility is installed for handling compressed files.
# 7. Verifies the installation of all required components and handles errors gracefully.

#!/bin/sh
set -e

# Updating system and installing dependencies
sudo apt update
sudo apt upgrade -y 
sudo apt-get install software-properties-common -y

# Installing Neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo chmod -R +x /opt/nvim-linux-x86_64/bin

sudo rm -rf /opt/nvim-linux-x86_64
sudo mkdir -p /opt/nvim-linux-x86_64
sudo tar -C /opt/nvim-linux-x86_64 -xzf nvim-linux-x86_64.tar.gz --strip-components=1       
sudo rm nvim-linux-x86_64.tar.gz

NVIM_PATH="/opt/nvim-linux-x86_64/bin"
if ! grep -Fxq "export PATH=\"\$PATH:$NVIM_PATH\"" ~/.bashrc; then
    echo "export PATH=\"\$PATH:$NVIM_PATH\"" >> ~/.bashrc
    echo "Neovim added to PATH in ~/.bashrc."
else
    echo "Neovim PATH already exists in ~/.bashrc."
fi

source ~/.bashrc

# Install unzip if not installed
if ! command -v unzip >/dev/null 2>&1; then
    echo "Installing unzip..."
    sudo apt-get update && sudo apt-get install -y unzip
fi

# Installing clipboard utilities
sudo apt-get install -y xclip xsel

# Install or update tmux
if ! command -v tmux >/dev/null 2>&1; then
    echo "tmux is not installed. Installing..."
    sudo apt update
    sudo apt install -y tmux
    if [ $? -eq 0 ]; then
        echo "tmux was successfully installed!"
        tmux -V
    else
        echo "tmux installation failed." >&2
        exit 1
    fi
else
    echo "tmux is already installed:"
    tmux -V
    echo "Updating tmux to the latest version..."
    sudo apt update
    sudo apt install --only-upgrade -y tmux
    if [ $? -eq 0 ]; then
        echo "tmux was successfully updated!"
        tmux -V
    else
        echo "tmux update failed." >&2
        exit 1
    fi
fi

# Setting up tmux configuration
echo "Setting up tmux configuration..."

# Resolve the path of the install.sh script
TMUX_SOURCE="$HOME/.config/tmux/.tmux.conf"
TMUX_DEST="$HOME/.tmux.conf"

if [ -f "$TMUX_SOURCE" ]; then
    cp "$TMUX_SOURCE" "$TMUX_DEST"
    echo ".tmux.conf foi copiado de $TMUX_SOURCE para $TMUX_DEST"
else
    echo "Erro: Arquivo .tmux.conf não encontrado em $TMUX_SOURCE" >&2
    echo "Por favor, crie o arquivo de configuração primeiro." >&2
    exit 1
fi

echo ".tmux.conf has been copied to your home directory."

# Install TPM (Tmux Plugin Manager) if not installed
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "Installing TPM (Tmux Plugin Manager)..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    echo "TPM already installed."
fi

~/.tmux/plugins/tpm/bin/install_plugins

# Check if go is already installed
if ! command -v go &> /dev/null; then
    echo "Go is not installed. Installing..."
    sudo apt update && sudo apt install -y golang
    # Check if the installation was successful
    if [ $? -eq 0 ]; then
        echo "Go was successfully installed!"
        go version
    else
        echo "Go installation failed." >&2
        exit 1
    fi
else
    echo "Go is already installed:"
    go version
fi


if ! grep -Fxq "export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"" ~/.bashrc; then
    echo "export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"" >> ~/.bashrc
    echo "Mason PATH added to PATH in ~/.bashrc."
else
    echo "Mason PATH already exists in ~/.bashrc."
fi
  

# List of packages to install
PACKAGES="python3-dev python3-pip python3-venv"

# Check which packages are already installed
MISSING_PACKAGES=""
for pkg in $PACKAGES; do
    if ! dpkg -s "$pkg" >/dev/null 2>&1; then
        MISSING_PACKAGES="$MISSING_PACKAGES $pkg"
    fi
done

# Install missing packages
if [ -n "$MISSING_PACKAGES" ]; then
    echo "Installing packages: $MISSING_PACKAGES"
    sudo apt-get update
    sudo apt-get install -y $MISSING_PACKAGES
    
    # Check if the installation was successful
    if [ $? -eq 0 ]; then
        echo "Packages installed successfully!" 
    else
        echo "Error: Installation failed." >&2
        exit 1
    fi
else
    echo "All packages are already installed."
fi      
