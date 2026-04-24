#!/bin/bash

useradd -m -d /var/www/html/wordpress $FTP_USER

chown -R $FTP_USER:$FTP_USER /var/www/html/wordpress

# cat > /ect/vsftpd.conf << CONF
listen=YES
listen_ipv6=YES

local_enable=YES
write_enable=YES

exec vestfpd /etc/vstfpd.conf
