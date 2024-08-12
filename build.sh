#!/bin/bash

cd var-yocto

source setup-environment build_xwayland
bitbake fsl-image-qt6

