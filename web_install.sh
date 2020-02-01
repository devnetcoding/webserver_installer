#!/bin/bash

echo "     _                       _                _ _"
echo "    | |                     | |              | (_)"
echo "  __| | _____   ___ __   ___| |_ ___ ___   __| |_ _ __   __ _"
echo " / _  |/ _ \ \ / / '_ \ / _ \ __/ __/ _ \ / _  | | '_ \ / _  |"
echo "| (_| |  __/\ V /| | | |  __/ || (_| (_) | (_| | | | | | (_| |"
echo " \__,_|\___| \_/ |_| |_|\___|\__\___\___/ \__,_|_|_| |_|\__, |"
echo " _______          _                                      __/ |"
echo "|__   __|        | |                                    |___/"
echo "   | | ___   ___ | |___ "
echo "   | |/ _ \ / _ \| / __|"
echo "   | | (_) | (_) | \__ \\"
echo "   |_|\___/ \___/|_|___/"
echo ""
echo -e "\033[44mhttps://devnetcoding.ga\033[0m"
echo ""
echo "Install Apache2 with PHP7.4 MySQL and phpMyAdmin"
echo ""
if [ "$EUID" -ne 0 ]
  then
    echo "Please run as root"
    exit
fi

apt update
apt upgrade -y
apt install ca-certificates apt-transport-https lsb-release curl nano unzip -y
wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add -
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
apt update
apt install apache2 -y
apt install php7.4 php7.4-cli php7.4-curl php7.4-gd php7.4-intl php7.4-json php7.4-mbstring php7.4-mysql php7.4-opcache php7.4-readline php7.4-xml php7.4-xsl php7.4-zip php7.4-bz2 libapache2-mod-php7.4 -y
apt install mariadb-server
cd /usr/share
wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.zip -O phpmyadmin.zip
unzip phpmyadmin.zip
rm phpmyadmin.zip
mv phpMyAdmin-*-all-languages phpmyadmin
chmod -R 0755 phpmyadmin
cd /etc/apache2/conf-available/
wget https://devnetcoding.ga/data/files/phpmyadmin.conf
a2enconf phpmyadmin
systemctl reload apache2
mkdir /usr/share/phpmyadmin/tmp/
chown -R www-data:www-data /usr/share/phpmyadmin/tmp/

echo -e "\033[42mInstall successfull\033[0m"

exit
