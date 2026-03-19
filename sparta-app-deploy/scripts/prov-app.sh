#!/bin/bash 

echo update...
sudo apt update -y 
echo done
echo

#
# Installations
#

echo upgrade... 
# NO LONGER NEEDS FIXING! Asks for user input. Search for noninteractive
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
echo done
echo

echo install nginx...
# not needed to run app, but will need it later for reverse proxy
# NO LONGER NEEDS FIXING! Asks for user input. Search for noninteractive
sudo DEBIAN_FRONTEND=noninteractive apt install nginx -y
echo done
echo

echo download installation script for nodejs 20.x...
curl -sL https://deb.nodesource.com/setup_20.x -o nodesource_setup.sh
echo done
echo

echo run installation script for nodejs 20.x...
# NO LONGER NEEDS FIXING! Asks for user input. Search for noninteractive
sudo DEBIAN_FRONTEND=noninteractive bash nodesource_setup.sh
echo done
echo

echo install nodejs 20.x...
# NO LONGER NEEDS FIXING! Asks for user input. Search for noninteractive
sudo DEBIAN_FRONTEND=noninteractive apt install nodejs -y
echo done
echo

echo install pm2...
sudo npm install -g pm2
echo done
echo

#
# Nginx change to allow reverse proxy
#

echo nginx config, replace try_files with proxy_pass...
sudo sed -i 's|try_files $uri $uri/ =404;|proxy_pass http://localhost:3000;|' /etc/nginx/sites-available/default
echo done
echo

echo restart nginx...
sudo systemctl restart nginx
echo done
echo

#
# Get app from git repo
#

echo git clone app code...
if [ ! -d "tech601-sparta-app" ]; then
    git clone --recursive https://github.com/Jason-Bott/tech601-sparta-app.git
else
    echo repo already exists
fi
echo done
echo

echo cd into app directory...
cd tech601-sparta-app
cd app
echo done
echo

echo npm install...
npm install
echo done
echo

# echo run app using either npm start or node app.js in the background using "&"...
# npm start &
# echo done
# echo

echo pm2 to stop the app...
# for idempotency - we can run our script multiple times without errors
pm2 delete sparta-app || true
echo done
echo

echo pm2 to start the app...
pm2 start app.js --name sparta-app
echo done
echo

echo cd to home...
cd ~
echo done
echo