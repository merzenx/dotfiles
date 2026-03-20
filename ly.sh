#!/bin/bash

REPO_URL="https://github.com/fairyglade/ly"
TEMP_DIR="/tmp/ly_build"
DMS=("sddm" "gdm" "lightdm" "lxdm")

echo "Installing dependencies..."
sudo pacman -S --needed zig make git --noconfirm

echo "Cloning and Building ly..."
rm -rf "$TEMP_DIR"
git clone --recurse-submodules "$REPO_URL" "$TEMP_DIR"
cd "$TEMP_DIR" || exit

zig build

if [ $? -eq 0 ]; then
    echo "Build successful. Installing..."
    sudo ./zig-out/bin/ly-install
    
    echo "Disabling existing display managers..."
    for dm in "${DMS[@]}"; do
        if systemctl is-enabled "$dm.service" &>/dev/null; then
            echo "Found $dm.service, disabling now..."
            sudo systemctl disable "$dm.service"
        fi
    done

    echo "Enabling ly.service..."
    sudo systemctl enable ly.service
    
    echo "------------------------------------------------"
    echo "Installation and switch complete!"
    echo "Reboot your system to start using Ly."
else
    echo "Error: Build failed. System managers remain unchanged."
    exit 1
fi
