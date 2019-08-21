#!/bin/bash

echo "=====> copy config file..."
cp kong.conf /etc/kong/
cp kong.yml /etc/kong/
echo "=====> config file copied"

echo "=====> create service..."
cp kong.service /lib/systemd/system
systemctl daemon-reload
systemctl enable kong
systemctl start kong
echo "=====> service created..."
