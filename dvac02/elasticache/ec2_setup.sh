sudo apt update && sudo apt upgrade -y
sudo apt install python3-pip -y
pip3 install boto3
pip3 install redis
pip3 install names
# pip3 install redis-py-cluster
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip -y
unzip awscliv2.zip
sudo ./aws/install
aws configure