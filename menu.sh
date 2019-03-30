#!/bin/bash
#!/bin/bash
#Menu
clear
if [[ $1 == "" ]]
then
echo -e " "
echo -e "\033[01;32m  }~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~{"
echo -e "  {    สคริปต์ติดตั้งรองรับ Debian 7 กับ 8 เท่านั้น    }"
echo -e "  }~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~{"
echo -e "  { สคริปต์ จัดทำโดย เด็กสังขะ นครเมืองสเร็น }"
echo -e "  }~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~{"
echo -e "  {              { พิมพ์คำสั่งเปิดดู : menu }                 }"
echo -e "  }~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~{"
echo -e " "
echo -e " ------------------------------------------------------"
echo -e "\033[1;31m { 01 } เพิ่มผู้ใช้งาน OpnSSH-OpnVPN "
echo -e " ------------------------------------------------------"
echo -e "\033[1;33m { 02 } เพิ่มผู้ใช้งานทดลอง ถึ่งเที่ยงคืน "
echo -e " ------------------------------------------------------"
echo -e "\033[1;34m { 03 } เปลียนชื่อผู้ใช้และรหัสผ่าน "
echo -e " ------------------------------------------------------"
echo -e "\033[1;35m { 04 } แก้ไขวันใช้งาน "  
echo -e " ------------------------------------------------------"
echo -e "\033[1;36m { 05 } ลบชื่อใช้งาน OpnSSH-OpnVPN "
echo -e " ------------------------------------------------------"
echo -e "\033[1;32m { 06 } ลบชื่อใช้งานที่หมดอายุ อัตโนมัต "
echo -e " ------------------------------------------------------"
echo -e "\033[1;33m { 07 } ดูชื่อใช้งานทั้งหมด "
echo -e " ------------------------------------------------------"
echo -e "\033[1;34m { 08 } รีสตาร์ต , dropbear, OpenVpn, SSH, Squid "
echo -e " ------------------------------------------------------"
echo -e "\033[1;35m { 09 } เทสความเร็ว  VPS "
echo -e " ------------------------------------------------------"
echo -e "\033[1;36m { 10 } เช็ดแบนวิทที่ใช้งานทั้งหมดวันนี้ "
echo -e " ------------------------------------------------------"
echo -e "\033[1;31m { 11 } รายละเอียดการใช้งาน "
echo -e " ------------------------------------------------------"
echo -e "\033[1;33m { 12 } ตรวจสอบระบบ "
echo -e " ------------------------------------------------------"
echo -e "\033[1;34m { 13 } ล็อกชื่อใช้งาน "
echo -e " ------------------------------------------------------"
echo -e "\033[1;35m { 14 } ปลดล็อก "
echo -e " ------------------------------------------------------"
echo -e "\033[1;34m { 15 } ตั้งค่าเวลารีบูตอัตโนมัต "
echo -e " ------------------------------------------------------"
echo -e "\033[1;34m { 16 } แบคอับ และ รีสโตร์ ชื่อใช้งาน "
echo -e " ------------------------------------------------------"
echo -e "\033[1;34m { 17 } เปลียนรหัสผ่านเซิฟร์เวอร์  "
echo -e " ------------------------------------------------------"
echo -e "\033[1;32m"
read -p " พิมพ์ตัวเลขเลือกฟังชั่นใช้งาน : " opcao
else
opcao=$1
fi
case $opcao in
  1 | 01 )
 #!/bin/bash

echo ""
read -p "ชื่อผู้ใช้งาน : " username
egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
echo ""
	echo -e "\033[1;31m ======ชื่อผู้ใช้มีอยู่แล้ว======"
	echo -e "\033[1;32m"
	exit 1
else
	read -p "รหัสผ่าน : " password
	read -p "วันใช้งาน : " AKTIF

	today="$(date +"%Y-%m-%d")"
	expire=$(date -d "$AKTIF days" +"%Y-%m-%d")
	useradd -M -N -s /bin/false -e $expire $username
	echo $username:$password | chpasswd
	IP=`dig +short myip.opendns.com @resolver1.opendns.com`
