#!/bin/bash 
cd tech601-sparta-app
cd app
export DB_HOST=mongodb://${db_ip}:27017/posts
pm2 delete sparta-app || true
pm2 start app.js --name sparta-app