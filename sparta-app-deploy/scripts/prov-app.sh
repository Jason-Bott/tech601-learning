#!/bin/bash 

echo update...
sudo apt update -y 
echo done
echo

echo upgrade... 
# NEEDS FIXING! Asks for user input. Search for noninteractive
sudo apt upgrade -y
echo done
echo

echo install nginx...
# not needed to run app, but will need it later for reverse proxy
# NEEDS FIXING! Asks for user input. Search for noninteractive
sudo apt install nginx -y
echo done
echo

echo download installation script for nodejs 20.x...
curl -sL https://deb.nodesource.com/setup_20.x -o nodesource_setup.sh
echo done
echo

echo run installation script for nodejs 20.x...
# NEEDS FIXING! Asks for user input. Search for noninteractive
sudo bash nodesource_setup.sh
echo done
echo

echo install nodejs 20.x...
# NEEDS FIXING! Asks for user input. Search for noninteractive
sudo apt install nodejs -y
echo done
echo

# get app code

# run app