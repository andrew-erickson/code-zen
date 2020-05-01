#!/bin/bash
#run this by 'bash -c "$(curl -fsSL https://raw.githubusercontent.com/andrew-erickson/code-zen/master/launch/code-zen.sh)"'
cd ~

#add .bash_aliases
curl -o .bash_aliases https://gist.githubusercontent.com/andrew-erickson/a141fc02e622f7a02b7fd5209cdab571/raw

#add .bash_git
curl -L https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh > ~/.bash_git

#add .bashrc
printf "\n%s\n\n" "$(curl https://raw.githubusercontent.com/andrew-erickson/dotfiles/14223787766c22cfd40b70ca212c8e460662f6c0/.bashrc)" >> ~/.bashrc
echo '[ -r ~/.bashrc ] && . ~/.bashrc' >> ~/.bash_profile

#add vim configs
mkdir -p ~/.vim/colors
cd ~/.vim/colors
curl -O https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim
cd ~
curl -o .vimrc https://raw.githubusercontent.com/andrew-erickson/dotfiles/master/.vimrc
source .vimrc

#install linux brew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
sudo apt-get install build-essential
echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >>~/.bash_profile
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
brew install gcc

#generate ssh key for github
ssh-keygen -f ~/.ssh/github_rsa -t rsa -N ''

#set on github
read -p "Copy key below and paste -> https://github.com/settings/ssh/new:"$'\n'$'\n'"$(cat ~/.ssh/github_rsa.pub)"$'\n'$'\n'"To continue, press ENTER: "

#generate ssh key for codecommit
ssh-keygen -f ~/.ssh/codecommit_rsa -t rsa -N ''

#set on aws iam
read -p "Copy key below and paste -> https://console.aws.amazon.com/iam/home#/users/andrew?section=security_credentials:"$'\n'$'\n'"$(cat ~/.ssh/codecommit_rsa.pub)"$'\n'$'\n'"To continue, press ENTER: "

#create a config file in .ssh
#Host git-codecommit.*.amazonaws.com
#  User <SSH key id>
#  IdentityFile ~/.ssh/codecommit_rsa

# add the keys
eval "$(ssh-agent -s)"
ssh-add .ssh/github_rsa
ssh-add .ssh/codecommit_rsa

#clone code zen
git clone --recurse-submodules git@github.com:andrew-erickson/code-zen.git tmp
[[ -e ~/tmp ]] && cp -rT ~/tmp ~/code-zen && rm -rf ~/tmp

#git config
cd ~/code-zen
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
