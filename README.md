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


# install docker in ubuntu
## 更新apt包索引
sudo apt-get update

## 安装允许apt通过HTTPS使用仓库的包
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

## 添加Docker的官方GPG密钥
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

## 设置稳定版仓库
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

## 更新apt包索引
sudo apt-get update

## 安装Docker Engine和Docker Compose
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
