#!/bin/bash

echo "* Setting up Lily's Tiny Tools *"

echo "Setting up aliases..."
touch ~/.bashrc
echo "alias l=\"ls -l\"" >> ~/.bashrc
echo "alias la=\"ls -la\"" >> ~/.bashrc

echo "Setting up vim configuration..."

cat << 'EOF' > ~/.vimrc
set number
syntax on
set relativenumber
set showmode

" Move 1 more lines up or down in normal and visual selection modes.
nnoremap E :m .-2<CR>==
nnoremap N :m .+1<CR>==
vnoremap E :m '<-2<CR>gv=gv
vnoremap N :m '>+1<CR>gv=gv
EOF

# grc setup to colorize mysql output
# sudo is needed here otherwise EC2 instance user won't have permission to write to /usr/local/bin
echo "Setting up grc for colorized mysql output..."

# Fetch grc files
sudo curl -f -o /usr/local/bin/grc https://raw.githubusercontent.com/lily-gh/tinytools/main/grc/grc
sudo curl -f -o /usr/local/bin/grc.1 https://raw.githubusercontent.com/lily-gh/tinytools/main/grc/grc.1
sudo curl -f -o /usr/local/bin/grcat https://raw.githubusercontent.com/lily-gh/tinytools/main/grc/grcat
sudo curl -f -o /usr/local/bin/grcat.1 https://raw.githubusercontent.com/lily-gh/tinytools/main/grc/grcat.1

# Make executables
sudo chmod +x /usr/local/bin/grc /usr/local/bin/grcat

# Fetch grc config files
sudo curl -f -o ~/.grcat https://raw.githubusercontent.com/lily-gh/tinytools/main/grc/config/.grcat
sudo curl -f -o ~/.my.cnf https://raw.githubusercontent.com/lily-gh/tinytools/main/grc/config/.my.cnf

# make sure ssm-user owns the config files and grc/grcat executable and not root user
sudo chown ssm-user:ssm-user ~/.grcat ~/.my.cnf
sudo chown ssm-user:ssm-user /usr/local/bin/grc /usr/local/bin/grcat /usr/local/bin/grc.1 /usr/local/bin/grcat.1

source ~/.bashrc