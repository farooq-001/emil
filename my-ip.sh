#!/bin/bash
# Check the OS type using /etc/os-release
source /etc/os-release
OS_NAME=$ID

# Update package list and install necessary tools based on the OS
if [[ "$OS_NAME" == "ubuntu" || "$OS_NAME" == "debian" ]]; then
    sudo apt update && sudo apt install git figlet curl lolcat -y
elif [[ "$OS_NAME" == "centos" || "$OS_NAME" == "rhel" || "$OS_NAME" == "fedora" ]]; then
    sudo yum install git figlet curl lolcat -y
elif [[ "$OS_NAME" == "fedora" ]]; then
    sudo dnf install git figlet curl lolcat -y
elif [[ "$OS_NAME" == "arch" || "$OS_NAME" == "manjaro" ]]; then
    sudo pacman -S git figlet curl lolcat --noconfirm
else
    echo "Unsupported OS. Exiting."
    exit 1
fi

# Print a fun message using lolcat
echo "This is a message in lolcat!" 

# Clone the repository
sudo git clone https://github.com/farooq-001/email.git

# Change file permissions
sudo chmod 644 /home/.iplist.txt

# Run the Python script
sudo python3 email/ip.py

# Clean up by removing the cloned repository
sudo rm -rf email   /home/.iplist.txt

# Print the welcome message using figlet
figlet -f slant -c "Hello $USER" | lolcat
figlet -f digital -c "Hi Mr/Miss Welcome to The Lucifer Cyberworld" | lolcat
