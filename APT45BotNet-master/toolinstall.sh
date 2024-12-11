#!/bin/bash
# Ubuntu Car Hacking Workstation Setup
# TODO: General CLean Up.

set -e

# Setup Tools Directory
sudo mkdir -p /tools
sudo chmod -R 0777 /tools
cd /tools || exit

# Add user to dialout so USB-to-Serial Works-ish.
sudo usermod -a -G dialout "$USER"

# Update System
sudo DEBIAN_FRONTEND=noninteractive apt-get update -y
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

#  Java Fixes
sudo add-apt-repository -y ppa:linuxuprising/java
echo debconf shared/accepted-oracle-license-v1-2 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-2 seen true | sudo debconf-set-selections

#Base Package Install (Packages Listed Invidually For Easy Customazation/Trobule Shooting.)
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y  \
aircrack-ng \
ant \
arduino \
arduino-core \
autoconf \
automake \
bison \
blueman \
bluetooth \
bluez \
bluez-tools \
btscanner \
build-essential \
can-utils \
cpp \
cryptsetup \
curl \
ess \
flex \
gcc \
git \
gnuradio \
gqrx-sdr \
htop \
jq \
libavcodec-dev \
libavformat-dev \
libbluetooth-dev \
libconfig-dev \
libgps-dev \
libgtk-3-dev \
libportmidi-dev \
libsdl2-dev \
libsdl2-image-dev \
libsdl2-mixer-dev \
libsdl2-ttf-dev \
libsqlite3-dev \
libswscale-dev \
libtool \
maven \
moserial \
net-tools \
netbeans \
npm \
oracle-java15-installer \
oracle-java15-set-default \
python \
python-dev \
python3-dev \
python3-pip \
python3-serial \
python-wxtools \
ruby \
ruby-dev \
software-properties-common \
sqlite \
tree \
tree \
tshark \
unrar \
unzip \
wget \
wireshark \
zlib1g-dev


# Starting Car Hacking Tool Installation

printf "Instaling Tools"
printf "\\n"

# Bluelog
# Read The Docs: https://github.com/MS3FGX/Bluelog
git clone https://github.com/MS3FGX/Bluelog.git
cd Bluelog || exit
sudo make install
cd .. || exit

# Can-Utils:
# Read The Docs: https://github.com/linux-can/can-utils
# More Reading: # More Reading: https://discuss.cantact.io/t/using-can-utils/24
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y  can-utils

# Canbus-utils
# Read The Docs Here: https://github.com/digitalbond/canbus-utils
# More Reading:  http://www.digitalbond.com/blog/2015/03/05/tool-release-digital-bond-canbus-utils/
git clone https://github.com/digitalbond/canbus-utils
cd canbus-utils || exit
npm install
cd .. || exit

# Cantact-App
# Read The Docs Here: https://github.com/linklayer/cantact-app/
mkdir -p cantact-app
cd cantact-app || exit
wget https://github.com/linklayer/cantact-app/releases/download/v0.3.0-alpha/cantact-v0.3.0-alpha.zip
sudo unzip cantact-v0.3.0-alpha.zip
sudo rm cantact-v0.3.0-alpha.zip
cd .. || exit

# Caringcaribou
# Read The Docs Here: https://github.com/CaringCaribou/caringcaribou
pip3 install --user python-can
git clone https://github.com/CaringCaribou/caringcaribou

# c0f
# Read the Docs Here: https://github.com/zombieCraig/c0f
sudo gem install c0f

# ICSim
# Read The Docs Here: https://github.com/zombieCraig/ICSim
# Quick Start:  ./setup_vcan.sh &&  ./icsim vcan0 && ./controls vcan0
git clone https://github.com/zombieCraig/ICSim.git

# KatyOBD
# Read The Docs Here:
git clone https://github.com/YangChuan80/KatyOBD
#Fix Typo in KatyOBD
cd KatyOBD || exit
sed -i 's/tkinter/Tkinter/g' KatyOBD.py
cd .. || exit

