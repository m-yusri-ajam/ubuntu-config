#!/bin/bash

# Define paths
SOURCE_DIR="$HOME/.config/Code/User"
TARGET_DIR="$HOME/Desktop/ubuntu-config/config"

# Create target dir if it doesn't exist
mkdir -p "$TARGET_DIR"

# Copy the core files
cp "$SOURCE_DIR/settings.json" "$TARGET_DIR/"

# Export the list of extensions you use
code --list-extensions > "$TARGET_DIR/extensions.txt"

echo "✅ Local sync complete."

# Logic to automatically sync settings with git
: <<'COMMENT'
cd "$HOME/Desktop/ubuntu-config"
git add config/
git commit -m "Syncing VSCode settings on $(date)"
git push origin main
COMMENT

echo "✅ VS Code configs synced to repository folder!"
