#!/bin/bash

# Setting an environment variable (DB_HOST) that is looked up when the app runs.
echo defining env variable
export "DB_HOST=mongodb://10.0.3.4:27017/posts"
echo Done!

# Changing directories to point to the app.js file within the repo.
echo changing directories to the app folder...
cd repo/app
echo Done!

# Stop all processes managed by pm2
echo Stopping all pm2 processes
pm2 stop all
echo Done!

# Running the app in the background via pm2.
echo running app...
pm2 start app.js
echo app running in the background...