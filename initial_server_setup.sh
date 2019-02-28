#!/bin/bash

#After installing your new ubuntu OS on a machine
#First get all the necessary updates
sudo apt-get update
sudo apt-get upgrade -y
#---------------------------------------------------------------------------------------------------------------------------------------

#Installing git for version controlling
sudo apt-get install git -y
#---------------------------------------------------------------------------------------------------------------------------------------

#Installation script for zsh, an awesome shell and robbyrussell/oh-my-zsh an awesome zsh configuration
sudo apt-get install zsh -y
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
#---------------------------------------------------------------------------------------------------------------------------------------

#First remove vim-tiny and dependencies completely for a fresh install
sudo apt-get remove vim vim-tiny vim-runtime -y
sudo apt-get autoremove -y
sudo apt-get autoclean -y
#---------------------------------------------------------------------------------------------------------------------------------------

#Add repo to install latest VIM --version 8.x.*
sudo add-apt-repository ppa:jonathonf/vim
sudo apt-get update
sudo apt-get install vim -y
#---------------------------------------------------------------------------------------------------------------------------------------

#Clone and install advanced vim configuration for vim
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
#---------------------------------------------------------------------------------------------------------------------------------------

#setup for installing valloric/youcompleteme plugin
sudo apt install build-essential cmake python3-dev
cd ~/.vim_runtime
git clone https://github.com/Valloric/YouCompleteMe.git my_plugins/YouCompleteMe
git submodule update --init --recursive
python3 install.py
#---------------------------------------------------------------------------------------------------------------------------------------

#DATABASE SETUP
#1.PostgreSQL setup
sudo apt-get install postgresql postgresql-contrib -y

#2.MySQL
sudo apt-get install mysql-server
sudo systemctl restart mysql.service

#Installation of MongoDB server
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org
#---------------------------------------------------------------------------------------------------------------------------------------

#Installation of Apache2 httpd Server
sudo apt-get install apache2 -y
sudo service apache2 restart
#---------------------------------------------------------------------------------------------------------------------------------------

#Installation of NginX
sudo wget http://nginx.org/keys/nginx_signing.key
sudo apt-key add nginx_signing.key
cd /etc/apt
deb http://nginx.org/packages/ubuntu xenial nginx
deb-src http://nginx.org/packages/ubuntu xenial nginx
sudo apt-get update
sudo apt-get install nginx -y
sudo service nginx start
#---------------------------------------------------------------------------------------------------------------------------------------
##########################################ADIOS#########################################################################################
