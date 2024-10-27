#!/bin/bash

# Base directories
BASE_DIR="$HOME/easy-remote-shares"
RCLONE_CONF="$HOME/.config/rclone/rclone.conf"
LOG_DIR="$BASE_DIR/logs"

# Create necessary directories
mkdir -p "$BASE_DIR" "$LOG_DIR"

# Generate mount script
cat > "$BASE_DIR/mount-shares.sh" << 'EOF'
#!/bin/bash
BASE_DIR="$HOME/easy-remote-shares"
LOG_DIR="$BASE_DIR/logs"

# Function to get timestamp
timestamp() {
    date "+%Y-%m-%d %H:%M:%S"
}

# Start logging
exec 1> >(tee -a "$LOG_DIR/mount-$(date +%Y%m%d).log")
exec 2>&1

echo "$(timestamp) Starting mount process..."
EOF

# Generate unmount script
cat > "$BASE_DIR/unmount-shares.sh" << 'EOF'
#!/bin/bash
BASE_DIR="$HOME/easy-remote-shares"
LOG_DIR="$BASE_DIR/logs"

# Function to get timestamp
timestamp() {
    date "+%Y-%m-%d %H:%M:%S"
}

# Start logging
exec 1> >(tee -a "$LOG_DIR/unmount-$(date +%Y%m%d).log")
exec 2>&1

echo "$(timestamp) Starting unmount process..."
EOF

# Read rclone config and generate mount commands
while IFS= read -r line; do
    if [[ $line =~ ^\[(.*)\]$ ]]; then
        share_name="${BASH_REMATCH[1]}"
        mount_point="$BASE_DIR/$share_name"
        
        # Add mount point creation to mount script
        echo "mkdir -p \"$mount_point\"" >> "$BASE_DIR/mount-shares.sh"
        echo "echo \"\$(timestamp) Creating mount point for $share_name\"" >> "$BASE_DIR/mount-shares.sh"
        
        # Add mount command with SteamOS optimized settings
        cat >> "$BASE_DIR/mount-shares.sh" << EOF
"$BASE_DIR/rclone" mount \\
    --no-checksum \\
    --no-modtime \\
    --dir-cache-time 168h \\
    --poll-interval 30s \\
    --vfs-cache-mode full \\
    --vfs-cache-max-size 5G \\
    --vfs-cache-max-age 24h \\
    --vfs-read-chunk-size 256M \\
    --vfs-read-chunk-size-limit 2G \\
    --vfs-read-ahead 256M \\
    --buffer-size 256M \\
    --transfers 4 \\
    --low-level-retries 10 \\
    --retries-sleep 1s \\
    --daemon \\
    --log-file="$LOG_DIR/$share_name.log" \\
    --log-level INFO \\
    "$share_name": "$mount_point"

echo "\$(timestamp) Mounted $share_name to $mount_point"
EOF
        
        # Add unmount command
        cat >> "$BASE_DIR/unmount-shares.sh" << EOF
echo "\$(timestamp) Unmounting $share_name from $mount_point"
fusermount -u "$mount_point"
EOF
    fi
done < "$RCLONE_CONF"

# Add final log messages
echo 'echo "$(timestamp) All shares mounted successfully"' >> "$BASE_DIR/mount-shares.sh"
echo 'echo "$(timestamp) All shares unmounted successfully"' >> "$BASE_DIR/unmount-shares.sh"

# Make scripts executable
chmod +x "$BASE_DIR/mount-shares.sh"
chmod +x "$BASE_DIR/unmount-shares.sh"

echo "Setup completed. Scripts created at:"
echo "  Mount script: $BASE_DIR/mount-shares.sh"
echo "  Unmount script: $BASE_DIR/unmount-shares.sh"
echo "Logs will be stored in: $LOG_DIR"
