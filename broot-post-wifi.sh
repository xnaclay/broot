#!/bin/sh

# configure wlan0
if ! grep 'wlan0' "${TARGET_DIR}/etc/network/interfaces"; then
  cat <<EOF >> ${TARGET_DIR}/etc/network/interfaces

auto wlan0
iface wlan0 inet dhcp
  pre-up wpa_supplicant -D nl80211 -i wlan0 -c /etc/wpa_supplicant.conf -B
  post-down killall -q wpa_supplicant
EOF

  WIFI_SSID="$( cat ${BASE_DIR}/../../.broot-secret-wifi-ssid )"
  WIFI_PSK="$( cat ${BASE_DIR}/../../.broot-secret-wifi-psk )"

  cat <<EOF > ${TARGET_DIR}/etc/wpa_supplicant.conf
ctrl_interface=/var/run/wpa_supplicant
ap_scan=1

network={
   ssid="${WIFI_SSID}"
   psk="${WIFI_PSK}"
}
EOF
fi
