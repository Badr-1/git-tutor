#!/bin/bash

set -e  # Exit on error

INSTALL_DIR="$HOME/.local/bin"
SCRIPT_URL="https://raw.githubusercontent.com/Badr-1/git-tutor/main/git-tutor"
SCRIPT_NAME="git-tutor"

# Ensure dependencies are available
command -v curl >/dev/null 2>&1 || { echo "Error: curl is not installed." >&2; exit 1; }

# Ensure the install directory exists
mkdir -p "$INSTALL_DIR"

# Download the script
echo "Downloading git-tutor..."
curl -sSL "$SCRIPT_URL" -o "$INSTALL_DIR/$SCRIPT_NAME"

# Make it executable
chmod +x "$INSTALL_DIR/$SCRIPT_NAME"

# Add to PATH if necessary
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.zshrc"
    export PATH="$HOME/.local/bin:$PATH"
fi

echo "Installation complete! You can now use 'git tutor'."

