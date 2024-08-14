#!/bin/bash

mkdir -p yocto
cd yocto

source setup-environment build_xwayland
bitbake fsl-image-gui

cp -ra build/* /build

