# Initialize all the essentials
sudo apt install -y python3-pip zsh htop git curl tldr ca-certificates curl gnupg lsb-release libfuse2 tilix wget

# Set ZSH as default shell
sudo usermod -s /usr/bin/zsh $(whoami)

# Download and install fonts for p10k
sudo wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -P /usr/local/share/fonts
sudo wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -P /usr/local/share/fonts
sudo wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -P /usr/local/share/fonts
sudo wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -P /usr/local/share/fonts

sudo ln -fs /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh

# Slack
wget https://downloads.slack-edge.com/releases/linux/4.29.149/prod/x64/slack-desktop-4.29.149-amd64.deb
sudo dpkg -i slack-desktop-4.29.149-amd64.deb
sudo apt install -yf

# Install Antigen (ZSH plugin manager)
curl -L git.io/antigen > ~/.antigen.zsh

# Copy configuration scripts
cp .zshrc ~/.zshrc
cp .antigenrc ~/.antigenrc
cp .p10k.zsh ~/.p10k.zsh

# Install Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# Install 
sudo add-apt-repository --yes ppa:graphics-drivers/ppa && sudo dpkg --add-architecture i386 && sudo apt update && sudo apt install -y nvidia-driver-525 libvulkan1 libvulkan1:i386

# Mesa drivers
sudo add-apt-repository --yes ppa:kisak/kisak-mesa && sudo apt update && sudo apt upgrade

# Docker stuff
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Install Taskfile
sudo sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin

# Install Jetbrains Toolbox
curl -fsSL https://raw.githubusercontent.com/nagygergo/jetbrains-toolbox-install/master/jetbrains-toolbox.sh | bash

# Cleanup 
rm google-chrome-stable_current_amd64.deb get-docker.sh slack-desktop-4.29.149-amd64.deb

# Info for the user
echo ""
echo "EXECUTE THOSE COMMANDS AFTER REBOOT:"
echo ""
echo "sudo groupadd docker"
echo "sudo usermod -aG docker $USER"
