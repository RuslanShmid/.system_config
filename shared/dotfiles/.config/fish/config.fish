set -g -x fish_greeting ''

set -g theme_color_scheme solarized-dark
set -g theme_newline_cursor yes
set -g theme_display_user ssh
rvm default
# set -g -x GEM_HOME=$HOME/.gem

alias g='git'
alias h='htop'
alias gtop='sudo intel_gpu_top'
alias cb='acpi -i'
alias gi='git'
alias remove_orig="find . -name '*.orig' -delete"
alias tm='tmux'
alias i3l='i3lock'
alias ls='exa'
alias la='exa -lat modified'
alias kil='kill -9 '
alias pac='sudo pacman'
alias gp='ps aux | grep '
alias smddd='shutdown -h now'

# vim aliases
alias v='nvim'
alias vi='nvim'
# alias vim='nvim'

# rails aliases
alias r='rails'
alias be='bundle exec'
alias redropdb="rails db:drop && rails db:create && rails db:migrate"
alias restart_spring="spring stop && spring binstub --all && spring start"

# thinkpad
alias tha='thinkalert'

eval (ssh-agent -c)
# ssh-add ~/private/ssh/id_rsa
ssh-add ~/private/ssh/id_rsa_rsd
# ssh-add ~/private/ssh/id_rsa_visitorg
# ssh-add /home/shmid/.ssh/digital_ocean

alias .1='cd ../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias .7='cd ../../../../../../../'

# Docker
alias dc='docker-compose'
alias de='docker exec -it'
alias docker_rm_all_images='docker rmi (docker images -q)'
alias docker_rm_all_images_force='docker rmi -f (docker images -q)'
alias docker_rm_all_containers='docker rm (docker ps -a -q)'
alias docker_stop_all_containers='docker stop (docker ps -a -q)'

# function remove_container_and_image(docker_name){
#   docker rm docker_name; and docker rmi docker_name
# }

### VARIABLES
export EDITOR="nvim"
export WINIT_HIDPI_FACTOR='false'

# clear
# clear

