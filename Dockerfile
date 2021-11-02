FROM archlinux as updated
RUN pacman -Syu --noconfirm 

FROM updated 
RUN pacman -S --noconfirm openssh patch nss-pam-ldapd openldap

WORKDIR /tmp/image_buildfiles

ARG URI
ARG BASE
ARG BINDDN
ARG BINDPW

COPY diffs/* ./
COPY prepare.sh ./
RUN bash prepare.sh

RUN ssh-keygen -A
CMD nslcd && /usr/bin/sshd -D