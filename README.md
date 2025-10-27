# Tiny Tools
Useful small tools, mostly used when connecting to some server that doesn't have my usual settings.

## How to use
Simply run the following command in order to fetch and execute `mini-tools.sh` when connected to any computer:

```bash
curl -fsSL tools.lilyoliveira.com | bash
```

## Features

### Shell Aliases
- `l` - shortcut for `ls -l` (long format listing)
- `la` - shortcut for `ls -la` (long format with hidden files)

### Vim Configuration
- Line numbers enabled
- Syntax highlighting
- Relative line numbers for easier navigation
- Show current mode
- Custom key mappings:
  - `E` - move line up (normal and visual modes)
  - `N` - move line down (normal and visual modes)

### GRC (Generic Colouriser)
- Colorized MySQL console output for better readability
- Automatically fetches and configures `grc` and `grcat` utilities
- Includes MySQL-specific color configuration


## Removing colorizer
In order to remove the tools and settings for Generic Colouriser, simply run:
```bash
sudo rm -f /usr/local/bin/grc /usr/local/bin/grcat /usr/local/bin/grc.1 /usr/local/bin/grcat.1 ~/.grcat ~/.my.cnf ~/.vimrc && echo "Done cleaning up."
```