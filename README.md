# All in one installer script for Web App Pentesting & Bug Bounty Hunting tools

> Saikat Karmakar | Nov : 2021

---
`update-packages.sh` will update your packages and install & setup go if it's not currently installed and `get-tools.sh` will install the tools. This is beacuse if we put all the things in one script the tools will be owned by root which we don't want. It's far safer that the binaries are owned by the user not the superuser. That's why 2 separate scipts. Run them as shown below you're good to go . 

- Usage :
```bash
git clone https://github.com/Aviksaikat/Bug-bounty-essentials.git
cd Bug-bounty-essentials
chmod +x *.sh 
sudo ./update-packages.sh
./get-tools.sh
```


#### TODO:
- [ ] Add support for other debian based distros. Currently tested on kali and parrot.
- [ ] Add support for arch based distros.