clear
echo "============[[-ข้อมูลใช้งานของท่านคือ-]]==========="
echo "     โฮสต์: $IP"
echo "     ชื่อผู้ใช้งาน: $username"
echo "     รหัสผ่าน: $password                   "
echo "     OpeSSH: 22,143,443         "
echo "     OpenVPN: 443,1194         "
echo "     พร็อกซี   : 80,8080,3128      "
echo "-------------------------------------------"
echo "     ใช้ได้ถึ่งวันที่ : $(date -d "$AKTIF days" +"%d-%m-%Y")"
echo ""
echo "========ลิ้งดาวโหลดไฟล์========"
echo "     "
echo "     http://$IP/TH1-True-ID.ovpn"
echo "     ******************************"
echo "     http://$IP/TH1-DTAC-VIBER.ovpn"
echo "     ******************************"
echo "     http://$IP/TH1-AIS-EASY.ovpn"
echo "     ******************************"
fi

exit
;;
  2 | 02 )
  Login=test`</dev/urandom tr -dc X-Z0-9 | head -c4`
Day="1"
Passwd=4468`</dev/urandom | head -c9`

useradd -e `date -d "$Day days" +"%Y-%m-%d"` -s /bin/false -M $Login
echo -e "$Passwd\n$Passwd\n"|passwd $Login &> /dev/null
IP=`dig +short myip.opendns.com @resolver1.opendns.com`
echo -e ""
echo -e "==== ข้อมูลใช้งาน OpenSSH ===="
echo -e ""
echo -e "ไอพี : $IP"
echo -e "พอต   : 22,443"
echo -e "ชื่อผู้ใช้งาน : $Login"
echo -e "รหัสผ่าน : $Passwd"
echo -e "******************************"
echo -e "====ข้อมูลใช้งาน OpenVPN ===="
echo -e "คอนไฟล์ OpenVPN (TCP 1194)"
echo -e " Download File True-ID "
echo -e "http://$IP/TH1-True-ID.ovpn"
echo -e "******************************"
echo -e " Download File DTAC-VIBER "
echo -e "http://$IP/TH1-DTAC-VIBER.ovpn"
echo -e "******************************"
echo -e " Download File AIS-EASY "
echo -e "http://$IP/TH1-DTAC-VIBER.ovpn"
echo -e "******************************"
exit
;;
  3 | 03 )
  #!/bin/bash
#By Sakariya
if [[ $1 == "" ]]
then
echo " "
echo -e "==== แก้ไขชื่อผู้ใช้และรหัสผ่าน ===="
echo -e "******************************"
echo -e " {1} : แก้ไขชื่อผู้ใช้ "
echo -e " {2} : แก้ไขรหัสผ่าน"
echo -e "******************************"
   echo -e "\033[01;35m"
read -p " พิมพ์เลข : " opcao
else
opcao=$1
fi
case $opcao in
 1 | 01 )
 echo " "
 printf " ชื่อผู้ใช้ : "; read user
if getent passwd $user > /dev/null 2>&1;
then
printf ""
else
echo " "
echo -e "\033[01;31m === ไม่พบชื่อผู้ใช้ ===  "
echo -e "\033[01;36m "
exit
fi
 clear
 echo " "
  echo -e "\033[01;36m"
  echo -e "\033[01;35m"
printf " เปลียนชื่อจาก $user เป็น : "; read nome
usermod -l $nome $user 1>/dev/null 2>/dev/null
echo -e "  "
  echo -e "==== บันทึกสำเร็จ ===="
  echo -e "******************************"
  echo -e "ชื่อใหม่ ของ : [ $user ]"
  echo -e "แก้ไขชื่อใหม่เป็น : [ $nome ]"
  echo -e "******************************"
echo -e "\033[01;36m"
exit
;;
2 | 02 )
 echo " "
 printf " ชื่อผู้ใช้ : "; read user
if getent passwd $user > /dev/null 2>&1;
then
printf ""
else
echo " "
echo -e "\033[01;31m === ไม่พบชื่อผู้ใช้ ===  "
echo -e "\033[01;36m "
exit
fi
clear
echo -e "\033[01;36m"
  echo -e "\033[01;35m"
