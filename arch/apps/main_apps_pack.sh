#!/bin/sh

# browsers
yay -S google-chrome            --noconfirm #
yay -S chromium                  --noconfirm #
# yay -S librewolf                 --noconfirm
yay -S librewolf-bin                 --noconfirm
yay -S firefox-developer-edition --noconfirm
yay -S firefox                  --noconfirm #
yay -S opera                    --noconfirm #
yay -S lynx                     --noconfirm # console browser?
yay -S qutebrowser              --noconfirm # chromium browser with vim bindings
yay -S vivaldi                  --noconfirm # ?
# yay -S brave                    --noconfirm #
yay -S brave-bin                    --noconfirm #
yay -S min                      --noconfirm #
yay -S genymotion               --noconfirm

# system configuration
yay -S pavucontrol              --noconfirm # volume control throw UI
yay -S pamixer                  --noconfirm # volume control throw terminal
yay -S brightnessctl            --noconfirm # brightness control throw console
sudo chmod u+s /usr/bin/brightnessctl # to run brightnessctl without sudo
# yay -S xbacklight               --noconfirm #

# editors
# yay -S atom                     --noconfirm #
# yay -S code                     --noconfirm

# messangers
yay -S slack-desktop            --noconfirm #
yay -S telegram-desktop         --noconfirm #

# system information
yay -S dmidecode                --noconfirm #
yay -S kinfocenter              --noconfirm #

# terminals
yay -S alacritty                --noconfirm #
yay -S konsole                  --noconfirm #
# yay -S cool-retro-term          --noconfirm #
# yay -S guake                    --noconfirm #
# yay -S terminology              --noconfirm #
yay -S downgrade                --noconfirm # downgrade the packages

# others
# yay -S unetbootin               --noconfirm # usb bootable flash drive
yay -S spectacle                --noconfirm # screenshot maker
# yay -S spacefm                  --noconfirm # file manager
sudo pacman -S pcmanfm          --noconfirm # light weight file manager
yay -S okular                   --noconfirm # pdf/images viewer
yay -S arandr                   --noconfirm # monitor manager
yay -S debtap                   --noconfirm # deb to arch packages
# yay -S openvpn                  --noconfirm #
# yay -S ngrok                    --noconfirm # introspectable tunnels to localhost
yay -S libreoffice-fresh        --noconfirm #
# yay -S amarok                   --noconfirm # music player
yay -S cmus                     --noconfirm # konsole music player
yay -S gotop                    --noconfirm
yay -S vlc                      --noconfirm # video player
yay -S ktorrent                 --noconfirm #
yay -S audacity                 --noconfirm # mp3 manager
yay -S time                     --noconfirm # time <command> for benchmarks
# yay -S zeal                     --noconfirm # offline documentation
yay -S htop                     --noconfirm #
sudo pacman -S iftop            --noconfirm # Iftop, one of the most popular command line tool for monitoring network traffic in Linux.
# yay -S redshiftgui-bin          --noconfirm
yay -S virtualbox               --noconfirm
yay -S kazam                    --noconfirm # Audio and video recorder
yay -S inxi                     --noconfirm # inxi -b # system information
yay -S glxinfo                  --noconfirm
sudo pacman -S grub-customizer  --noconfirm # gui editor for grub.cfg
# yay -S pgadmin4 --noconfirm
yay -S postman-bin              --noconfirm
# yay -S                          --noconfirm #
sudo pacman -S youtube-dl       --noconfirm # download the youtube video

###########################
# yay -S viber                    --noconfirm
# yay -S skypeforlinux-stable-bin --noconfirm

### clearing system
sudo pacman -S pacman-contrib      --noconfirm
yay -S ncdu                     --noconfirm
# yay -S smartgit                 --noconfirm
# yay -S gitkraken                --noconfirm
sudo pacman -S gitg                --noconfirm


### math
# yay -S qalculate-gtk            --noconfirm
yay -S speedcrunch              --noconfirm # calculator
# yay -S geogebra                 --noconfirm

### android
yay -S android-file-transfer    --noconfirm #
yay -S scrcpy                   --noconfirm #
sudo pacman -S mtpfs               --noconfirm
yay -S genymotion               --noconfirm

### additional
sudo pacman -S gimp                --noconfirm # Photoshop like tool

### benchmarks
yay -S s-tui                    --noconfirm # cpu ui information
sudo pacman -S intel-gpu-tools     --noconfirm # intel_gpu_top
# yay -S python-gpustat           --noconfirm # gpustat # gpustat --watch
# sudo pacman -S dmidecode           --noconfirm
# sudo pacman -S hddtemp             --noconfirm # check drive temperature
yay -S hardinfo                 --noconfirm

########################### Additional           # inxi -Fxxx
sudo pacman -S feh                 --noconfirm # image viewer
sudo pacman -S acpi                --noconfirm # check battery status
sudo pacman -S neofetch            --noconfirm
# sudo pacman -S lshw                --noconfirm # posts information
sudo pacman -S speedtest-cli       --noconfirm
# yay -S sc-im                    --noconfirm
# sudo pacman -S xf86-video-intel    --noconfirm # intel graphics
# sudo pacman -S ntfs-3g             --noconfirm # mkfs.ntfs make
sudo pacman -S ntfsprogs           --noconfirm # make
sudo pacman -S unzip               --noconfirm
sudo pacman -S zip                 --noconfirm
sudo pacman -S xorg-xprop          --noconfirm # shows the information about the window
sudo pacman -S exa                 --noconfirm # ls replacer
sudo pacman -S bind-tools          --noconfirm # contains dig tool
# sudo pacman -S fio                 --noconfirm # storage benchmark
sudo pacman -S vsftpd              --noconfirm # secure SSH server
# sudo yay -S lnav              --noconfirm # logs https://github.com/tstack/lnav
# sudo pacman -S truecrypt           --noconfirm

# sudo pacman -S cronie              --noconfirm # install crontab # crontab -e # to edit the cron
# sudo systemctl start cronie.service
# sudo systemctl enable cronie.service


# yubico
sudo pacman -S pam-u2f             --noconfirm






### bash to dash
sudo pacman -S dash                --noconfirm # dash
sudo yay -S dashbinsh           --noconfirm # Relink /bin/sh to dash

### games
# sudo pacman -S dwarffortress       --noconfirm
