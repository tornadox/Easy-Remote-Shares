# 🚀 Easy Remote Shares for Steam Deck

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/Platform-Steam%20Deck-000000?style=flat&logo=steam&logoColor=white)](https://www.steamdeck.com/)

Simple tool to set up remote storage mounts (like NAS or cloud storage: Google Drive, Mega, Dropbox etc) on your Steam Deck using rclone.

## 🎮 Quick Setup

1. Switch to Desktop Mode on your Steam Deck
2. Download [`easy-remote-shares-setup.desktop`](https://github.com/tornadox/Easy-Remote-Shares/raw/refs/heads/main/desktop/easy-remote-shares-setup.desktop) (Right-click -> Save link as...)
3. Open Dolphin (File Manager)
4. Click on easy-remote-shares-setup.desktop (for FF users easy-remote-shares-setup.desktop.download) icon in your downloads folder & wait for the Konsole window to close
5. Open desktoo & click the "Rclone Config" icon
2. Use the web interface to:
   - Add new remote storage
   - Modify existing connections
   - Test your configuration
3. Close the web UI & console window when done
4. Click the "Generate Mounts" icon to generate the configuration
5. Use Mount/Unmount icons to apply changes
6. In Dolphin open **Home** -> **easy-remote-shares** to access your new mount points. (Optional: right click -> Add to Places)
7. Install Games & Software, open Media files.
   

## ✨ What It Does

- Downloads and sets up the latest rclone automatically
- Creates shortcuts on your desktop to mount/unmount, opene web ui configuration and generate mount configuration
- Optimized for gaming performance

With this software, you can easily mount and unmount remote shares via desktop icons, providing a convenient way (no need to open console) to work with files without the hassle of unnecessary duplication. Rclone configuration via Web UI is simple and can be done with the in-build on-screen keyboard. For the PRO users you can copy your rclone.conf file in to ~/.config/rclone/.

The out-of-the-box experience on the Steam Deck is that if you want to execute a file (.exe) in Steam from a remote location, you need to download it onto your Steam Deck. This requires additional storage space, which may be an issue on your device, and it may also decrease performance since the same SSD or SD card serves as both the source and destination for the installer. 


## 📂 After Setup

You'll get four desktop icons:
- 🔌 **Mount Remote Shares** - Connect your remote storage
- ⏏️ **Unmount Remote Shares** - Safely disconnect
- ⚙️ **Rclone Config** - Open web interface to manage your remote storage settings
- 🔄 **Generate Mounts** - Generate the mount points after you finished configuring them in Rclone Web UI


## 🔍 Need Help?

- [Report an Issue](../../issues)
- [Request a Feature](../../issues)

## ⚠️ Note

Always back up important data and test your configuration before heavy use.

---

<div align="center">
Made with ❤️ for the Steam Deck Community
</div>
