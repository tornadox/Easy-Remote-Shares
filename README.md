# 🚀 Easy Remote Shares for Steam Deck and Linux

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/Platform-Steam%20Deck-000000?style=flat&logo=steam&logoColor=white)](https://www.steamdeck.com/)
[![Linux](https://img.shields.io/badge/Linux-FCC624?style=flat&logo=linux&logoColor=black)](https://www.linux.org/)

A simple tool for mounting remote storage (NAS, Google Drive, Mega, Dropbox, etc.) on your Steam Deck or Linux system using rclone.

## 🎮 Quick Setup

1. Switch to Desktop Mode (Steam Deck only)
2. Download [`easy-remote-shares-setup.desktop`](https://github.com/tornadox/Easy-Remote-Shares/raw/refs/heads/main/desktop/easy-remote-shares-setup.desktop)
   - Right-click → Save link as...
3. Using Dolphin File Manager:
   - Navigate to Downloads
   - Click the downloaded file
     - Firefox users: Look for `easy-remote-shares-setup.desktop.download`
   - Wait for the Konsole window to close
4. From your desktop:
   1. Click "Rclone Config" to open the web interface
   2. Add or modify remote storage connections
   3. Test your configuration
   4. Close both the web UI and console window
   5. Click "Generate Mounts" to create mount points
   6. Use Mount/Unmount icons to connect/disconnect

5. Access your mounts:
   - Open Dolphin → Home → easy-remote-shares
   - Optional: Right-click → Add to Places for quick access

## 💫 Key Benefits

- **Automated Setup**: Latest rclone installation and configuration
- **User-Friendly**: Desktop shortcuts handle all mount and unmount operations, making it easy to run games and installers directly from remote storage.
- **Simple One-Time Setup**: Initial configuration can be completed once via a browser. Steam Deck users can easily set up using the on-screen keyboard.
- **Space Efficient**: Run games and apps directly from remote storage
- **Flexible Configuration Import**: Import existing configurations by copying your `rclone.conf` to `~/.config/rclone/`

## 🎯 Desktop Shortcuts

| Icon | Name | Function |
|------|------|----------|
| 🔌 | **Mount Remote Shares** | Connect configured storage |
| ⏏️ | **Unmount Remote Shares** | Safely disconnect storage |
| ⚙️ | **Rclone Config** | Open web UI for storage management |
| 🔄 | **Generate Mounts** | Create mount points after configuration |

## 💻 Linux Compatibility

Compatible with any Linux distribution following the [Freedesktop.org Desktop Entry Specification](https://specifications.freedesktop.org/desktop-entry-spec/latest/).

## 🔍 Steam Deck Performance Note

Running installers from remote storage eliminates the need to download them to your local device, saving valuable SSD/SD card space and potentially improving performance by avoiding dual read/write operations on the same storage device during installation process.

## 🆘 Support

- [Report Issues](../../issues)
- [Request Features](../../issues)
- [View Documentation](../../wiki)

## ⚠️ Important

- Back up important data before use
- Test your configuration thoroughly
- Ensure stable network connection for optimal performance

---

<div align="center">

Made with ❤️ for the Steam Deck and Linux Community

[Report Bug](../../issues) · [Request Feature](../../issues)
</div>
