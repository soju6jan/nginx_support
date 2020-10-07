#!/bin/sh
if [ "$#" -lt 1 ] || [ "$1" == "install" ] ; then
    pip install --upgrade pip setuptools
    apk add gcc g++ make libffi-dev openssl-dev
    pip install webssh
    wget -O /usr/local/lib/python2.7/site-packages/webssh/static/css/fonts/D2Coding.ttf https://raw.githubusercontent.com/soju6jan/nginx_support/main/install/python/D2Coding.ttf
    #wssh --font=D2Coding.ttf --origin=* --debug --timeout=600
elif [ "$1" == "install_sshd" ]; then
    apk add openssh
    sed -i 's/#PermitRootLogin probit-password/PermitRootLogin yes/' /etc/ssh/sshd_config 
    sed -i 's/#PermitEmptyPasswords no/PermitEmptyPasswords yes/' /etc/ssh/sshd_config
    #rm -rf ~/.ssh/id_rsa
    #rm -rf ~/.ssh/id_rsa.pub
    #rm -rf ~/.ssh/authorized_keys
    #passwd -d root
    ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa -q -N ""
    cat ~/.ssh/id_rsa >> ~/.ssh/authorized_keys
    #cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
    chmod 600 ~/.ssh/authorized_keys
    #/usr/sbin/sshd -h ~/.ssh/authorized_keys    
else
    echo 'uninstall'
fi
