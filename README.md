# sshd-ldap

#### A docker image that is ssh server and authenticates users from an existing ldap server

## Image build parameters

- URI: ldap server's uri
- BASE: ldap base dn to search users
- BINDDN: dn to bind while searching
- BINDPW: password for binddn
