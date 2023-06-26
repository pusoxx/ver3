#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl -sS https://raw.githubusercontent.com/pusoxx/permission/main/accessmenu | grep $MYIP )
if [ $MYIP = $IZIN ]; then
clear
echo -e "${green}Permission Accepted${NC}"
else
clear
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "                ${RED}PERMISSION DENIED ! "${NC}
echo -e "     Your VPS ${NC}( ${green}$MYIP${NC} ) ${YELLOW}Has been Banned "
echo -e "         Buy access permissions for scripts "
echo -e "                 Contact Admin :"

echo -e "             ${green}Telegram t.me/WokszXD "
echo -e "             WhatsApp wa.me/6285279323958"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
exit 0
fi
clear
[[ ! -f /usr/bin/git ]] && apt install git -y &> /dev/null
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
BGWHITE='\e[0;47;30m'
BGBLUE='\e[1;44m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
GRAY='\033[0;37m'
BLACK='\033[0;30m'
GRBK='\033[0;40m'
BOLD='\e[1m'
END='\e[0m'

add-ip() {
    today=`date -d "0 days" +"%Y-%m-%d"`
    ran=$(date +%s)
    git clone https://github.com/pusoxx/permission.git /root/permission/ &> /dev/null
    clear
    read -p "Input IP Address : " ip
    CLIENT_EXISTS=$(grep -w $ip /root/permission/ipmini | wc -l)
    if [[ ${CLIENT_EXISTS} == '1' ]]; then
    echo "IP Already Exist !"
    exit 0
    fi
    read -p "Input Username IP (Example : Woksz) : " name
    echo "How Much Days Do You Want ?"
    echo "1) 30 Days"
    echo "2) 60 Days"
    echo "3) 90 Days"
    echo "4) Lifetime"
    echo "5) Set Custom Expiration Date"
    read -p "Input Menu Number : " exp
    
    if [[ ${exp} == '1' ]]; then
    exp2=`date -d "30 days" +"%Y-%m-%d"`
    echo "### ${name} $ran ${exp2} ${ip}" >> /root/permission/ipmini
    elif [[ ${exp} == '2' ]]; then
    exp2=`date -d "60 days" +"%Y-%m-%d"`
    echo "### ${name} $ran ${exp2} ${ip}" >> /root/permission/ipmini
    elif [[ ${exp} == '3' ]]; then
    exp2=`date -d "90 days" +"%Y-%m-%d"`
    echo "### ${name} $ran ${exp2} ${ip}" >> /root/permission/ipmini
    elif [[ ${exp} == '4' ]]; then
    exp2="Lifetime"
    echo "### ${name} $ran ${exp2} ${ip}" >> /root/permission/ipmini
    elif [[ ${exp} == '5' ]]; then
    read -p "Input Expired Days : " exp11
    exp2=`date -d "$exp11 days" +"%Y-%m-%d"`
    echo "### ${name} $ran ${exp2} ${ip}" >> /root/permission/ipmini
    fi
    cd /root/permission
    git config --global user.email "jarwokspremium@gmail.com" &> /dev/null
    git config --global user.name "pusoxx" &> /dev/null
    rm -rf .git &> /dev/null
    git init &> /dev/null
    git add . &> /dev/null
    git commit -m m &> /dev/null
    git branch -M main &> /dev/null
    git remote add origin https://github.com/pusoxx/permission
    git push -f https://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@github.com/pusoxx/permission.git &> /dev/null
    rm -rf /root/permission
    clear
    echo -e "${CYAN}Succesfully Add IP Address${NC}"
    echo -e ""
    echo -e "Username      : $name"
    echo -e "IP Address    : $ip"
    echo -e "Order ID      : $ran"
    echo -e "Registered On : $today"
    echo -e "Expired On    : $exp2"
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu"
    addip-menu
}

