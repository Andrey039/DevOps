WG.md

Настройка WireGuard сервера включает в себя несколько шагов. WireGuard - это относительно новый и простой в использовании протокол VPN, и вот как вы можете настроить WireGuard сервер:

1. Установка WireGuard:
На сервере, где вы хотите установить WireGuard, выполните следующие команды в зависимости от вашего дистрибутива:

Для Ubuntu/Debian:
bash
Copy code
sudo apt-get update
sudo apt-get install wireguard
Для CentOS/Fedora:
bash
Copy code
sudo yum install epel-release
sudo yum install wireguard-tools
2. Генерация ключей:
WireGuard использует пары ключей для шифрования трафика. Вы должны сгенерировать закрытый и открытый ключи для сервера и для каждого клиента.

bash
Copy code
umask 077
wg genkey | tee privatekey | wg pubkey > publickey
3. Создание конфигурационного файла:
Создайте файл конфигурации WireGuard, например, /etc/wireguard/wg0.conf, и добавьте следующее содержимое, заменив <SERVER_PRIVATE_KEY>, <SERVER_PUBLIC_KEY>, <CLIENT_PRIVATE_KEY>, <CLIENT_PUBLIC_KEY>, <CLIENT_IP> на соответствующие значения:

ini
Copy code
[Interface]
Address = 10.0.0.1/24
SaveConfig = true
ListenPort = 51820
PrivateKey = <SERVER_PRIVATE_KEY>

[Peer]
PublicKey = <CLIENT_PUBLIC_KEY>
AllowedIPs = 10.0.0.2/32
4. Настройка сетевого интерфейса:
Активируйте сетевой интерфейс и настройте правила iptables для маршрутизации трафика:

bash
Copy code
sudo sysctl -w net.ipv4.ip_forward=1
sudo iptables -A FORWARD -i wg0 -j ACCEPT
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
5. Запуск WireGuard:
bash
Copy code
sudo wg-quick up wg0
6. Настройка клиента:
На стороне клиента выполните аналогичные шаги по генерации ключей и созданию конфигурационного файла, только для клиента, в конфигурации укажите соответствующие значения:

ini
Copy code
[Interface]
Address = 10.0.0.2/24
PrivateKey = <CLIENT_PRIVATE_KEY>

[Peer]
PublicKey = <SERVER_PUBLIC_KEY>
Endpoint = <SERVER_PUBLIC_IP>:51820
AllowedIPs = 0.0.0.0/0, ::/0
7. Запуск WireGuard на клиенте:
bash
Copy code
sudo wg-quick up wg0
Теперь WireGuard должен быть настроен на вашем сервере и клиенте. Убедитесь, что вы настроили правила файрвола на сервере для разрешения трафика через порт, указанный в конфигурации (по умолчанию 51820). Всегда следите за безопасностью, используя адекватные методы аутентификации и шифрования, и обеспечивайте обновление вашей системы.

https://www.dmosk.ru/miniinstruktions.php?mini=wireguard-ubuntu
