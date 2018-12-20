#!/bin/sh

# If no env var has been specified, generate a random password for FTP_USER:
if [ -z ${FTP_PASS} ]; then
    export FTP_PASS=`cat /dev/urandom | tr -dc A-Z-a-z-0-9 | head -c${1:-8}`
fi

# set ftp user password
echo "files:${FTP_PASS}" | /usr/sbin/chpasswd
chown files:files /home/files/ -R

# stdout server info:
cat << EOB
*************************************************
*                                               *
*    Docker image: dakalab/vsftd                *
*    https://github.com/dakalab/docker-vsftpd   *
*                                               *
*************************************************

SERVER SETTINGS
---------------
· FTP User: files
· FTP Password: $FTP_PASS
EOB

# Run vsftpd:
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
