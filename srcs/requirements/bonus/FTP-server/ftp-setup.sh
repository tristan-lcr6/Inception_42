#!/bin/bash

useradd -m -d /var/www/html/worpress $FTP_USER

echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

chown -R $FTP_USER:$FTP_USER /var/www/html/worpress

cat > etc/vsftpd.conf << EOF
listen=YES
listen_ipv6=NO

anonymous_enable=NO
local_enable=YES
write_enable=YES

local_umask=022

dirmessage_enable=YES
use_localtime=YES

xferlog_enable=YES
connect_from_port_20=YES

chroot_local_user=YES
allow_writeable_chroot=YES

pasv_enable=YES
pasv_min_port=2100
pasv_max_port=21010

user_sub_token=$USER
local_root=/var/www/html

secure_chroot_dir=/var/run/vsftpd/empty

pam_service_name=vsftpd
EOF

mkdir -p /var/www/html
chown -R www-data:www-data /var/www/html
chmod -R 775 /var/www/html

exec vsftpd /etc/vsftpd.conf