FROM archlinux as updated
RUN pacman -Syu --noconfirm 

FROM updated 
RUN pacman -S --noconfirm openssh patch nss-pam-ldapd openldap

WORKDIR /tmp/image_buildfiles

COPY diffs/* ./
COPY build.sh ./
RUN bash build.sh

WORKDIR /
ARG ADSA
COPY entrypoint.sh ./

CMD ./entrypoint.sh