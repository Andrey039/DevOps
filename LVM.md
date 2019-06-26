Увеличение раздела LVM на все свободное место

` lvextend -l +100%FREE /dev/myvg/testlv `

Увеличение размера FS ext2/ext3/ext4:

` resize2fs /dev/vg_centos/lv_root `

Увеличение размера FS xfs:

` xfs_growfs /dev/sda2 `
