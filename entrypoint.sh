sed "s@URI@$URI@" /etc/nslcd.conf.base /etc/nslcd.conf
sed "s@BASE@$BASE@" /etc/nslcd.conf.base /etc/nslcd.conf
sed "s@BINDDN@$BINDDN@" /etc/nslcd.conf.base /etc/nslcd.conf
sed "s@BINDPW@$BINDPW@" /etc/nslcd.conf.base /etc/nslcd.conf

chmod 0600 /etc/nslcd.conf

nslcd
/usr/bin/sshd -D