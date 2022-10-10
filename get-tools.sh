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

from_pip() {
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

get_from_git() {
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
    https://github.com/Aviksaikat/gf-templates.git
    mkdir ~/.gf
    mv Gf-Patterns/*.json ~/.gf
    mv gf-templates/templates/*.json ~/.gf
}
get_from_git

go_mods() {
    echo "Installing go modules...." | lolcat
    go install github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
    go install github.com/projectdiscovery/dnsx/cmd/dnsx@latest
    go install github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
    go install github.com/c-sto/recursebuster@latest
    go install github.com/jaeles-project/gospider@latest
    go install github.com/hakluke/hakrawler@latest
    go install github.com/lc/gau/v2/cmd/gau@latest
    go install github.com/iamstoxe/urlgrab@latest
    go install github.com/003random/getJS@latest
    go install github.com/ameenmaali/qsfuzz@latest
    go install github.com/dwisiswant0/crlfuzz/cmd/crlfuzz@latest
    go install github.com/hahwul/dalfox/v2@latest
    go install github.com/haccer/subjack@latest
    go install github.com/Ice3man543/SubOver@latest
    go install github.com/tomnomnom/anew@latest
    go install github.com/tomnomnom/meg@latest
    go install github.com/tomnomnom/waybackurls@latest
    go install github.com/tomnomnom/qsreplace@latest
    go install github.com/tomnomnom/gf@latest
    go install github.com/tomnomnom/httprobe@latest
    go install github.com/tomnomnom/concurl@latest
    go install github.com/tomnomnom/burl@latest
    go install github.com/projectdiscovery/httpx/cmd/httpx@latest
    go install github.com/bp0lr/gauplus@latest
    go install github.com/1ndianl33t/urlprobe@latest
    go install github.com/mhmdiaa/second-order@latest
    go install github.com/lc/cspparse@latest
    go install github.com/shenwei356/rush/
    go install github.com/lc/subjs@latest
    go install github.com/dwisiswant0/cf-check@latest
    go install github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest
    go install github.com/gwen001/github-subdomains@latest
    go install github.com/cgboal/sonarsearch/cmd/crobat@latest
    #go get github.com/d3mondev/puredns/v2
    go install github.com/glebarez/cero@latest
    #go env -w GO111MODULE="auto"
    go install github.com/Josue87/gotator@latest
    go install github.com/michenriksen/gitrob@latest
    go install github.com/Ice3man543/SubOver@latest
    go install github.com/lc/subjs@latest
    go install github.com/magisterquis/s3finder@latest
    go install github.com/d3mondev/puredns/v2@latest
    go install github.com/Hackmanit/Web-Cache-Vulnerability-Scanner@latest
    #go install -v github.com/lukasikic/subzy
    go install github.com/lukasikic/subzy@latest
    go install github.com/projectdiscovery/mapcidr/cmd/mapcidr@latest
    go install github.com/detectify/page-fetch@latest
    go install github.com/ferreiraklet/airixss@latest
    go install github.com/s0md3v/smap/cmd/smap@latest
}
go_mods
