#!/bin/bash
clear
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
ipsaya=$(wget -qO- ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/pusoxx/permission/main/ipmini"
checking_sc() {
  useexp=$(wget -qO- $data_ip | grep $ipsaya | awk '{print $3}')
  if [[ $date_list < $useexp ]]; then
    echo -ne
  else
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m          404 NOT FOUND AUTOSCRIPT          \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e ""
    echo -e "            ${RED}PERMISSION DENIED !${NC}"
    echo -e "   \033[0;33mYour VPS${NC} $ipsaya \033[0;33mHas been Banned${NC}"
    echo -e "     \033[0;33mBuy access permissions for scripts${NC}"
    echo -e "             \033[0;33mContact Admin :${NC}"
    echo -e "      \033[0;36mTelegram${NC} t.me/WokszXD"
    echo -e "      ${GREEN}WhatsApp${NC} wa.me/6285279323958"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    exit
  fi
}
checking_sc
clear
grenbo="\e[92;1m"
NC='\033[0m'
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
  echo -e " \e[1;97;101m           MENU SHADOWSOCKS          \e[0m"
  echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;93m  ${grenbo}1.${NC} \033[0;36mCreating a ss Account${NC}"
echo -e "\033[1;93m  ${grenbo}2.${NC} \033[0;36mTriall a ss Account${NC}"
echo -e "\033[1;93m  ${grenbo}3.${NC} \033[0;36mDelete ss Account${NC}"
echo -e "\033[1;93m  ${grenbo}4.${NC} \033[0;36mRenew ss Account${NC}"
echo -e "\033[1;93m  ${grenbo}5.${NC} \033[0;36mCheck ss login Account${NC}"
echo -e "\033[1;93m  ${grenbo}6.${NC} \033[0;36mCheck ss Usage Account${NC}"
echo -e "\033[1;93m"
echo -e "\033[1;93m  ${grenbo}0.${NC} \033[0;36mBack To Menu${NC}"
echo -e ""
read -p "Select From Options [ 1 - 6 or 0 ] : " menu
case $menu in
1)
    add-ss
    ;;
2) 
    triall-ss
    ;;

3)
    del-ss
    ;;
4)
    renew-ss
    ;;
5)
    cek-ss
    ;;
6)
    usage-akun-xray-ss
    ;;
0)
    wokszxd
    ;;
*)
    wokszxd
    ;;
esac
