#!/bin/bash
#! Bug bounty essential tools install

# echo "┏┓ ╻ ╻┏━╸   ┏┓ ┏━┓╻ ╻┏┓╻╺┳╸╻ ╻   ╺┳╸┏━┓┏━┓╻  ┏━┓
# ┣┻┓┃ ┃┃╺┓   ┣┻┓┃ ┃┃ ┃┃┗┫ ┃ ┗┳┛    ┃ ┃ ┃┃ ┃┃  ┗━┓
# ┗━┛┗━┛┗━┛   ┗━┛┗━┛┗━┛╹ ╹ ╹  ╹     ╹ ┗━┛┗━┛┗━╸┗━┛
# " | lolcat

echo " ▄▄▄▄▄                       ▄▄▄▄▄                         ▄                 ▄▄▄▄▄▄▄               ▀▀█          
 █    █ ▄   ▄   ▄▄▄▄         █    █  ▄▄▄   ▄   ▄  ▄ ▄▄   ▄▄█▄▄  ▄   ▄           █     ▄▄▄    ▄▄▄     █     ▄▄▄  
 █▄▄▄▄▀ █   █  █▀ ▀█         █▄▄▄▄▀ █▀ ▀█  █   █  █▀  █    █    ▀▄ ▄▀           █    █▀ ▀█  █▀ ▀█    █    █   ▀ 
 █    █ █   █  █   █         █    █ █   █  █   █  █   █    █     █▄█            █    █   █  █   █    █     ▀▀▀▄ 
 █▄▄▄▄▀ ▀▄▄▀█  ▀█▄▀█         █▄▄▄▄▀ ▀█▄█▀  ▀▄▄▀█  █   █    ▀▄▄   ▀█             █    ▀█▄█▀  ▀█▄█▀    ▀▄▄  ▀▄▄▄▀ 
                ▄  █                                             ▄▀                                             
" | lolcat 

mkdir ~/bb-tools
cd ~/bb-tools

from_pip()
{
    #* from pip
    pip3 install arjun
    pip3 install wfuzz
    pip3 install xsrfprobe
    pip3 install dnsgen
    pip3 install festin
    # supder handy tool works as http.server but more elegantly
    pip3 install updog
    pip3 install truffleHog

}
from_pip

#Set the variable inside your shell source 
#COMMON_PORTS_WEB="81,300,591,593,832,981,1010,1311,1099,2082,2095,2096,2480,3000,3128,3333,4243,4567,4711,4712,4993,5000,5104,5108,5280,5281,5601,5800,6543,7000,7001,7396,7474,8000,8001,8008,8014,8042,8060,8069,8080,8081,8083,8088,8090,8091,8095,8118,8123,8172,8181,8222,8243,8280,8281,8333,8337,8443,8500,8834,8880,8888,8983,9000,9001,9043,9060,9080,9090,9091,9200,9443,9502,9800,9981,10000,10250,11371,12443,15672,16080,17778,18091,18092,20720,32000,55440,55672"

cargo install unimap

get_from_git()
{
    echo "Getting findomain...." | lolcat
    git clone https://github.com/findomain/findomain.git 
    cd findomain
    #./builder.sh
    cargo build --release
    sudo cp target/release/findomain /usr/bin/
    #findomain
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
    
    echo "Getting bucky...." | lolcat
    git clone https://github.com/smaranchand/bucky.git

    echo "Getting SourceWolf...." | lolcat
    git clone https://github.com/ksharinarayanan/SourceWolf.git
    cd SourceWolf/
    pip3 install -r requirements.txt --user
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


go_mods()
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
    go get -u github.com/003random/getJS
    go get -u github.com/ameenmaali/qsfuzz
    GO111MODULE=on go get -v github.com/dwisiswant0/crlfuzz/cmd/crlfuzz
    go install github.com/hahwul/dalfox/v2@latest
    go get -u github.com/haccer/subjack
    go get -u github.com/Ice3man543/SubOver
    go get -u github.com/tomnomnom/anew
    go get -u github.com/tomnomnom/meg
    go get -u github.com/tomnomnom/waybackurls
    go get -u github.com/tomnomnom/qsreplace
    go get -u github.com/tomnomnom/gf
    go get -u github.com/tomnomnom/httprobe
    go get -u github.com/tomnomnom/concurl
    go get -u github.com/tomnomnom/burl
    go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
    go install github.com/hakluke/hakrawler@latest
    GO111MODULE=on go get -u -v github.com/bp0lr/gauplus
    go get -u github.com/1ndianl33t/urlprobe
    go get github.com/mhmdiaa/second-order
    go get -u github.com/lc/cspparse
    go get -u github.com/shenwei356/rush/
    GO111MODULE=on go get -u -v github.com/lc/subjs
    go get -u github.com/dwisiswant0/cf-check
    GO111MODULE=on go get -v github.com/projectdiscovery/shuffledns/cmd/shuffledns
    go get -u github.com/gwen001/github-subdomains
    go get github.com/cgboal/sonarsearch/cmd/crobat
    GO111MODULE=on go get github.com/d3mondev/puredns/v2
    go get -u github.com/glebarez/cero
    go env -w GO111MODULE="auto"
    go get -u github.com/Josue87/gotator
    go get github.com/michenriksen/gitrob
    go get github.com/Ice3man543/SubOver
    GO111MODULE=on go get -u -v github.com/lc/subjs@latest
}
go_mods
