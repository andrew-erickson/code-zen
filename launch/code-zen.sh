#!/bin/bash
#run this by 'bash -c "$(curl -fsSL https://gist.githubusercontent.com/andrew-erickson/12830891b1e92bca2dbe2361894d23d9/raw)"'
cd ~

#add .bash_aliases
curl -o .bash_aliases https://gist.githubusercontent.com/andrew-erickson/a141fc02e622f7a02b7fd5209cdab571/raw

#add .bash_git
curl -L https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh > ~/.bash_git

#add .bashrc
printf "\n%s\n\n" "$(curl https://gist.githubusercontent.com/andrew-erickson/9e5e3e41fa03e84268941a9908590a71/raw)" >>~/.bashrc

#add vim configs
mkdir -p ~/.vim/colors
cd ~/.vim/colors
curl -O https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim
cd ~
curl -o .vimrc https://gist.githubusercontent.com/andrew-erickson/74eeabedf01c5cc7eede49718527b59d/raw
source .vimrc

#install linux brew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
sudo apt-get install build-essential
echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >>~/.bash_profile
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
brew install gcc

#generate ssh key
ssh-keygen -f ~/.ssh/id_rsa -t rsa -N ''

#wait for user prompt
read -p "Copy key below and paste -> https://github.com/settings/ssh/new:"$'\n'$'\n'"$(cat ~/.ssh/id_rsa.pub)"$'\n'$'\n'"To continue, press ENTER: "

#clone code zen
git clone --recurse-submodules git@github.com:andrew-erickson/code-zen.git
[[ -e ~/code-zen ]] && cp -rT ~/code-zen ~/workspace && rm -rf ~/code-zen

#git config
cd ~/workspace
git config --global user.name "Andrew Erickson"
git config --global user.email andrew.erickson321@gmail.com
git config push.recurseSubmodules on-demand

#install github's gitignore
npm install gitignore -g

#install clojure
brew install clojure

#install mit-scheme
sudo apt-get install mit-scheme -y

#node
cd ./node
npm install

#jest
npm install --save-dev jest
