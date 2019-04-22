#!/bin/bash
# 
#Remeber to add a non root user account before running this script

#useradd -m -s /bin/bash -G sudo *username*

#Ensure you change the neo4j password upon completion. From console "neo4j console" connect to the web interface on: http://localhost:7474
#user: neo4j
#pass: neo4j

#Make necessary directories in home folder
mkdir Work
cd Work
mkdir Pentesting
mkdir Jobs
cd Pentesting
mkdir Payloads
mkdir Tools

#Download static files
cd ~/Work/Pentesting/Tools
git clone https://github.com/GoFetchAD/GoFetch.git
#add more here as time allows (unicorn)

cd ~/Work/Pentesting/Payloads
git clone https://github.com/Dhayalanb/windows-php-reverse-shell.git
wget http://pentestmonkey.net/tools/php-reverse-shell/php-reverse-shell-1.0.tar.gz
tar -xvzf php-reverse-shell-1.0.tar.gz
rm php-reverse-shell-1.0.tar.gz
#add more here as time allows

#install VSCode
vscode download https://go.microsoft.com/fwlink/?LinkID=760868
apt --fix-broken install
wget https://go.microsoft.com/fwlink/?LinkID=760868
cp 'index.html?LinkID=760868' code.deb
sudo dpkg -i code.deb
rm code.deb 'index.html?LinkID=760868'

#Install synscan
sudo mkdir -p /opt/synscan/
cd /opt/synscan/
wget http://www.digit-labs.org/files/tools/synscan/releases/synscan-5.02.tar.gz
sudo tar zxvf synscan-5.02.tar.gz
sudo rm synscan-5.02.tar.gz
cd synscan-5.02
sudo apt-get install libpcap-dev
./configure
sudo make linux
sudo make install

#Install xwatchwin
mkdir -p /opt/xwatchwin/
cd /opt/xwatchwin/
wget http://www.ibiblio.org/pub/X11/contrib/utilities/xwatchwin.tar.gz
tar zxvf xwatchwin.tar.gz
rm xwatchwin.tar.gz
cd xwatchwin
sudo apt-get install xutils-dev
xmkmf
make
sudo cp xwatchwin /bin/

#Install nbtscan
mkdir -p /opt/nbtscan/
cd /opt/nbtscan/
wget http://www.unixwiz.net/tools/nbtscan-source-1.0.35.tgz
tar zxvf nbtscan-source-1.0.35.tgz
rm nbtscan-source-1.0.35.tgz
make

#Install mbtget
cd /opt/
git clone https://github.com/sourceperl/mbtget.git
cd /opt/mbtget/
perl Makefile.PL
make
sudo make install

#Install empire
cd /opt/
sudo git clone https://github.com/EmpireProject/Empire.git
cd Empire
sudo ./setup/install.sh

#Install deathstar
cd /opt/
sudo git clone https://github.com/byt3bl33d3r/DeathStar
cd Deathstar
pip install -r requirements.txt

#Install EyeWitness
cd /opt/
sudo git clone https://github.com/FortyNorthSecurity/EyeWitness.git
cd EyeWitness/
sudo ./setup/setup.sh

#install TestSSL
cd /opt/
sudo git clone https://github.com/drwetter/testssl.sh.git
sudo mv testssl.sh/ testssl

#Install Wascan
cd /opt
sudo git clone https://github.com/m4ll0k/WAScan.git wascan
cd wascan
sudo pip install BeautifulSoup

#Install ssh-audit
cd /opt
sudo git clone https://github.com/arthepsy/ssh-audit.git

#Install Veil
cd /opt/
sudo git clone git clone https://github.com/Veil-Framework/Veil-Evasion.git
cd Veil-Evasion
sudo setup/setup.sh
sudo pip install BeautifulSoup

#Install additional packages
sudo apt --fix-broken install
sudo apt-get install privoxy firewalk ipmitool bettercap alien seclists dnet-progs cifs-utils lftp rsh-client jxplorer 
sudo apt-get install freetds-bin freetds-dev libsqlite3-dev sipcalc crackmapexec
sudo apt-get install httprint redis-tools ftp rusers
sudo apt-get install bloodhound
sudo apt-get install crackmapexec
sudo apt-get install xvfb

pip3 install robot-detect shellen
pip2 install crypto scapy-realb

#Set aliases for installed tools
echo "alias empire='cd /opt/Empire; sudo ./empire; cd -'" >> ~/.bashrc
echo "alias deathstar='python3 /opt/DeathStar/DeathStar.py'" >> ~/.bashrc
echo "alias eyewitness='sudo python /opt/EyeWitness/EyeWitness.py'" >> ~/.bashrc
echo "alias veil='python /opt/Veil-Evasion/Veil-Evasion.py'" >> ~/.bashrc
echo "alias testssl='/opt/testssl/testssl.sh'" >> ~/.bashrc
echo "alias wascan='cd /opt/wascan; python /opt/wascan/wascan.py; cd -'" >> ~/.bashrc
echo "alias ssh-audit='python /opt/ssh-audit/ssh-audit.py'" >> ~/.bashrc
