#!/bin/bash
echo "options rtl8723be fwlps=N ips=N" | sudo tee /etc/modprobe.d/rtl8723be.conf
sudo ubuntu-drivers devices
ssh yash@tty.sdf.org
echo $(dpkg -l | grep linux-image | awk '{ print $2 }' | sort -V | sed -n '/'`uname -r`'/q;p') $(dpkg -l | grep linux-image-extra | awk '{ print $2 }' | sort -V | sed -n '/'`uname -r`'/q;p') $(dpkg -l | grep linux-headers | awk '{ print $2 }' | sort -V | sed -n '/'"$(uname -r | sed "s/\([0-9.-]*\)-\([^0-9]\+\)/\1/")"'/q;p') $(dpkg -l | grep linux-modules | awk '{ print $2 }' | sort -V | sed -n '/'`uname -r`'/q;p') | xargs sudo apt -y purge && sudo apt -y autoremove && sudo apt -y autoclean && sudo rm -rf "/lib/modules/`ls /lib/modules/ | grep -v \`uname -r\``" && sudo ~/FixBootSplash.sh
