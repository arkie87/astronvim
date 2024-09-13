sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"  
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

# sudo apt-get install build-essential

sudo apt-get update
sudo apt-get install xclip
sudo apt-get install python3-pip
sudo apt-get install python3-venv
sudo apt-get install python3-neovim

brew install neovim
brew install ripgrep
brew install lazygit

brew install npm
npm install -g neovim



# Install blank AstroNvim Template
# git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
# rm -rf ~/.config/nvim/.git


# Instal Custom Template
cd ~/.config
git clone https://github.com/arkie87/astronvim.git
mv ~/.config/astronvim ~/.config/nvim

nvim
