#!/bin/bash

sudo chown -R atono:atono var-yocto
cd var-yocto

# Set git stuff

git config --global user.name "$1"
git config --global user.email "$2"

# Clone the system

BSP_REPO=https://github.com/varigit/variscite-bsp-platform.git
BSP_DIST=mickledore
BSP_VERS=imx-6.1.36-2.1.0.xml
repo init -u $BSP_REPO -b $BSP_DIST -m $BSP_VERS
repo sync -j$(nproc)

MACHINE=imx93-var-som
DISTRO=fsl-imx-xwayland
sudo chmod +x var-setup-release.sh
source var-setup-release.sh build_xwayland

