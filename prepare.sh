# Script to run in container during build step to edit configuration files

# NSS settings
patch /etc/nsswitch.conf nsswitch.conf.diff
patch /etc/nslcd.conf nslcd.conf.diff

sed -i "s@URI@$URI@" /etc/nslcd.conf 
sed -i "s@BASE@$BASE@" /etc/nslcd.conf 
sed -i "s@BINDDN@$BINDDN@" /etc/nslcd.conf 
sed -i "s@BINDPW@$BINDPW@" /etc/nslcd.conf 

chmod 0600 /etc/nslcd.conf 

# PAM settings
patch /etc/pam.d/system-auth system-auth.diff
