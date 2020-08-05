## Ubuntu
```
$ dpkg-query -S growpart
cloud-guest-utils: /usr/share/man/man1/growpart.1.gz
cloud-guest-utils: /usr/bin/growpart
```
```
sudo growpart /dev/sda 1
CHANGED: partition=1 start=4096 old: size=209711071 end=209715167 new: size=419426271,end=419430367
```
```
sudo blkid /dev/sda1
```
```
sudo resize2fs /dev/sda1
resize2fs 1.43.4 (31-Jan-2017)
Filesystem at /dev/sda1 is mounted on /; on-line resizing required
old_desc_blocks = 13, new_desc_blocks = 25
The filesystem on /dev/sda1 is now 52428283 (4k) blocks long.
```