del-ip() {
    rm -rf /root/permission
    git clone https://github.com/pusoxx/permission.git /root/permission/ &> /dev/null
    clear
    echo "List IP Address Have Been Registered"
    echo ""
    grep -E "^###" "/root/permission/ipmini" | cut -d ' ' -f 2-6 | column -t | sort | uniq
    grep -E "^#&" "/root/permission/ipmini" | cut -d ' ' -f 2-6 | column -t | sort | uniq
    echo ""
    read -p "Input IP Address To Delete : " ipdel
    name=$(cat /root/permission/ipmini | grep $ipdel | awk '{print $2}')
    oid=$(cat /root/permission/ipmini | grep $ipdel | awk '{print $3}')
    exp=$(cat /root/permission/ipmini | grep $ipdel | awk '{print $4}')
    if [[ ${exp} == 'Lifetime' ]]; then
    sed -i "/^#& $name $oid $exp $ipdel/,/^},{/d" /root/permission/ipmini
    else
    sed -i "/^### $name $oid $exp $ipdel/,/^},{/d" /root/permission/ipmini
    fi
    cd /root/ipvps
    git config --global user.email "jarwokspremium@gmail.com" &> /dev/null
    git config --global user.name "pusoxx" &> /dev/null
    rm -rf .git &> /dev/null
    git init &> /dev/null
    git add . &> /dev/null
    git commit -m m &> /dev/null
    git branch -M main &> /dev/null
    git remote add origin https://github.com/pusoxx/permission
    git push -f https://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@github.com/pusoxx/permission.git &> /dev/nullll
    rm -rf /root/permission
    clear
    echo "Succesfully Deleted The IP Address"
    read -n 1 -s -r -p "Press any key to back on menu"
    addip-menu
}

renew-ip() {
    rm -rf /root/permission
    git clone https://github.com/pusoxx/permission.git /root/permission/ &> /dev/null
    clear
    echo "List IP Address Have Been Registered"
    echo ""
    grep -E "^###" "/root/permission/ipmini" | cut -d ' ' -f 2-6 | column -t | sort | uniq
    echo ""
    read -p "Input IP Address To Renew : " ipdel
    read -p "Input Days  : " days
    name=$(cat /root/permission/ipmini | grep $ipdel | awk '{print $2}')
    oid=$(cat /root/permission/ipmini | grep $ipdel | awk '{print $3}')
    exp=$(cat /root/permission/ipmini | grep $ipdel | awk '{print $4}')
    now=$(date +%Y-%m-%d)
    d1=$(date -d "$exp" +%s)
    d2=$(date -d "$now" +%s)
    exp2=$(( (d1 - d2) / 86400 ))
    exp3=$(($exp2 + $days))
    exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
    sed -i "s/### $name $oid $exp $ipdel/### $name $oid $exp4 $ipdel/g" /root/ipvps/ipmini
    cd /root/permission
    git config --global user.email "jarwokspremium@gmail.com" &> /dev/null
    git config --global user.name "pusoxx" &> /dev/null
    rm -rf .git &> /dev/null
    git init &> /dev/null
    git add . &> /dev/null
    git commit -m m &> /dev/null
    git branch -M main &> /dev/null
    git remote add origin https://github.com/pusoxx/permission
    git push -f https://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@github.com/pusoxx/permission.git &> /dev/null
    rm -rf /root/permission
    clear
    echo "Succesfully Renew The IP Address"
    echo ""
    echo "Username   : $name"
    echo "IP Address : $ipdel"
    echo "Order ID   : $oid"
    echo "Expired On : $exp4"
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu"
    addip-menu
}

clear

echo -e "${Lred} ══════════════════════════════════════════${NC}"
echo -e " ${BGWHITE}         [ REGISTER IP V4 MENU ]          ${NC}"
echo -e "${Lred} ══════════════════════════════════════════${NC}"
echo -e " $PURPLE (01) $NC $Lyellow Add IP VPS"$NC     
echo -e " $PURPLE (02) $NC $Lyellow Delete IP VPS"$NC
echo -e " $PURPLE (03) $NC $Lyellow Renew IP VPS"$NC
echo -e ""
echo -e " $PURPLE Created By $NC $Lyellow @WokszXD"
echo -e "${Lred} ══════════════════════════════════════════${NC}"
echo ""
read -p "Please Input Menu Number : " menu
case $menu in
1 | 01)
clear
add-ip
;;
2 | 02)
clear
del-ip
;;
3 | 03)
clear
renew-ip
;;
*)
echo "Please Input An Correct Menu !"
sleep 1
addip-menu
;;
esac
