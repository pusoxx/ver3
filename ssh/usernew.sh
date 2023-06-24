#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################
clear
# Getting

sldomain=$(cat /root/nsdomain)
cdndomain=$(cat /root/awscdndomain)
slkey=$(cat /etc/slowdns/server.pub)
clear
cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
if [ "$cekray" = "XRAY" ]; then
domen=`cat /etc/xray/domain`
else
domen=`cat /etc/v2ray/domain`
fi
portsshws=`cat ~/log-install.txt | grep -w "SSH Websocket" | cut -d: -f2 | awk '{print $1}'`
wsssl=`cat /root/log-install.txt | grep -w "SSH SSL Websocket" | cut -d: -f2 | awk '{print $1}'`

echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[40;1;37m            SSH Account            \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif

IP=$(curl -sS ifconfig.me);
ossl=`cat /root/log-install.txt | grep -w "OpenVPN" | cut -f2 -d: | awk '{print $6}'`
opensh=`cat /root/log-install.txt | grep -w "OpenSSH" | cut -f2 -d: | awk '{print $1}'`
db=`cat /root/log-install.txt | grep -w "Dropbear" | cut -f2 -d: | awk '{print $1,$2}'`
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"

OhpSSH=`cat /root/log-install.txt | grep -w "OHP SSH" | cut -d: -f2 | awk '{print $1}'`
OhpDB=`cat /root/log-install.txt | grep -w "OHP DBear" | cut -d: -f2 | awk '{print $1}'`
OhpOVPN=`cat /root/log-install.txt | grep -w "OHP OpenVPN" | cut -d: -f2 | awk '{print $1}'`

sleep 1
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
PID=`ps -ef |grep -v grep | grep sshws |awk '{print $2}'`

if [[ ! -z "${PID}" ]]; then
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "\E[40;1;37m        𝗔𝗦𝗦𝗔𝗦𝗜𝗡 𝗧𝗨𝗡𝗡𝗘𝗟𝗜𝗡𝗚           \E[0m" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "\E[40;1;37m           𝗦𝗦𝗛/𝗗𝗿𝗼𝗽𝗯𝗲𝗮𝗿           \E[0m" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "HOST        : $(cat /etc/xray/domain)" | tee -a /etc/log-create-user.log
echo -e "Nameserver  : $sldomain" | tee -a /etc/log-create-user.log
echo -e "Username    : $Login" | tee -a /etc/log-create-user.log
echo -e "Password    : $Pass" | tee -a /etc/log-create-user.log
echo -e "PubKey      : $slkey" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "OpenSSH        : 22" | tee -a /etc/log-create-user.log
echo -e "Dropbear         : 80,90,69,143" | tee -a /etc/log-create-user.log
echo -e "OpenSSH SSL   : 443" | tee -a /etc/log-create-user.log
echo -e "Dropbear SSL    : 443" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "SlowDNS     : 53,5300,443" 
echo -e "BadVPN UDPGW       : 7100-7300" | tee -a /etc/log-create-user.log
echo -e "OpenVPN TCP       : 80,1194" | tee -a /etc/log-create-user.log
echo -e "OpenVPN SSL       : 443" | tee -a /etc/log-create-user.log
echo -e "OpenVPN UDP       : 25000" | tee -a /etc/log-create-user.log
echo -e "OpenVPN WS      : 7444" | tee -a /etc/log-create-user.log
echo -e "OpenVPN WS SSL       : 7443" | tee -a /etc/log-create-user.log
echo -e "OpenVPN DNS       : 53" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "Payload SSH CDN Port 80" | tee -a /etc/log-create-user.log
echo -e "
GET / HTTP/1.1 Host: [host_port]User-Agent: [ua]Upgrade: websocket[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "Payload SSH TLS/WSS Port 443" | tee -a /etc/log-create-user.log
echo -e "
GET wss://BUG/ HTTP/1.1[crlf]Host: [host]User-Agent: [ua]Upgrade: Websocket[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "Payload SSH WS Non TLS Port 7788" | tee -a /etc/log-create-user.log
echo -e "Path - /whatever" | tee -a /etc/log-create-user.log
echo -e "GET wss://BUG/worryfree HTTP/1.1[crlf]Host: [host]User-Agent: [ua]Upgrade: Websocket[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "\E[40;1;37m          𝗢𝗽𝗲𝗻𝗩𝗣𝗡            \E[0m" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "OpenVPN WS SSL   : https://$(cat /etc/xray/domain):81/"$domain"-ws-ssl.ovpn"
echo -e "OpenVPN SSL      : https://$(cat /etc/xray/domain):81/"$domain"-ssl.ovpn"
echo -e "OpenVPN TCP      : https://$(cat /etc/xray/domain):81/"$domain"-tcp.ovpn"
echo -e "OpenVPN UDP      : https://$(cat /etc/xray/domain):81/"$domain"-udp.ovpn"
echo -e "\e[33m————————————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "Expired On  : $exp" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log

echo -e "\e[33m————————————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "${CYAN}    Terimakasih sudah menggunakan-
                       Script Credit by Assasin"
echo -e "\e[33m————————————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log

else

echo -e "\e[33m————————————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "\E[40;1;37m        𝗔𝗦𝗦𝗔𝗦𝗜𝗡 𝗧𝗨𝗡𝗡𝗘𝗟𝗜𝗡𝗚           \E[0m" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "\E[40;1;37m           𝗦𝗦𝗛/𝗗𝗿𝗼𝗽𝗯𝗲𝗮𝗿           \E[0m" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "HOST        : $(cat /etc/xray/domain)" | tee -a /etc/log-create-user.log
echo -e "Nameserver  : $sldomain" | tee -a /etc/log-create-user.log
echo -e "Username    : $Login" | tee -a /etc/log-create-user.log
echo -e "Password    : $Pass" | tee -a /etc/log-create-user.log
echo -e "PubKey      : $slkey" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "OpenSSH        : 22" | tee -a /etc/log-create-user.log
echo -e "Dropbear         : 80,90,69,143" | tee -a /etc/log-create-user.log
echo -e "OpenSSH SSL   : 443" | tee -a /etc/log-create-user.log
echo -e "Dropbear SSL    : 443" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "SlowDNS     : 53,5300,443" 
echo -e "BadVPN UDPGW       : 7100-7300" | tee -a /etc/log-create-user.log
echo -e "OpenVPN TCP       : 80,1194" | tee -a /etc/log-create-user.log
echo -e "OpenVPN SSL       : 443" | tee -a /etc/log-create-user.log
echo -e "OpenVPN UDP       : 25000" | tee -a /etc/log-create-user.log
echo -e "OpenVPN WS      : 7444" | tee -a /etc/log-create-user.log
echo -e "OpenVPN WS SSL       : 7443" | tee -a /etc/log-create-user.log
echo -e "OpenVPN DNS       : 53" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "Payload SSH CDN Port 80" | tee -a /etc/log-create-user.log
echo -e "
GET / HTTP/1.1 Host: [host_port]User-Agent: [ua]Upgrade: websocket[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "Payload SSH TLS/WSS Port 443" | tee -a /etc/log-create-user.log
echo -e "
GET wss://BUG/ HTTP/1.1[crlf]Host: [host]User-Agent: [ua]Upgrade: Websocket[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "Payload SSH WS Non TLS Port 7788" | tee -a /etc/log-create-user.log
echo -e "Path - /whatever" | tee -a /etc/log-create-user.log
echo -e "GET wss://BUG/worryfree HTTP/1.1[crlf]Host: [host]User-Agent: [ua]Upgrade: Websocket[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "\E[40;1;37m          𝗢𝗽𝗲𝗻𝗩𝗣𝗡            \E[0m" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "OpenVPN WS SSL   : https://$(cat /etc/xray/domain):81/"$domain"-ws-ssl.ovpn"
echo -e "OpenVPN SSL      : https://$(cat /etc/xray/domain):81/"$domain"-ssl.ovpn"
echo -e "OpenVPN TCP      : https://$(cat /etc/xray/domain):81/"$domain"-tcp.ovpn"
echo -e "OpenVPN UDP      : https://$(cat /etc/xray/domain):81/"$domain"-udp.ovpn"
echo -e "\e[33m————————————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "Expired On  : $exp" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log

echo -e "\e[33m————————————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "${CYAN}    Terimakasih sudah menggunakan-
                       Script Credit by Assasin"
echo -e "\e[33m————————————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
fi
echo "" | tee -a /etc/log-create-user.log
read -n 1 -s -r -p "Press any key to back on menu"
menu
