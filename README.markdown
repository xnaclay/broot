# broot

This is a minimal system to help setting up buildroot-based applications. It
uses a collection of helper scripts to generate defconfigs for buildroot that
make it simple to build customized buildroot distributions.

## Example usage

First, make sure to clone recursive:

    git clone --recursive https://github.com/xnaclay/broot.git

Run `gendefconfig` to generate defconfigs in `buildroot/configs`:

    ./gendefconfig

Go into `buildroot/` dir:

    cd buildroot

Build the generated defconfig. The wifi\_ssh config is the simplest and is
recommended as a starting point for a Raspberry Pi Zero W:

    make broot_wifi_ssh_defconfig

(Optionally) customize the buildroot configuration:

    make menuconfig

Build the image:

    make

The image (e.g. Raspberry Pi sdcard image) will be in output/images:

    dd if=output/images/sdcard.img /dev/<your sd card>

## Configuration

### WiFi

For wifi systems to work, configure the SSID/PSK before building:

    ./config-wifi

## Contributions

PRs are very welcome.
