#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

dnf5 group install -y \
	admin-tools \
	core \
	fonts \
	hardware-support \
	multimedia \
	standard

dnf5 -y install \
    adwaita-gtk2-theme \
    adwaita-icon-theme \
    bash-completion \
    blueman \
    breeze-cursor-theme \
    breeze-gtk \
    breeze-icon-theme \
    chrony \
    distrobox \
    firewall-config \
    flatpak \
    fontawesome-6-free-fonts \
    fontawesome-6-brands-fonts \
    git \
    gnome-disk-utility \
    gnome-keyring \
    gnome-packagekit-installer \
    gnome-software \
    gvfs-smb \
    gvfs-nfs \
    htop \
    joystick-support \
    kitty \
    liberation-fonts \
    lxqt-policykit \
    nautilus \
    network-manager-applet \
    pavucontrol \
    pulseaudio-utils \
    rofi-wayland \
    rofimoji \
    sddm \
    seahorse \
    setroubleshoot \
    socat \
    swaync \
    system-config-printer \
    polkit \
    tldr \
    xdg-user-dirs \
    xdg-user-dirs-gtk \
    vulkan-headers \
    vulkan-loader \
    vulkan-tools \
    wlr-randr \
    yaru-{gtk2,gtk3,gtk4,icon,sound}-theme \
    wl-clipboard

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

dnf5 -y copr enable solopasha/hyprland
dnf5 -y copr enable cjuniorfox/hyprland-shell

# Packages from Solopasha's COPR
dnf5 -y install \
    cliphist \
    eww-git \
    hyprlock \
    hypridle \
    hyprland \
    hyprland-qtutils \
    hyprpaper hyprshot \
    xdg-desktop-portal-hyprland
    
# Packages from cjuniorfox's COPR
dnf5 -y install \
     bibata-cursor-theme \
     hyprland-shell-config \
     wol-changer

dnf5 -y copr disable cjuniorfox/hyprland-shell
dnf5 -y copr disable solopasha/hyprland

#### Example for enabling a System Unit File
