# Script to run in container during build step to edit configuration files

# NSS settings
patch /etc/nsswitch.conf nsswitch.conf.diff
patch /etc/nslcd.conf nslcd.conf.diff --output=/etc/nslcd.conf.base

# PAM settings
patch /etc/pam.d/system-auth system-auth.diff
