#!/bin/sh
if [ "$#" -lt 1 ] || [ "$1" == "install" ] ; then
    pip install --upgrade pip
    pip install --upgrade setuptools
    apk add gcc g++ make libffi-dev openssl-dev
    pip install webssh
else
fi