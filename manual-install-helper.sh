#!/usr/bin/env bash
#
# This script is for installing/updating some "packages" for non-Arch users.
#

cd "$(dirname "$0")"
export base="$(pwd)"
source ./scriptdata/functions
source ./scriptdata/installers
source ./scriptdata/environment-variables

if command -v pacman >/dev/null 2>&1;then printf "\e[31m[$0]: pacman found, it seems that the system is ArchLinux or Arch-based distro. Aborting...\e[0m\n";exit 1;fi
install-ags
install-Rubik
install-Gabarito
install-OneUI
install-bibata
install-MicroTeX
install-uv
install-python-packages

if [[ -z "${ILLOGICAL_IMPULSE_VIRTUAL_ENV}" ]]; then
  printf "\n\e[31m[$0]: \!! Important \!! : Please ensure environment variable \e[0m \$ILLOGICAL_IMPULSE_VIRTUAL_ENV \e[31m is set to proper value (by default \"~/.local/state/ags/.venv\"), or AGS config will not work. We have already provided this configuration in ~/.config/hypr/hyprland/env.conf, but you need to ensure it is included in hyprland.conf, and also a restart is needed for applying it.\e[0m\n"
fi
