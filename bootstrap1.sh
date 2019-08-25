#!/bin/bash
yum install -y httpd php git

cd /var/www/html
wget https://github.com/rohitmalik21/ALB2019/car1.jpg
mv car1.jpg car.jpg
wget https://github.com/rohitmalik21/ALB2019/index.php
mv /var/www/html/htaccess /var/www/html/.htaccess

mkdir /var/www/html/car
cp /var/www/html/car.jpg /var/www/html/car
cp /var/www/html/index.php /var/www/html/car
cp /var/www/html/.htaccess /var/www/html/car


sudo systemctl start httpd
sudo systemctl enable httpd
sudo usermod -a -G apache ec2-user
sudo chown -R ec2-user:apache /var/www
sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;
