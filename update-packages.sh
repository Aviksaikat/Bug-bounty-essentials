#!/bin/bash
#! Bug bounty essential tools install

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

if ! command -v lolcat &> /dev/null
then
    echo "lolcat not found...." 
    echo "Installing lolcat for fun...."
    sudo apt install -y lolcat
fi

echo "Updating system...." | lolcat
sudo apt-get update -y && sudo apt-get upgrade -y

if ! command -v go &> /dev/null
then
    echo "go could not be found...." | lolcat
    echo "Installing golang...." | lolcat
    sudo apt install -y golang
    echo "Setting go...." | lolcat
    mkdir -p "$HOME/go"
    
    if [[ $(ps -p $$ | tail -1 | awk '{print $4}') -eq "zsh" ]];
    then 
        echo 'export GOPATH=$HOME/go' >> $HOME/.zshrc
        echo 'export PATH="$PATH:$GOPATH/bin"' >> $HOME/.zshrc
    fi
    
    if [[ $(ps -p $$ | tail -1 | awk '{print $4}') -eq "bash" ]];
    then
        echo 'export GOPATH=$HOME/go' >> $HOME/.bashrc
        echo 'export PATH="$PATH:$GOPATH/bin"' >> $HOME/.bashrc
    else
        echo "Enter the location of your shell file: "
        read p
        echo 'export PATH="$PATH:$HOME/go/bin"' >> $p 
    fi
fi

mkdir installation
cd installation

#* from repo
sudo apt-get install -y python3-pip
sudo apt-get install -y cargo 
sudo apt-get install -y libpcap-dev
sudo apt-get install -y amass sublist3r subfinder assetfinder altdns dirsearch feroxbuster ffuf gobuster dirb dirbuster nmap nikto burpsuite

sudo pip3 install pycurl bs4 pygeoip gobject cairocffi selenium

#? rustscan
# wget https://github.com/RustScan/RustScan/releases/download/2.0.1/rustscan_2.0.1_amd64.deb 

# sudo dpkg -i *.deb
