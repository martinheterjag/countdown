#!/bin/bash
# Installs the morning routine page as a RetroPie port. Run on the Pi from the folder containing index.html.
set -e

sudo apt update
sudo apt install -y --no-install-recommends xserver-xorg xserver-xorg-legacy xinit x11-xserver-utils fonts-noto-color-emoji
sudo apt install -y --no-install-recommends chromium-browser || sudo apt install -y --no-install-recommends chromium

BROWSER=$(command -v chromium-browser || command -v chromium)

mkdir -p /home/pi/morgonrutin
cp index.html /home/pi/morgonrutin/

PORT=/home/pi/RetroPie/roms/ports/Morgonrutin.sh
mkdir -p "$(dirname "$PORT")"
cat > "$PORT" <<EOF
#!/bin/bash
SIZE=\$(cat /sys/class/graphics/fb0/virtual_size)
xinit $BROWSER --kiosk --noerrdialogs --incognito --lang=sv --disable-features=Translate --window-position=0,0 --window-size=\$SIZE file:///home/pi/morgonrutin/index.html -- -nocursor -s 0 -dpms
EOF
chmod +x "$PORT"

printf "allowed_users=anybody\nneeds_root_rights=yes\n" | sudo tee /etc/X11/Xwrapper.config > /dev/null

echo "Klart! Starta om EmulationStation och välj Ports -> Morgonrutin."
