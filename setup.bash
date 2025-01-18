#!/bin/bash

# chmod +x ./setup.bash

# Update the package list
sudo apt update

# Upgrade all installed packages to their latest versions
sudo apt upgrade -y

# Remove unnecessary packages
sudo apt autoremove -y

# Check if the Repos directory already exists, if not, create it
if [ ! -d "~/Repos" ]; then
  mkdir -p ~/Repos
fi

# Check if Git is installed, if not, install it
if ! dpkg -l | grep -q git; then
  sudo apt install git -y
fi

# Check if QEMU Guest Agent is installed, if not, install it
if ! dpkg -l | grep -q qemu-guest-agent; then
  sudo apt install qemu-guest-agent -y
fi

# Check if OpenSSH Server is installed, if not, install it
if ! dpkg -l | grep -q openssh-server; then
  sudo apt install openssh-server -y
fi

# Check if snapd is installed, if not, install it
if ! dpkg -l | grep -q snapd; then
  sudo apt install snapd -y
fi

# Check if Visual Studio Code is installed, if not, install it
if ! snap list | grep -q code; then
  sudo snap install --classic code
fi

# Check if .NET Core SDK is installed, if not, install it
if ! snap list | grep -q dotnet-sdk; then
  sudo snap install dotnet-sdk --classic
fi

# Check if Python is installed, if not, install it
if ! dpkg -l | grep -q python3; then
  sudo apt install python3 -y
fi

# Check if Python pip is installed, if not, install it
if ! dpkg -l | grep -q python3-pip; then
  sudo apt install python3-pip -y
fi

# Check if Python Virtual Environment is installed, if not, install it
if ! dpkg -l | grep -q python3-venv; then
  sudo apt install python3-venv -y
fi

# Check if Ansible is installed, if not, install it
if ! dpkg -l | grep -q ansible; then
  sudo apt install ansible -y
fi

# Check if Terraform is installed, if not, install it
if ! dpkg -l | grep -q terraform; then
  # Taken from https://www.terraform.io/downloads
  wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
  sudo apt update && sudo apt install terraform
fi

# Check if docker is installed, if not, install it
if ! dpkg -l | grep -q docker; then
  sudo apt install docker.io -y
fi

# Check if docker-compose is installed, if not, install it
if ! dpkg -l | grep -q docker-compose; then
  sudo apt install docker-compose -y 
fi

