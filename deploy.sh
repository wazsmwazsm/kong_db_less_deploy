#!/bin/bash

echo "=====> cteate dir..."
mkdir -p /usr/local/kong/conf/
echo "=====> dir cteated"

echo "=====> dir authorize..."
chown -R daemon:daemon /usr/local/kong/
echo "=====> dir authorized"

echo "=====> copy config file..."
cp kong.conf /usr/local/kong/conf/
cp kong.yml /usr/local/kong/conf/
echo "=====> config file copied"

echo "=====> create service..."
cp kong.service /lib/systemd/system
systemctl daemon-reload
systemctl enable kong
systemctl start kong
echo "=====> service created..."
