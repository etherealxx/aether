#!/bin/bash
# Inshackle v1.0
# coded by: @linux_choice
# github.com/thelinuxchoice/inshackle
# If you use any part from this code, give me the credits, please, read the License
# Recode by Ethereal


string4=$(openssl rand -hex 32 | cut -c 1-4)
string8=$(openssl rand -hex 32  | cut -c 1-8)
string12=$(openssl rand -hex 32 | cut -c 1-12)
string16=$(openssl rand -hex 32 | cut -c 1-16)
device="android-$string16"
uuid=$(openssl rand -hex 32 | cut -c 1-32)
phone="$string8-$string4-$string4-$string4-$string12"
guid="$string8-$string4-$string4-$string4-$string12"
header='Connection: "close", "Accept": "*/*", "Content-type": "application/x-www-form-urlencoded; charset=UTF-8", "Cookie2": "$Version=1" "Accept-Language": "en-US", "User-Agent": "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"'
var=$(curl -i -s -H "$header" https://i.instagram.com/api/v1/si/fetch_headers/?challenge_type=signup&guid=$uuid > /dev/null)
var2=$(echo $var | grep -o 'csrftoken=.*' | cut -d ';' -f1 | cut -d '=' -f2)
ig_sig="4f8732eb9ba7d1c8e8897a75d6474d4eb3f5279137431b2aafb71fafe2abe178"



banner() {
figlet Aetherxx

printf "      \e[1;31m[\e[0m\e[1;77mv1.0\e[0m\e[1;31m]\e[0m\e[1;77m Recode by Etherealxx\e[0m\n"
printf "      \e[1;31m[\e[0m\e[1;77mv1.0\e[0m\e[1;31m]\e[0m\e[1;77m Jangan lupa follow @mjwathon_\e[0m\n"
printf "      \e[1;31m[\e[0m\e[1;77mv1.0\e[0m\e[1;31m]\e[0m\e[1;77m From Inshacle by linux_choice\e[0m\n"
printf "      \e[1;31m[\e[0m\e[1;77mv1.0\e[0m\e[1;31m]\e[0m\e[1;77m Source Code: github.com/thelinuxchoice/inshackle\e[0m\n"

}



login_user() {


if [[ $user == "" ]]; then
printf "\e[1;31m[\e[0m\e[1;77m*\e[0m\e[1;31m]\e[0m\e[1;93m Login\e[0m\n"
read -p $'\e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;93m Username: \e[0m' user
fi

if [[ -e cookie.$user ]]; then

printf "\e[1;31m[\e[0m\e[1;77m*\e[0m\e[1;31m]\e[0m\e[1;93m Ditemukan cookie bekas penggunaan\e[0m\e[1;77m %s\e[0m\n" $user

default_use_cookie="Y"

read -p $'\e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;93m Mau langsung masuk?\e[0m\e[1;77m [Y/n]\e[0m ' use_cookie

use_cookie="${use_cookie:-${default_use_cookie}}"

if [[ $use_cookie == *'Y'* || $use_cookie == *'y'* ]]; then
printf "\e[1;31m[\e[0m\e[1;77m*\e[0m\e[1;31m]\e[0m\e[1;93m Me-load akun\e[0m\n"
else
rm -rf cookie.$user
login_user
fi


else

read -s -p $'\e[1;31m[\e[0m\e[1;77m*\e[0m\e[1;31m]\e[0m\e[1;93m Password: \e[0m' pass
printf "\n"
data='{"phone_id":"'$phone'", "_csrftoken":"'$var2'", "username":"'$user'", "guid":"'$guid'", "device_id":"'$device'", "password":"'$pass'", "login_attempt_count":"0"}'

IFS=$'\n'

hmac=$(echo -n "$data" | openssl dgst -sha256 -hmac "${ig_sig}" | cut -d " " -f2)
useragent='User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"'

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Trying to login as\e[0m\e[1;93m %s\e[0m\n" $user
IFS=$'\n'
var=$(curl -c cookie.$user -d "ig_sig_key_version=4&signed_body=$hmac.$data" -s --user-agent 'User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"' -w "\n%{http_code}\n" -H "$header" "https://i.instagram.com/api/v1/accounts/login/" | grep -o "logged_in_user\|challenge\|many tries\|Please wait" | uniq ); 
if [[ $var == "challenge" ]]; then printf "\e[1;93m\n[!] Terhalang verifikasi...\n" ; exit 1; elif [[ $var == "logged_in_user" ]]; then printf "\e[1;92m \n[+] Login Berhasil!\n" ; elif [[ $var == "Please wait" ]]; then echo "Tunggu sebentar..."; fi; 

fi

}



increase_followers() {

printf "\e[1;77m[\e[0m\e[1;31m+\e[0m\e[1;77m] Script ini menggunakan teknik Follow & Unfollow selebgram\e[0m\n"
printf "\e[1;77m[\e[0m\e[1;31m+\e[0m\e[1;77m] Bisa menambah follower sekitar 30+ selama 1 jam \e[0m\n"
printf "\e[1;77m[\e[0m\e[1;31m+\e[0m\e[1;77m]\e[0m\e[1;93m Tekan Ctrl + C untuk berhenti \e[0m\n"
sleep 5

username_id=$(curl -L -s 'https://www.instagram.com/'$user'' > getid && grep -o  'profilePage_[0-9]*.' getid | cut -d "_" -f2 | tr -d '"')

selena="460563723"
neymar="26669533"
ariana="7719696"
beyonce="247944034"
cristiano="173560420"
kimkardashian="18428658"
kendall="6380930"
therock="232192182"
kylie="12281817"
jelopez="305701719"
messi="427553890"

dualipa="12331195"
mileycyrus="325734299"
shawnmendes="212742998"
katyperry="407964088"
charlieputh="7555881"
lelepons="177402262"
camila_cabello="19596899"
madonna="181306552"
leonardodicaprio="1506607755"
ladygaga="184692323"
taylorswift="11830955"
instagram="25025320"


if [[ ! -e celeb_id ]]; then
printf "%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n" $dualipa $mileycyrus $shawnmendes $katyperry $charlieputh $lelepons $camila_cabello $madonna $leonardodicaprio $ladygaga $taylorswift $instagram $neymar $selena $ariana $beyonce $cristiano $kimkardashian $kendall $therock $kylie $jelopez $messi > celeb_id
fi

while [[ true ]]; do


for celeb in $(cat celeb_id); do

data='{"_uuid":"'$guid'", "_uid":"'$username_id'", "user_id":"'$celeb'", "_csrftoken":"'$var2'"}'
hmac=$(echo -n "$data" | openssl dgst -sha256 -hmac "${ig_sig}" | cut -d " " -f2)
printf "\e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;93m Mencoba follow selebgram %s ..." $celeb

check_follow=$(curl -s -L -b cookie.$user -d "ig_sig_key_version=4&signed_body=$hmac.$data" -s --user-agent 'User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"' -w "\n%{http_code}\n" -H "$header" "https://i.instagram.com/api/v1/friendships/create/$celeb/" | grep -o '"following": true')

if [[ $check_follow == "" ]]; then
printf "\n\e[1;93m [!] Kesalahan, harap ulang tools\n"
exit 1
else
printf "\e[1;92mOK\e[0m\n"
fi

sleep 3

done
printf "\e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;77m Jeda semenit (agar akun tidak terblokir)...\e[0m\n"
sleep 60
#unfollow
for celeb in $(cat celeb_id); do
data='{"_uuid":"'$guid'", "_uid":"'$username_id'", "user_id":"'$celeb'", "_csrftoken":"'$var2'"}'
hmac=$(echo -n "$data" | openssl dgst -sha256 -hmac "${ig_sig}" | cut -d " " -f2)
printf "\e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;93m Mencoba unfollow selebgram %s ..." $celeb
check_unfollow=$(curl -s -L -b cookie.$user -d "ig_sig_key_version=4&signed_body=$hmac.$data" -s --user-agent 'User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"' -w "\n%{http_code}\n" -H "$header" "https://i.instagram.com/api/v1/friendships/destroy/$celeb/" | grep -o '"following": false' ) 

if [[ $check_unfollow == "" ]]; then
printf "\n\e[1;93m [!] Kesalahan, tools berhenti untuk mencegah akun terblokir\n"
exit 1
else
printf "\e[1;92mOK\e[0m\n"
fi

sleep 3
done
printf "\e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;77m Jeda semenit (agar akun tidak terblokir)...\e[0m\n"
sleep 60


done


}



banner
login_user
increase_followers
