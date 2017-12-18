#!/bin/bash

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install git cmake g++ -y

curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
echo "source $HOME/.cargo/env" >> ~/.bashrc
dd if=/dev/zero of=swapfile bs=1M count=2048
mkswap swapfile
sudo swapon swapfile
git clone https://github.com/mimblewimble/grin.git
cd grin
git checkout milestone/testnet1
cargo build
export PATH=/home/ubuntu/grin/target/debug:$PATH
echo "export PATH=/home/ubuntu/grin/target/debug:$PATH" >> ~/.bashrc
