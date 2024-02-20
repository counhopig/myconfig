# myconfig
my config file for many tools
# how to optimise the zsh usage
## install oh-my-zsh
```sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"```
## install the theme "Powerlevel10k"
```git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k```
## Open the ~/.zshrc, and change "ZSH_THEME"
```ZSH_THEME="powerlevel10k/powerlevel10k"```
## install the plugin in omzsh
### install "zsh-autosuggestions"
```git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions```
### install "zsh-syntax-highlighting"
```git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting```
## Open the ~/.zshrc, and change "plugins"
"plugins=(git
            z
            zsh-autosuggestions
            zsh-syntax-highlighting)"
