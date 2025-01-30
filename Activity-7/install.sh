#!/bin/bash
sudo apt update
sudo apt install nginx -y
sudo apt install unzip -y
ls -l /tmp
cd /tmp && wget https://www.free-css.com/assets/files/free-css-templates/download/page294/woody.zip
unzip woody.zip
sudo mv carpenter-website-template/ /var/www/html/woody/