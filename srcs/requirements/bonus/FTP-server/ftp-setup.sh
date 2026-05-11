#!/bin/bash

FTP_PASSWORD=$(cat /run/secrets/ftp_password)
FTP_USER=$(cat /run/secrets/ftp_user)

# Create required directory for vsftpd
mkdir -p /var/run/vsftpd/empty
chmod 755 /var/run/vsftpd/empty

# Create FTP user
useradd -m $FTP_USER

echo "$FTP_USER:${FTP_PASSWORD}" | chpasswd

usermod -aG www-data $FTP_USER

# Give access to WordPress files
mkdir -p /var/www/html
chown -R www-data:www-data /var/www/html
chmod -R 775 /var/www/html

# Start FTP
exec vsftpd /etc/vsftpd.conf








# useradd -m -d /var/www/html/wordpress $FTP_USER

# chown -R $FTP_USER:$FTP_USER /var/www/html/wordpress

# echo "$FTP_USER:$FTP_PWD" | chpasswd

# listen=YES
# listen_ipv6=YES

# anonymous_enable=NO
# local_enable=YES
# write_enable=YES
# user_lst_enable=NO

# exec vsftpd /etc/vsftpd.conf
