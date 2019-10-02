#! /bin/bash
checkVT=$(grep -c "\$vt_handoff" /boot/grub/grub.cfg)
if [ ! "$checkVT" -eq "0" ] 
   then
     echo "> Found vt_handoff removing ..."
     sudo sed 's/$vt_handoff//g' /boot/grub/grub.cfg > /tmp/.grub.cfg
     sudo rm /boot/grub/grub.cfg
     sudo mv /tmp/.grub.cfg /boot/grub/grub.cfg
   fi
 echo "> Done"
