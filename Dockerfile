FROM archlinux as updated
RUN pacman -Syu --noconfirm 

FROM updated 
RUN pacman -S --noconfirm openssh patch nss-pam-ldapd openldap

WORKDIR /tmp/image_buildfiles

ARG URI
ARG BASE
ARG BINDDN
ARG BINDPW

COPY *.diff ./
COPY prepare-nss.sh ./
RUN bash prepare-nss.sh

RUN ssh-keygen -A
CMD nslcd --nofork && /usr/sbin/sshd -D -e