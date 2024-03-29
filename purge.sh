#!/bin/bash

sys=$1

if [[ $sys = "" ]]; then
    echo "Please enter system type (ubuntu\centos)"
    exit
fi

echo "kong purge..."
# stop serve
read -r -p "Stop serve? [Y/n] " input
case $input in
    [yY][eE][sS]|[yY])
		/usr/local/bin/kong stop
		echo "=====> serve stoped"
		;;

    [nN][oO]|[nN])
		exit # must stop server if you want to take the next step
       	;;

    *)
		echo "Invalid input..."
		exit 1
		;;
esac

# rm dir
read -r -p "Delete all file? [Y/n] " input
case $input in
    [yY][eE][sS]|[yY])
        if [ $sys = "ubuntu" ]; then
            dpkg -r kong
        elif [ $sys = "centos" ]; then
            rpm -e kong
        fi
		rm -rf /usr/local/kong/
		echo "=====> file deleted"
		;;

    [nN][oO]|[nN])
		echo "=====> file not delete"
       	;;

    *)
		echo "Invalid input..."
		exit 1
		;;
esac

# rm service
read -r -p "Delete service? [Y/n] " input
case $input in
    [yY][eE][sS]|[yY])
		rm -f /etc/systemd/system/multi-user.target.wants/kong.service
		rm -f /lib/systemd/system/kong.service
		systemctl daemon-reload
		echo "=====> service deleted"
		;;

    [nN][oO]|[nN])
		echo "=====> service not delete"
       	;;

    *)
		echo "Invalid input..."
		exit 1
		;;
esac
