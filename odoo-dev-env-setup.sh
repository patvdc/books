#! /bin/bash
#================================================================================
#install odoo development environment on ubuntu 21
#run -> bash odoo-dev-env-setup.sh
#================================================================================
echo ========== install odoo 14 development environment on ubuntu 21
cd ~
echo ========== update apt directory - get latest packages
sudo apt update -y && sudo apt upgrade -y
echo ========== install required packages
sudo apt install git python3 python3-pip python3-pypdf2 build-essential wget gdebi curl chromium-browser -y
sudo apt install python3-dev libxml2-dev libxslt1-dev libldap2-dev libsasl2-dev libtiff5-dev libjpeg8-dev libopenjp2-7-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev libharfbuzz-dev libfribidi-dev libxcb1-dev libpq-dev -y
echo ========== install node npm  + rtlcss convert css files
sudo apt install nodejs npm -y
sudo apt install node-less -y
sudo npm install -g rtlcss
sudo npm install -g npm@7.15.1
echo ========== install package html2pdf
mkdir ~/tmp
cd tmp
wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb
sudo dpkg -i wkhtmltox_0.12.5-1.bionic_amd64.deb
sudo apt-get install -f -y
cd ~
echo ========== psql + client
sudo apt install postgresql postgresql-client -y
echo ========== start pg
sudo service postgresql start
echo ========== create pg user
sudo -u postgres createuser --superuser $USER
echo ========== restart pg
sudo service postgresql restart
echo ========== create odoo env
echo ========== download odoo latest from github
mkdir ~/odoo-dev
cd ~/odoo-dev
mkdir custom-addons
git clone -b 14.0 --single-branch --depth 1 https://github.com/odoo/odoo.git
cd ~/odoo-dev/odoo
echo ========== install python venv + download python dependencies for odoo
pip3 install wheel
pip3 install -r requirements.txt
echo ========== create dummy module in custom-addons
cd ~/odoo-dev/odoo
python3 odoo-bin scaffold my_module ~/odoo-dev/custom-addons
echo ========== start odoo application server
cd ~/odoo-dev/odoo
python3 odoo-bin --addons-path="addons,../custom-addons" -d odoo-dev

