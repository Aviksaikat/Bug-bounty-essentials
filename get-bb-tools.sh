#!/bin/bash
#! Bug bounty essential tools install

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

if ! command -v lolcat &> /dev/null
then
    echo "lolcat could not be found...." 
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
    mkdir -p "HOME/go"
    
    if [[ $(ps -p $$ | tail -1 | awk '{print $4}') -eq "zsh" ]];
    then 
        echo 'export PATH="PATH:HOME/go/bin"' >> $HOME/.zshrc
    fi
    
    if [[ $(ps -p $$ | tail -1 | awk '{print $4}') -eq "bash" ]];
    then
        echo 'export PATH="PATH:HOME/go/bin"' >> $HOME/.bashrc
    else
        echo "Enter the location of your shell file: "
        read p
        echo 'export PATH="PATH:HOME/go/bin"' >> $p 
    fi
fi

mkdir installation
cd installation

#* from repo
sudo apt-get install -y python3-pip
sudo apt-get install -y cargo 
sudo apt-get install -y libpcap-dev
sudo apt-get install -y amass sublist3r subfinder assetfinder altdns dirsearch feroxbuster ffuf gobsuter dirb dirbuster nmap 

#* from pip
pip3 install arjun
pip3 install wfuzz
pip3 install -r requirements.txt --user
pip3 install xsrfprobe
sudo pip3 install pycurl bs4 pygeoip gobject cairocffi selenium


#? rustscan
# wget https://github.com/RustScan/RustScan/releases/download/2.0.1/rustscan_2.0.1_amd64.deb 

# sudo dpkg -i *.deb

get_from_git()
{
    echo "Getting findomain...." | lolcat
    git clone https://github.com/findomain/findomain.git -C /tmp
    cd /tmp/findomain
    cargo build --release
    sudo cp target/release/findomain /usr/bin/
    findomain
    cd ..
    
    echo "Getting knockpy...." | lolcat
    git clone https://github.com/guelfoweb/knock.git
    cd knock
    sudo pip3 install -r requirements.txt 
    sudo python3 setup.py install
    cd ..
    
    echo "Getting scilla...." | lolcat
    git clone https://github.com/edoardottt/scilla.git
    cd scilla
    go get
    make linux
    cd ..

    echo "Getting auqtone...." | lolcat
    wget https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip
    unzip aquatone_linux_amd64_1.7.0.zip
    sudo mv aquatone /usr/local/bin/

    echo "Getting LinkFinder...." | lolcat
    git clone https://github.com/GerbenJavado/LinkFinder.git
    cd LinkFinder
    pip3 install -r requirements.txt
    python3 setup.py install
    cd ..

    echo "Getting GoLinkFinder...." | lolcat
    git clone https://github.com/0xsha/GoLinkFinder.git
    cd GoLinkFinder
    go build GoLinkfinder.go
    cd ..

    #? in my bb-tools folder
    # echo "Getting Paramspider...." | lolcat
    # git clone https://github.com/devanshbatham/ParamSpider
    # cd ParamSpider
    # pip3 install -r requirements.txt
    #chmod +x paramspider.py
    #sudo ln -s paramspider.py /usr/local/bin/paramspider.py
    # cd ..

    git clone https://github.com/1ndianl33t/Gf-Patterns
    mkdir ~/.gf
    mv Gf-Patterns/*.json ~/.gf
}
get_from_git


go_modules()
{
    echo "Installing go modules...." | lolcat
    go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
    go get -v github.com/projectdiscovery/dnsx/cmd/dnsx
    go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
    go get -u github.com/c-sto/recursebuster
    GO111MODULE=on go get -u github.com/jaeles-project/gospider
    go install github.com/hakluke/hakrawler@latest
    go install github.com/lc/gau/v2/cmd/gau@latest
    go get -u github.com/iamstoxe/urlgrab
    go get github.com/003random/getJS
    go get github.com/ameenmaali/qsfuzz
    GO111MODULE=on go get -v github.com/dwisiswant0/crlfuzz/cmd/crlfuzz
    go install github.com/hahwul/dalfox/v2@latest
    go get github.com/haccer/subjack
    go get github.com/Ice3man543/SubOver
    go get -u github.com/tomnomnom/anew
    go get -u github.com/tomnomnom/meg
    go get github.com/tomnomnom/waybackurls
    go get -u github.com/tomnomnom/qsreplace
    go get -u github.com/tomnomnom/gf
    go get -u github.com/tomnomnom/httprobe
    go get -u github.com/tomnomnom/concurl
    go get github.com/tomnomnom/burl
    go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
    go install github.com/hakluke/hakrawler@latest
    GO111MODULE=on go get -u -v github.com/bp0lr/gauplus
    go get -u github.com/1ndianl33t/urlprobe

}
go_modules