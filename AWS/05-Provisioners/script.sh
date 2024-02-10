#!/bin/bash

# Print a message
echo 'Hello from the remote instance'

# Update package lists and install Python3 pip (for Ubuntu)
sudo apt update -y && sudo apt-get install -y python3-pip

# Install Flask using pip3
sudo pip3 install flask

# Change directory to /home/ubuntu
cd /home/ubuntu || exit

# Run the Flask app in the background
nohup sudo python3 app.py &
