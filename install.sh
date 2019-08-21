#!/bin/bash

sys=$1

if [[ $sys = "" ]]; then
    echo "Please enter system type (ubuntu\centos)"
    exit
fi

echo "=====> kong installing..."
if [ $sys = "ubuntu" ]; then
    if [ -f "./kong-1.2.2.bionic.all.deb" ];then
        wget https://bintray.com/kong/kong-deb/download_file?file_path=kong-1.2.2.bionic.all.deb \
            -O kong-1.2.2.bionic.all.deb    
    fi
    sudo dpkg -i kong-1.2.2.bionic.all.deb
elif [ $sys = "centos" ]; then
    if [ -f "./kong-1.2.2.bionic.all.deb" ];then
        wget https://bintray.com/kong/kong-rpm/download_file?file_path=centos/7/kong-1.2.2.el7.noarch.rpm \
            -O kong-1.2.2.el7.noarch.rpm
    fi
    sudo rpm -i kong-1.2.2.el7.noarch.rpm
fi
echo "=====> kong installed"

