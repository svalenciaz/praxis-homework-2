#!/usr/bin/env bash
echo "Building app"

sudo yum update -y

# Install git
sudo yum install git -y
git --version
# Install Go
sudo yum install golang -y
go version
# Install node js
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

source ~/.bash_profile

nvm install 10
node --version
npm --version
# curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
# sudo yum install nodejs -y

npm install -g yarn
yarn --version
yarn global add @vue/cli

# Install vuejs
#npm install -g @vue/cli
vue --version
# Install Vue CLI
#curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo

#sudo yum install yarn -y

#npm cache clean --force

#curl -o test.tgz -v https://registry.yarnpkg.com/vue-axios/-/vue-axios-2.1.4.tgz

#sudo npm uninstall vue-cli -g

#sudo npm install -g @vue/cli

#sudo npm update -g @vue/cli

#yarn global add @vue/cli



source ~/.bash_profile


# yarn global add @vue/cli

# Create a directory for the git project
rm -rf ~/project
mkdir ~/project
cd ~/project
# Clone the repository
git clone https://github.com/jdmendozaa/vuego-demoapp.git

# Build backend

# Move to 'Go server' directory
cd ~/project/vuego-demoapp/server

# Create shared
sudo mkdir -p /shared/server

# Build Go Project and cut it in the shared folder
go build -o /shared/server

cd ~/project/vuego-demoapp/spa
echo 'VUE_APP_API_ENDPOINT="http://10.0.0.8:4001/api"' > ~/project/vuego-demoapp/spa/.env.production.local

yarn import

rm -f package-lock.json

yarn upgrade

yarn install

yarn build
tar cvfz front.tar.gz ./dist
mv front.tar.gz /shared