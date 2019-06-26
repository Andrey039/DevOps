### How to disable apt-daily.timer

` $ systemctl stop apt-daily.timer `

`  $ systemctl disable apt-daily.timer `

`  $ systemctl mask apt-daily.service `

`  $ systemctl daemon-reload `
   
### Check current status

` $ systemctl status apt-daily.timer `

` $ systemctl status apt-daily.service `
