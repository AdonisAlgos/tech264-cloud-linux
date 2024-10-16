#!/bin/bash

NGINX_CONFIG="/etc/nginx/sites-available/default"

# Updatingading packages.
echo update sources list...
sudo apt-get update -y
echo Done!

# Upgrading packages.
echo upgrade any packages available...
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
echo Done!

# Installing the NGINX web service.
echo install nginx...
sudo DEBIAN_FRONTEND=noninteractive apt-get install nginx -y
echo Done!

# Use sed to update the config to proxy traffic from port 80 to 3000
echo "Updating Nginx configuration to forward traffic to port 3000..."
sudo sed -i 's|try_files $uri $uri/ =404;|proxy_pass http://localhost:3000;|' /etc/nginx/sites-available/default
echo Done!

# Test the Nginx configuration
echo testing nginx config file validation
sudo nginx -t
echo Done!

# Restart Nginx to apply changes
echo "Restarting Nginx..."
sudo systemctl restart nginx
echo Done!

# Installing Node.js v 20_x.
echo install nodejs v20...
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs
echo Done!

# Checking node version.
echo check nodejs version...
node -v
echo Done!

# Installing pm2.
echo installing pm2...
sudo npm install -g pm2
echo Done!

# Checking node version.
echo check nodejs version...
node -v
echo Done!

# Cloning a git repo by specifying the HTTPS URL.
echo cloning github repository...
git clone https://github.com/AdonisAlgos/tech264-sparta-app.git repo
echo Done!

# Changing directories to point to the app.js file within the repo.
echo changing directories to the app folder...
cd repo/app
echo Done!

# Setting an environment variable (DB_HOST) that is looked up when the app runs.
echo defining env variable
export "DB_HOST=mongodb://10.0.3.4:27017/posts"
echo Done!

# Stop all processes managed by pm2
echo Stopping all pm2 processes
pm2 stop all
echo Done!

# Installing app dependencies and packages.
echo installing app packages and dependencies...
npm install
echo Done!

# Running the app in the background via pm2.
echo running app...
pm2 start app.js
echo app running in the background...