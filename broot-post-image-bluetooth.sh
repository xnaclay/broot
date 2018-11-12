#!/bin/bash

# remove ttyAMA0 console
sed -i -e 's/console=ttyAMA0,115200//' "${BINARIES_DIR}/rpi-firmware/cmdline.txt"

# remove miniuart-bt
sed -i -e '/dtoverlay=pi3-miniuart-bt/d' "${BINARIES_DIR}/rpi-firmware/config.txt"
