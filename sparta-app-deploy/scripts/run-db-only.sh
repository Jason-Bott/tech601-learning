#!/bin/bash 

# Start

echo start MongoDB...
sudo systemctl start mongod
echo done
echo

echo enable MongoDB...
sudo systemctl enable mongod
echo done
echo