echo "#!/bin/bash
# iwconfig
if [ -z \$1 ]; then 
        echo \"usage: wifi <ssid> [passphrase]\";
        echo \"\";
        echo \"If passphrase is left out, it will be read from stdin\";
        exit;
fi
if [ -z \$2 ]; then 
    echo \"# reading passphrase from stdin\";
    read PASSPHRASE
    if [ \${#PASSPHRASE} -lt 8 ] || [ \${#PASSPHRASE} -gt 63 ]; then 
        echo \"Passphrase must be 8..63 characters\";
        exit;
    fi
    set -- \"\${@:1}\" \"\$PASSPHRASE\"
fi
if [ \${#2} -lt 8 ] || [ \${#2} -gt 63 ]; then 
    echo \"Passphrase must be 8..63 characters\";
    exit;
fi
CONFIG=\"/etc/wpa_supplicant.conf\"
INTERFACE=\"wlp2s0\"
if [ -e \$CONFIG ]
then
    sudo rm \$CONFIG
    sudo touch \$CONFIG
else
    sudo touch \$CONFIG
fi
wpa_passphrase \$1 \$2 | sudo tee -a \$CONFIG > /dev/null
sudo systemctl stop NetworkManager
sudo wpa_supplicant -B -Dnl80211 -i\$INTERFACE -c\$CONFIG
sudo dhclient \$INTERFACE" | sudo tee /bin/wifi > /dev/null && sudo chmod 755 /bin/wifi