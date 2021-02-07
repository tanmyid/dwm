#!/bin/sh
cat <<EOF | xmenu | sh &
 Telegram	telegram-desktop
 Browser	google-chrome-stable

 Shutdown		sudo poweroff
勒 Reboot		sudo reboot
EOF
