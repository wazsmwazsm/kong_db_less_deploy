#!/bin/bash

sys=$1

if [[ $sys = "" ]]; then
    echo "Please enter system type (ubuntu\centos)"
    exit
fi

echo "=====> kong installing..."
if [ $sys = "ubuntu" ]; then
    if [ ! -f "./kong-1.3.0.bionic.amd64.deb" ];then
        wget https://bintray.com/kong/kong-deb/download_file?file_path=kong-1.3.0.bionic.amd64.deb \
            -O kong-1.3.0.bionic.amd64.deb    
    fi
    sudo dpkg -i kong-1.3.0.bionic.amd64.deb
elif [ $sys = "centos" ]; then
    if [ ! -f "./kong-1.3.0.el7.amd64.rpm" ];then
        wget https://bintray.com/kong/kong-rpm/download_file?file_path=centos/7/kong-1.3.0.el7.amd64.rpm \
            -O kong-1.3.0.el7.amd64.rpm
    fi
    sudo rpm -i kong-1.3.0.el7.amd64.rpm
fi
echo "=====> kong installed"

