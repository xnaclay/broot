#!/bin/sh

if ! grep -qE '^dtoverlay=hifiberry-dac' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
  echo "Adding 'dtoverlay=hifiberry-dac' to config.txt (enables hifiberry DAC)."
  cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"

# enable hifiberry DAC
dtoverlay=hifiberry-dac
__EOF__
fi