# Kayak
# Read The Docs Here: http://kayak.2codeornot2code.org/
# To Install ./Kayak-1.0-SNAPSHOT-linux.sh --silent
mkdir -p -p kayak
cd kayak || exit
curl http://kayak.2codeornot2code.org/Kayak-1.0-SNAPSHOT-linux.sh > Kayak-1.0-SNAPSHOT-linux.sh
chmod +x Kayak-1.0-SNAPSHOT-linux.sh
cd .. || exit

# OBD-Monitor
git clone https://github.com/dchad/OBD-Monitor
cd OBD-Monitor || exit
cd src|| exit
make stests
make server
make ftests
cd .. || exit
cd .. || exit


# Python-ODB
# Read The Docs Here: https://python-obd.readthedocs.io/en/latest/
pip3 install --user pySerial
pip3 install --user obd

# Scantool
# Read The Docs Here: https://samhobbs.co.uk/2015/04/scantool-obdii-car-diagnostic-software-linux
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y  scantool

# UDSim
# Read The Docs Here: https://github.com/zombieCraig/UDSim
git clone https://github.com/zombieCraig/UDSim
cd UDSim/src || exit
make
cd .. || exit
cd .. || exit

# Make Desktop Icons

printf "Configuring Desktop Icons"
printf "\\n"

mkdir -p -p icons
cd icons || exit

cat << EOF > BlueLog.desktop
[Desktop Entry]
Name=BlueLog
Type=Application
Path=/tools/Bluelog
Exec=/tools/Bluelog/bluelog
Icon=/tools/Bluelog/www/images/bluelog_logo.png
Terminal=true
Categories=Utility
StartupNotify=false
EOF

wget https://play-lh.googleusercontent.com/HaPn8O7TNLTDN5PbPw-Gd1aq3mvTfrudkh9ov3DqNQebQ8a5HVTaNxXsgMXWXY-TAA -O cantact.png

cat << EOF > Cantact.desktop
[Desktop Entry]
Name=Cantact
Type=Application
Path=/tools/cantact-app/cantact/bin
Exec=sudo -H /tools/cantact-app/cantact/bin/cantact
Icon=/tools/icons/cantact.png
Terminal=true
Categories=Utility
StartupNotify=false
EOF

wget https://icon2.cleanpng.com/20180421/uue/kisspng-car-speedometer-computer-icons-odometer-dashboard-speedometer-background-5adabbb1c097f5.1976244315242843377889.jpg -O icsim.jpg

cat << EOF > ICSim.desktop
[Desktop Entry]
Name=ICSim
Type=Application
Path=/tools/ICSim/
Exec=/tools/ICSim/icsim vcan0
Icon=/tools/icons/icsim.jpg
Terminal=true
Categories=Utility
StartupNotify=false
EOF

cat << EOF > ICSimControls.desktop
[Desktop Entry]
Name=ICSim Controls
Type=Application
Path=/tools/ICSim/
Exec=/tools/ICSim/controls vcan0
Icon=/tools/icons/icsim.jpg
Terminal=true
Categories=Utility
StartupNotify=false
EOF

wget http://www.vhv.rs/dpng/d/457-4576489_kayak-white-kayak-icon-png-transparent-png.png -O kayak.png

cat << EOF > KayakInstall.desktop
[Desktop Entry]
Name=Kayak Install
Type=Application
Path=/tools/kayak
Exec=/tools/kayak/Kayak-1.0-SNAPSHOT-linux.sh
Icon=/tools/icons/kayak.png
Terminal=true
Categories=Utility
StartupNotify=false
EOF

wget https://icon2.cleanpng.com/20180421/uue/kisspng-car-speedometer-computer-icons-odometer-dashboard-speedometer-background-5adabbb1c097f5.1976244315242843377889.jpg -O KatyOBD.jpg

cat << EOF > KatyOBD.desktop
[Desktop Entry]
Name=KatyOBD
Type=Application
Path=/tools/KatyOBD
Exec=sudo -H python KatyOBD.py
Icon=/tools/icons/KatyOBD.jpg
Terminal=true
Categories=Utility
StartupNotify=false
EOF

sleep 15
sudo chmod 755 ./*.desktop
cp ./*.desktop ~/.local/share/applications
cd .. || exit

cd ~/.local/share/applications || exit
sudo chmod 755 ./*.desktop
cd .. || exit
