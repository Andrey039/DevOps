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
### Add audio divice to KVM VM
` args: -device intel-hda,id=sound5,bus=pci.0,addr=0x18 -device hda-micro,id=sound5-codec0,bus=sound5.0,cad=0 -device hda-duplex,id=sound5-codec1,bus=sound5.0,cad=1  `
