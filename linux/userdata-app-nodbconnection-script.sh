#!/bin/bash

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