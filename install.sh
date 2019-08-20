#!/bin/bash

sys=$1

if [[ $sys = "" ]]; then
    echo "Please enter system type (ubuntu\centos)"
    exit
fi

echo "=====> kong installing..."
if [ $sys = "ubuntu" ]; then
    wget https://bintray.com/kong/kong-deb/download_file?file_path=kong-1.2.2.bionic.all.deb \
        -O kong-1.2.2.bionic.all.deb
    sudo dpkg -i kong-1.2.2.bionic.all.deb
elif [ $sys = "centos" ]; then
    wget https://bintray.com/kong/kong-rpm/download_file?file_path=centos/7/kong-1.2.2.el7.noarch.rpm \
        -O kong-1.2.2.el7.noarch.rpm
    sudo rpm -i kong-1.2.2.el7.noarch.rpm
fi
echo "=====> kong installed"

