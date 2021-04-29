git clone https://github.com/creationix/nvm.git ~/.nvm
cd ~/.nvm
git checkout (git describe --abbrev=0 --tags)
cd ~/.config/fish
git clone git://github.com/passcod/nvm-fish-wrapper.git nvm-wrapper
echo source ~/.config/fish/nvm-wrapper/nvm.fish >> ~/.config/fish/config.fish
