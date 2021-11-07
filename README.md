# sshd-ldap

#### A docker image that is ssh server and authenticates users from an existing ldap server

#### On container start, the container configures itself with given ldap parameters. 
#### The parameters are 
- URI: ldap server's uri
- BASE: ldap base dn to search users
- BINDDN: dn to bind while searching
- BINDPW: password for binddn

#### URI, BASE and BINDDN are expected as docker config parameters. BINDPW is expected as docker secret.
#### example compose file is provided