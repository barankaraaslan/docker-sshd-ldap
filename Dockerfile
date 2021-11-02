FROM archlinux as updated
RUN pacman -Syu --noconfirm 

FROM updated 
RUN pacman -S --noconfirm openssh patch nss-pam-ldapd openldap

WORKDIR /tmp/image_buildfiles
COPY diffs/* ./

RUN \
    mv /etc/nslcd.conf /etc/nslcd.conf.base; \
    \
    patch /etc/nsswitch.conf nsswitch.conf.diff; \
    patch /etc/nslcd.conf.base nslcd.conf.diff; \
    patch /etc/pam.d/system-auth system-auth.diff

COPY entrypoint.sh ./

RUN ssh-keygen -A

CMD bash entrypoint.sh