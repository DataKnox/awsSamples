#!/bin/bash
sudo su
cd ~
dnf update -y
dnf install -y httpd wget php-fpm php-mysqli php-json php php-devel
dnf install -y mariadb105-server
systemctl start httpd
systemctl enable httpd
usermod -a -G apache ec2-user
echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
touch /var/www/html/index.html

EOF
chown -R ec2-user:apache /var/www
chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;