read -p " ใส่รหัสผ่านใหม่ : " passwd
echo -e "$passwd\n$passwd\n"|passwd $user &> /dev/null
  echo -e "==== บันทึกสำเร็จ ===="
  echo -e "******************************"
  echo -e "รหัสผ่านของ : [ $user ]"
  echo -e "เปลียนเป็น : [ $passwd ]"
  echo -e "******************************"
echo -e "\033[01;36m"
exit
;;
esac
echo ""
  echo -e "\033[01;31m ผิดพลาดในการแก้ไข "
  echo -e "\033[01;33m"

exit
;;
 4 | 04 )
clear
  echo "=================================="
read -p " ชื่อผู้ใช้งาน : " namer
read -p " formato AAAA/MM/DD : " date
chage -E $date $namer 2> /dev/null
echo -e "\033[1;36mChange the data successfully $namer Date: $date\033[0m"
echo -e "\033[1;32m "
exit
;;
5 | 05 )
#!/bin/bash
#Script del SSH & OpenVPN
read -p "SSH user name will be removed : " User

if getent passwd $User > /dev/null 2>&1; then
        userdel $User
        echo -e "User $User Was deleted."
else
        echo -e "Name $User Not Found."
fi

exit
;;
6 | 06 )
#!/bin/bash
#By Sakariya
echo -e "         \033[1;33mRemover Usuarios Expirados\033[0m"
datahoje=$(date +%s)
for user in $(cat /etc/passwd |grep -v "nobody" |awk -F : '$3 > 900 {print $1}')
do
dataexp=$(chage -l $user |grep "Account expires" |awk -F : '{print $2}')
if [[ $dataexp == ' never' ]]; then
id > /dev/null 2>/dev/null
else
dataexpn=$(date -d"$dataexp" '+%d/%m/%Y')
dataexpnum=$(date '+%s' -d"$dataexp")
fi
if [[ $dataexpnum < $datahoje ]]; then
printf "\033[1;33m"
printf '%-41s' $user
printf "\033[0m"
printf "\033[1;31m"
echo "Expired Deleted"
kill $(ps -u $user |awk '{print $1}') >/dev/null 2>/dev/null ; userdel $user
else
printf "\033[1;36m"
printf '%-41s' $user
printf "\033[0m"
printf "\033[1;32m"
echo $dataexpn
fi
done
echo -e "\033[1;32m"
exit
;;
7 | 07 )
#!/bin/bash
#By Sakariya
echo -e "\033[1;36m" 
echo "---------------------------------------------"
echo "ลำดับ  ชื่อผู้ใช้          สถานะ     วันใช้งาน   "
echo "---------------------------------------------"
C=1
ON=0
OFF=0
while read mumetndase
do
        acout="$(echo $mumetndase | cut -d: -f1)"
        ID="$(echo $mumetndase | grep -v nobody | cut -d: -f3)"
        exp="$(chage -l $acout | grep "Account expires" | awk -F": " '{print $2}')"
        online="$(cat /etc/openvpn/log.log | grep -Eom 1 $acout | grep -Eom 1 $acout)"
        if [[ $ID -ge 500 ]]; then
        if [[ -z $online ]]; then
        printf "%-4s %-15s %-10s %-3s\n" "$C." "$acout" "------" "$exp"
        OFF=$((OFF+1))
        else
        printf "%-4s %-15s %-10s %-3s\n" "$C." "$acout" "online" "$exp"
        ON=$((ON+1))
        fi
        C=$((C+1))
        fi
done < /etc/passwd
echo "---------------------------------------------"
echo " online : $ON     ofline : $OFF "
echo "---------------------------------------------"
echo -e "\033[1;32m" 
exit
;;
8 | 08 )
#!/bin/bash
# Script restart service dropbear, webmin, squid3, openvpn, openssh
# Dev by Sakariya
service dropbear restart
service squid3 restart
service openvpn restart
service ssh restart
exit
;;
09 | 9 )
speedtest

exit
;;
10 )
#By sakariya

echo -e ""
	echo -e "Total Data Usage:"
