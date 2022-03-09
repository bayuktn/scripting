#!/bin/bash
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y
    
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io -y
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
echo 'Udah Kelar oiiii !!!'

echo "fs.file-max = 524288" >> /etc/sysctl.conf
cat >> /etc/security/limits.conf << EOF
root soft     nproc          524288
root hard     nproc          524288
root soft     nofile         524288
root hard     nofile         524288
EOF
echo "session required          pam_limits.so" >> /etc/pam.d/common-session

curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -

apt update && apt install nodejs
apt install net-tools
timedatectl set-timezone Asia-Jakarta
