#!/bin/bash
sudo apt-get update
sudo apt-get --assume-yes upgrade
sudo apt remove -y vim
sudo apt install -y vim-gtk3 htop x11-xkb-utils autossh tmux git exuberant-ctags unzip
sudo apt --assume-yes autoremove

# Install gh cli
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install gh

# enable shutdown / reboot without sudo
echo '%group_name ALL=(ALL) NOPASSWD: /sbin/poweroff, /sbin/reboot, /sbin/shutdown' | sudo EDITOR='tee -a' visudo

# Begin vim config
sudo apt-get -y install fonts-powerline # required on the machine running the terminal
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "set rtp+=~/.vim/bundle/Vundle.vim" >> ~/.vimrc
echo "call vundle#begin()" >> ~/.vimrc
echo "Plugin 'flazz/vim-colorschemes'" >> ~/.vimrc
vim +PluginInstall +qall > /dev/null

# Without this git will ask to manually confirm the fingerprint for github.com
echo 'github.com ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ=='  >> ~/.ssh/known_hosts
