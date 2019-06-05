# dotfiles

Inspired by [this blog](https://www.atlassian.com/git/tutorials/dotfiles) (Atlassian did good for once).

Zsh config has been rewritten to use [Antibody](https://getantibody.github.io/install/) using static loading of plugins. Plugins are stored in `.zsh_plugins.txt` and can be bundled by running `antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh` and then `source ~/.zshrc` to reload. The only issue currently is getting Oh My Zsh plugins to work, so I've left them out.

This config uses [Spaceship prompt](https://github.com/denysdovhan/spaceship-prompt), which requires a powerline font. I use [Fira Code](https://github.com/tonsky/FiraCode).
