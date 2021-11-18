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


from_pip()
{
    #* from pip
    pip3 install arjun
    pip3 install wfuzz
    pip3 install xsrfprobe
    pip3 install dnsgen
}
from_pip

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

}
go_mods