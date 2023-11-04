#!/bin/bash

# Add /usr/local/bin to the PATH
export PATH=$PATH:/usr/local/bin

# No password needed for privilege escalation by vagrant user
cat <<EOF > /etc/sudoers.d/vagrant
vagrant ALL=(ALL) NOPASSWD:ALL
EOF

# Install ansible
apt-get update
apt-get install -y python3-pip
pip install --upgrade ansible
ansible-galaxy collection install --timeout 180 community.general

apt-get update
apt-get install -y dpkg-dev linux-headers-generic linux-image-generic