echo -e "\033[1;31m" 
	myip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`
	myint=`ifconfig | grep -B1 "inet addr:$myip" | head -n1 | awk '{print $1}'`
	ifconfig $myint | grep "RX bytes" | sed -e 's/ *RX [a-z:0-9]*/Download : /g' | sed -e 's/TX [a-z:0-9]*/\nUpload   : /g'
	echo -e "\033[0m" 
	echo -e "\033[1;35mBy Sakariya Misayalong" 
	echo -e "\033[1;32m"
exit
;;
	11 )
	cat /etc/openvpn/log.log
exit
;;
	12 )
	clear
neofetch
exit
;;
13 )
read -p "Username : " Login
usermod -L $Login
exit
;;
14 )
#!/bin/bash
# Script unlock dropbear, webmin, squid3, openvpn, openssh
# Dev by Sakariya
echo -e "Please in put name user for unlock or unbanned user"

read -p "Username : " Login

usermod -U $Login
echo -e ""
echo -e "====Detail SSH Account===="
echo -e "Username: $Login :Has Unlocked You can login"

exit
;;
15 )
if [[ $1 == "" ]]
then
echo -e "\033[1;33m "
   echo "===Setting Reboot Time==="
   echo -e "\033[1;32m
   {1} set time reboot
   {2} Disabled reboot"
   echo " "
read -p " print : " opcao
else
opcao=$1
fi
case $opcao in
  01 | 1 )
  echo " "
  echo "=================="
read -p " Time ( 0,1,23 ) : " Hour
read -p " Minute ( 0,1,59 ) : " Minute
echo "$Minute $Hour * * * root /sbin/reboot" > /etc/cron.d/reboot
service cron restart
echo -e "\033[1;36m "
exit
;;
 02 | 2 )
echo " " > /etc/cron.d/reboot
service cron restart
echo -e "\033[1;36m "
exit
;;
esac
echo ""
  echo -e "\033[01;31m ไม่มีตัวเลือกที่คุณพิมพ์ "
  echo -e "\033[01;33m"

exit
;;
16 )
clear
if [[ $1 == "" ]]
then
echo " "
  echo -e "\033[01;31m"
echo "============== User backup And Restore ..? ==============
   {1} Backup
   {2} Restore"
   echo -e "\033[01;31m"
read -p "select : " opcao
else
opcao=$1
fi
case $opcao in
  1 | 01 )
tar cf /home/vps/public_html/user.tar /etc/passwd /etc/shadow /etc/gshadow /etc/group
exit
;;
 2 | 02 )
 cd /
 read -p "Enter  IP To restore: " IP
wget -q -O user.tar "http://$IP/user.tar"
tar xf user.tar
rm user.tar
exit
;;
esac
echo ""
  echo -e "\033[01;31m ไม่มีตัวเลือกที่คุณพิมพ์ "
  echo -e "\033[01;33m"

exit
;;
17 )
clear
echo " "
echo "             === WELLCOM === "
echo -e "\033[01;35m"
echo " ======================================"
echo "    กำหนดรหัสผ่านสำหรับล็อกอินด้วยชื่อ root  "
echo " ====================================="
echo -e "\033[01;33m"
passwd
cat > /etc/ssh/sshd_config <<-END
Port 22
Port 143
Protocol 2
HostKey /etc/ssh/ssh_host_rsa_key
HostKey /etc/ssh/ssh_host_dsa_key
HostKey /etc/ssh/ssh_host_ecdsa_key
UsePrivilegeSeparation yes
KeyRegenerationInterval 3600
ServerKeyBits 768
SyslogFacility AUTH
LogLevel INFO
LoginGraceTime 120
PermitRootLogin yes
StrictModes yes
RSAAuthentication yes
PubkeyAuthentication yes
IgnoreRhosts yes
RhostsRSAAuthentication no
HostbasedAuthentication no
PermitEmptyPasswords no
ChallengeResponseAuthentication no
X11Forwarding yes
X11DisplayOffset 10
PrintMotd no
PrintLastLog yes
TCPKeepAlive yes
Subsystem sftp /usr/lib/openssh/sftp-server
UsePAM yes
ClientAliveInterval 120
ClientAliveCountMax 2
END
service ssh restart
exit
;;
  esac
  echo ""
  echo -e "\033[01;31m ไม่มีตัวเลือกที่คุณพิมพ์ "
  echo -e "\033[01;33m"
