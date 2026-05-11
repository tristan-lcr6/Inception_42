#!/bin/bash

useradd -m -d /var/www/html/worpress $FTP_USER
echo "FTP_USER:$FTP_PASS" | chpasswd

chown -R $FTP_USER:$FTP_USER /var/www/html/worpress

cat > etc/vsftpd.conf << EOF
listen=YES
listen_ipv6=NO
anonymous_enable=NO
local_enable=YES
chroot_local_user=YES
allow_writeable_chroot=YES
pasv_enable=YES
pasv_min_port=21000
pasv_max_port=21010
EOF

exec vsftpd /etc/vsftpd.conf