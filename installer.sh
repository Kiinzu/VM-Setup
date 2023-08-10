#!/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
BIGreen='\033[1;92m'

echo -e "${BIGreen}[*] Upgrading everything upgradable"
apt -y update
apt-get -y upgrade

echo -e "${BIGreen}[*] Installing Wordlists"
apt install -y seclists
mv /usr/share/seclists /usr/share/wordlists/

echo -e "${BIGreen}[*] Making Directories for CTF Category"
cd
mkdir CTF ; cd CTF
mkdir Blockchain
mkdir Binex
mkdir Cryptography
mkdir Forensic 
mkdir Reverse
mkdir Webex
cd Blockchain ; mkdir tools ; mkdir challenge ; cd ..
cd Binex ; mkdir tools ; mkdir challenge ; cd ..
cd Cryptography ; mkdir tools ; mkdir challenge ; cd ..
cd Forensic ; mkdir tools ; mkdir challenge ; cd ..
cd Reverse ; mkdir tools ; mkdir challenge ; cd ..
cd Webex ; mkdir tools ; mkdir challenge ; cd ..

#echo -e "${BIGreen}[*]"

echo -e "${BIGreen}[*] Installing essential for Pwn"
apt install -y ghidra
apt-get install -y python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential; python3 -m pip install --upgrade pip; python3 -m pip install --upgrade pwntools
apt install -y patchelf
apt install -y gdb
bash -c "$(wget https://gef.blah.cat/sh -O -)"
apt install -y python3-ropgadget

echo -e "${BIGreen}[*] Installing essential for Digital Forensic" 
python3 -m pip install -y --upgrade pip
python3 -m pip install -y --upgrade Pillow
#Volatility
git clone https://github.com/volatilityfoundation/volatility3.git
mv volatility3 volatility
chmod +x volatility/vol.py
sudo mv volatility /opt
sudo ln -s /opt/volatility/vol.py /usr/bin/volatility

echo -e "${BIGreen}[*] Installing essential for Cryptography"
pip install pycryptodome

echo -e "${BIGreen}[*] Installing essesntial for Blockchain "
cd 
apt-get install -y nodejs npm
npm install -y --save-dev hardhat
pip install git+https://github.com/minaminao/erever.git #Erever EVM Reverse Tool
mv .local/bin/erever ./Blockchain/tools
curl -L https://foundry.paradigm.xyz | bash
foundryup

echo -e "${BIGreem}[*] Installing Docker and Docker-compose"
apt install -y docker.io
apt install -y docker-compose

echo -e "${BIGreen}[*] Installing Visual Studio Code"


echo -e "${BIGreen}[*] You are ready to join the battle!"
