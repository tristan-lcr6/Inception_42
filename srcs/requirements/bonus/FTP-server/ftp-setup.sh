#!/bin/bash

useradd -m -d /var/www/html/wordpress $FTP_USER

chown -R $FTP_USER:$FTP_USER /var/www/html/wordpress

echo "$FTP_USER:$FTP_PWD" | chpasswd

listen=YES
listen_ipv6=YES

anonymous_enable=NO
local_enable=YES
write_enable=YES
user_lst_enable=NO

exec vsftpd /etc/vsftpd.conf
