#!/bin/bash 

# Script works on:
# Ubuntu 22.04 LTS


echo update...
sudo apt update -y 
echo done
echo

#
# Installations
#

echo upgrade... 
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
echo done
echo

# Not needed as gnupg and curl install by default
# echo install gnupg and curl...
# sudo apt-get install gnupg curl
# echo done
# echo

#
# MongoDB setup
#

# Install

echo import mongodb public GPG key...
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor
echo done
echo

echo create list file for MongoDB...
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
echo done
echo

echo update package list...
sudo apt-get update
echo done
echo

echo install MongoDB community server...
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y mongodb-org
echo done
echo

# Setup

echo change bindIP to allow external connections to MongoDB...
sudo sed -i 's|bindIp: 127.0.0.1|bindIp: 0.0.0.0|' /etc/mongod.conf
echo done
echo

# Start

echo start MongoDB...
sudo systemctl start mongod
echo done
echo

echo enable MongoDB...
sudo systemctl enable mongod
echo done
echo

