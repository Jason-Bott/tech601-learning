#!/bin/bash 

echo cd into app directory...
cd tech601-sparta-app
cd app
echo done
echo

echo set environment variable for DB connection string...
# MUST SET IF YOU WANT TO CONNECT APP TO DB
# COMMENT OUT IF YOU DON'T WANT TO CONNECT TO DB
# export DB_HOST=mongodb://<IP-ADDRESS>:27017/posts
export DB_HOST=mongodb://172.31.62.203:27017/posts
echo done
echo

echo pm2 to stop the app...
# for idempotency - we can run our script multiple times without errors
pm2 delete sparta-app || true
echo done
echo

echo pm2 to start the app...
pm2 start app.js --name sparta-app
echo done
echo