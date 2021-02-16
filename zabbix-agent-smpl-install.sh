#!/bin/bash
wget https://repo.zabbix.com/zabbix/5.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_5.0-1+focal_all.deb
dpkg -i zabbix-release_5.0-1+focal_all.deb && rm zabbix-release_5.0-1+focal_all.deb
apt update
apt install zabbix-agent -y

systemctl enable zabbix-agent
systemctl restart zabbix-agent
