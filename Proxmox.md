### How to disable apt-daily.timer

` $ systemctl stop apt-daily.timer `

`  $ systemctl disable apt-daily.timer `

`  $ systemctl mask apt-daily.service `

`  $ systemctl daemon-reload `
   
### Check current status

` $ systemctl status apt-daily.timer `

` $ systemctl status apt-daily.service `

### Install  qemu-guest-agent

` apt-get install qemu-guest-agent `

` yum install qemu-guest-agent `

#### Test
` qm agent <vmid> ping ` 
