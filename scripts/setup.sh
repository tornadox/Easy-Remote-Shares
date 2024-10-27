#!/bin/bash

# Create base directory
BASE_DIR="$HOME/easy-remote-shares"
DESKTOP_DIR="$HOME/Desktop"
mkdir -p "$BASE_DIR"
cd "$BASE_DIR"

# Download latest rclone
echo "Downloading rclone..."
curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip
unzip rclone-current-linux-amd64.zip
mv rclone-*-linux-amd64/rclone .
rm -rf rclone-*-linux-amd64*

# Make rclone executable
chmod +x rclone

# Download script generator
echo "Setting up script generator..."
curl -o generate-mount-script.sh https://raw.githubusercontent.com/tornadox/Easy-Remote-Shares/main/scripts/generate-mount-script.sh
chmod +x generate-mount-script.sh

# Create desktop entries
echo "Creating desktop shortcuts..."
cat > "$DESKTOP_DIR/mount-shares.desktop" << EOF
[Desktop Entry]
Name=Mount Remote Shares
Exec=$BASE_DIR/mount-shares.sh
Icon=network-server
Type=Application
Terminal=true
EOF

cat > "$DESKTOP_DIR/unmount-shares.desktop" << EOF
[Desktop Entry]
Name=Unmount Remote Shares
Exec=$BASE_DIR/unmount-shares.sh
Icon=network-offline
Type=Application
Terminal=true
EOF

cat > "$DESKTOP_DIR/rclone-config.desktop" << EOF
[Desktop Entry]
Name=Rclone Config
Exec=$BASE_DIR/rclone rcd --rc-web-gui --rc-addr 127.0.0.1:5572
Icon=preferences-system-network-sharing
Type=Application
Terminal=true
EOF

cat > "$DESKTOP_DIR/generate-mounts.desktop" << EOF
[Desktop Entry]
Name=Generate Mounts
Exec=$BASE_DIR/generate-mount-script.sh
Icon=system-run
Type=Application
Terminal=true
EOF

# Make desktop files executable
chmod +x "$DESKTOP_DIR"/*.desktop

echo "Setup complete! You can now use the desktop shortcuts to:"
echo "1. Mount your remote shares"
echo "2. Unmount your remote shares"
echo "3. Open the rclone configuration web UI"
echo "4. Generate mount scripts after configuring your remotes"
