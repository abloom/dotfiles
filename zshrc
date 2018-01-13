# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git history-substring-search gem osx rails rake ssh-agent bundler npm colored-man screen docker vagrant rbenv scala sbt bower docker-compose mvn go golang)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export EDITOR="nvim"

zstyle :omz:plugins:ssh-agent agent-forwarding on

#PATH=$HOME/node_modules/.bin:$HOME/bin:/usr/local/share/npm/bin:$PATH; # Add NPM
#PATH=$HOME/code/activator-dist-1.3.10/bin:$PATH;

unsetopt auto_name_dirs

#export NVM_DIR="/Users/abloom/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

alias ll='ls -lah'
#alias setjdk17='export JAVA_HOME=$(/usr/libexec/java_home -v 1.6)'
#alias setjdk17='export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)'
#alias setjdk18='export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)'
#setjdk18

ulimit -n 4096

#export GOPATH="$HOME/golang"
alias ta='tmux attach -d -t'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
test -e "${HOME}/.zsh_profile" && source "${HOME}/.zsh_profile"
