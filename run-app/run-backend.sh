#!/usr/bin/env bash
echo "Running backend!"

# Calling enviromental variables defined in te Vagrantfile
sudo echo 'export PORT=$PORT' >> /etc/profile
sudo echo 'export IPSTACK_API_KEY=$IPSTACK_API_KEY' >> /etc/profile
sudo echo 'export WEATHER_API_KEY=$WEATHER_API_KEY' >> /etc/profile

# Create a directory for locate the server
rm -rf /project
mkdir -p /project/server

# Copy the server directory into project
cp -R /shared/server /project/server

cd /project/server

# Run app in background
nohup ./server/vuego-demoapp &