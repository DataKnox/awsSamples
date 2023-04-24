#!/bin/bash
sudo su
cd ~
amazon-linux-extras install nginx1 -y 
systemctl enable nginx
systemctl start nginx
touch ~/.bashrc
cat > /tmp/startup.sh << EOF
echo "Setting up NodeJS Environment"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.39.0/install.sh | bash
echo 'export NVM_DIR="/home/ec2-user/.nvm"' >> /home/ec2-user/.bashrc
echo 'export NVM_DIR="/home/ec2-user/.nvm"' >> /home/ec2-user/.bash_profile
echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm' >> /home/ec2-user/.bashrc
. /home/ec2-user/.nvm/nvm.sh
. /home/ec2-user/.bash_profile
. /home/ec2-user/.bashrc
# Install NVM, NPM, Node.JS & Grunt
nvm install --lts
nvm ls
EOF
chown ec2-user:ec2-user /tmp/startup.sh && chmod a+x /tmp/startup.sh
sleep 1; su - ec2-user -c "/tmp/startup.sh"