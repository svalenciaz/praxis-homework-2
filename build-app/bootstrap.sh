#!/usr/bin/env bash
echo "Building app"

# Update dependences
sudo yum update -y

# Install git
sudo yum install git -y
git --version

# Install Go
sudo yum install golang -y
go version

# Install nvm (for nodejs)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Refresh bash (For intalled modules)
source ~/.bash_profile

# Install nodejs 10 and npm
nvm install 10
node --version
npm --version

# Install yarn
npm install -g yarn
yarn --version

# Install vuejs
yarn global add @vue/cli
vue --version

# Refresh bash
source ~/.bash_profile

# Create a directory for the git project
rm -rf ~/project
mkdir ~/project
cd ~/project
# Clone the repository
git clone https://github.com/jdmendozaa/vuego-demoapp.git

# Build backend

# Move to 'Go server' directory
cd ~/project/vuego-demoapp/server

# Create dir for Go backend in 'shared'
sudo mkdir -p /shared/server

# Build Go Project and cut it in the shared folder
go build -o /shared/server

cd ~/project/vuego-demoapp/spa

# Define Vue endpoint as enviroment variable
echo 'VUE_APP_API_ENDPOINT="http://10.0.0.8:4001/api"' > ~/project/vuego-demoapp/spa/.env.production.local

# Use yarn to build frontend
# Create the yaml.lock from package-lock.json
yarn import
rm -f package-lock.json

yarn upgrade
yarn install
yarn build

# Compress the result in 
tar cvfz front.tar.gz ./dist
mv front.tar.gz /shared