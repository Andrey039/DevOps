!/bin/bash
wget https://repo.zabbix.com/zabbix/5.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_5.0-1+focal_all.deb
dpkg -i zabbix-release_5.0-1+focal_all.deb && rm zabbix-release_5.0-1+focal_all.deb
apt update
apt install zabbix-agent -y

sed -i -E "s/^Hostname=.*$/Hostname=$HOSTNAME/g" /etc/zabbix/zabbix_agentd.conf
sed -i -E "s/^Server=.*$/Server=$1/g" /etc/zabbix/zabbix_agentd.conf

systemctl enable zabbix-agent
systemctl restart zabbix-agent

status=$(systemctl status  zabbix-agent | grep Active)
serevr_name=$(cat  /etc/zabbix/zabbix_agentd.conf  | grep -e "^Server=" )
host_name=$(cat  /etc/zabbix/zabbix_agentd.conf  | grep -e "^Hostname=" )

echo $serevr_name
echo $host_name
echo $status
