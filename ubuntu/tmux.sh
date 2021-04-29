#!/bin/sh

sudo apt-get purge -y tmux
rm ~/.tmux ~/.tmux.conf -rf

sudo apt update

sudo apt-get install -y powerline cmake gcc g++ #install tmux and dependencies
sudo apt install -y git
sudo apt install -y automake
sudo apt install -y build-essential
sudo apt install -y pkg-config
sudo apt install -y libevent-dev
sudo apt install -y libncurses5-dev

rm -fr /tmp/tmux

git clone https://github.com/tmux/tmux.git /tmp/tmux

cd /tmp/tmux

sh autogen.sh

./configure && make

sudo make install

cd -

rm -fr /tmp/tmux

sudo apt-get install -y powerline cmake gcc g++ #install tmux and dependencies

rm ~/.tmux.conf
ln -sf ~/.private_config/shared/dotfiles/.tmux.conf ~/.tmux.conf
sudo ln -sf ~/.private_config/shared/scripts/init_session.sh /usr/bin/

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm #install tpm
