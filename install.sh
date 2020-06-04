log_file = ~/install_log.txt

sudo apt install -y zsh
if type -p zsh > /dev/null; then
    echo "intalled zsh" >> $log_file
else
    echo "can't install zsh" >> $log_file
fi

sudo apt install -y neovim
if type -p nvim > /dev/null; then
    echo "installed nvim" >> $log_file
else
    echo "can't install nvim" >> $log_file
fi

sudo apt install -y tmux
if type -p nvim > /dev/null; then
    echo "installed tmux" >> $log_file
else
    echo "can't install tmux" >> $log_file
fi

sudo apt install -y python3-pip
if type -p nvim > /dev/null; then
    echo "installed python3-pip" >> $log_file
else
    echo "can't install python3-pip" >> $log_file
fi

python3 -m pip install virtualenvwrapper
if python3 -m pip freeze | grep virtualenvwrapper > /dev/null; then
    echo "installed virtualenvwrapper" >> $log_file
else
    echo "can't install virtualenvwrapper" >> $log_file
fi

sudo apt install -y curl
if type -p curl > /dev/null; then
    echo "installed curl"
else
    echo "can't install curl"
fi

# zsh related things
# ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# symlinks
dot_dir = ~/mydot
sudo rm -rf ~/.vim > /dev/null 2>&1
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.tmux > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1
sudo rm -rf ~/.gitconfig > /dev/null 2>&1
sudo rm -rf ~/.config/alacritty > /dev/null 2>&1
sudo rm -rf ~/.config/nvim > /dev/null 2>&1

ln -sf $dot_dir/.vim ~/.vim
ln -sf $dot_dir/.zshrc ~/.zshrc
ln -sf $dot_dir/.tmux ~/.tmux
ln -sf $dot_dir/.tmux.conf ~/.tmux.conf
ln -sf $dot_dir/tmux.terminfo ~/tmux.terminfo
ln -sf $dot_dir/.config/nvim ~/.config/nvim
ln -sf $dot_dir/.config/alacritty ~/.config/alacritty
ln -sf $dot_dir/.gitconfig ~/.gitconfig

# set zsh as default shell
sudo chsh -s /bin/zsh
