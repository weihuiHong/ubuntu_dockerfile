FROM ubuntu:18.04

ADD ./ubuntu_install.sh  /usr/local

RUN chmod 755 /usr/local/ubuntu_install.sh &&  /usr/local/ubuntu_install.sh
