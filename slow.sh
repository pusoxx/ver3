#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
echo -e " [INFO] Sabar sayang Lagi Proses"
wget https://raw.githubusercontent.com/pusoxx/sldns/main/slodns/setupsldn.sh && chmod +x setupsldn.sh && ./setupsldn.sh
echo -e " [INFO] Selesai Ganti Ns nya Sayang , Enter"
sleep 2
menu
