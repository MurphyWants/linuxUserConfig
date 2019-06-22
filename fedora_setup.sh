flatpak install -y  "com.heroicgameslauncher.hgl" 
flatpak install -y  "com.discordapp.Discord/x86_64/stable"  
flatpak install -y  "app/org.telegram.desktop/x86_64/stable" 
flatpak install -y  "app/org.videolan.VLC/x86_64/stable" 
flatpak install -y  "app/com.valvesoftware.Steam/x86_64/stable" 
flatpak install -y  flathub "com.transmissionbt.Transmission"  
flatpak install -y  "com.bitwarden.desktop" 
flatpak install -y  "com.mojang.Minecraft" 
flatpak install -y  "me.hyliu.fluentreader" 
flatpak install -y  flathub "org.mozilla.Thunderbird" 
flatpak install -y  "md.obsidian.Obsidian" 
flatpak install -y  "com.authy.Authy"

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

sudo dnf config-manager --add-repo https://pkgs.tailscale.com/stable/fedora/tailscale.repo
dnf clean all
sudo dnf install  tailscale code git-all sqlitebrowser youtube-dl NetworkManager-tui steam-devices
sudo systemctl enable --now tailscaled
sudo tailscale up --accept-dns --accept-routes

# Enable fractional scaling support
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"

ssh-keygen -t rsa -b 4096


