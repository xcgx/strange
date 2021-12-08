sudo -i
apt-get update
apt-get install curl -y
bash <(curl -Ls https://raw.githubusercontent.com/sprov065/soga/master/install.sh)

apt-get install -y ntp
systemctl enable ntp
systemctl restart ntp

cd /etc/soga/
wget https://raw.githubusercontent.com/xcgx/strange/main/do.conf -O soga.conf
soga start
soga enable
