#!/bin/bash
# TODO: Decide if this script should or shouldn't get executed on container restart

# TODO: Currently, config vars and secrets cant contain "#", fix it
cp /etc/nslcd.conf.base /etc/nslcd.conf
sed "s#LDAP_URI#$(cat /LDAP_URI)#" /etc/nslcd.conf -i
sed "s#LDAP_BASE#$(cat /LDAP_BASE)#" /etc/nslcd.conf -i
sed "s#LDAP_BINDDN#$(cat /LDAP_BINDDN)#" /etc/nslcd.conf -i
sed "s#LDAP_BINDPW#$(cat /run/secrets/LDAP_BINDPW)#" /etc/nslcd.conf -i

chmod 0600 /etc/nslcd.conf
ssh-keygen -A

nslcd && /usr/bin/sshd -D
