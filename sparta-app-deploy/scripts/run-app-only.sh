#!/bin/bash 

echo cd into app directory...
cd tech601-sparta-app
cd app
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