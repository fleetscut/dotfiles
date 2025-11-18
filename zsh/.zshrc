# If you come from bash you might have to change your $PATH.
#if [[ -z $TMUX ]]; then
#    export PATH=$HOME/.local/bin/:$PATH
#fi

# sleep 0.05s # fixes size issues from terminal spawn animation

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="simonoff"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions fast-syntax-highlighting)

export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
source ~/.local/share/omarchy/default/bash/aliases

# Exports
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/
export NPM_PACKAGES=$HOME/.npm-packages/bin
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
export ZK_NOTEBOOK_DIR="$HOME/Documents/notes/zk/"

if command -v mise > /dev/null 2>&1; then
    eval "$(mise activate zsh)"
fi

# BUN
export BUN_INSTALL="$HOME/.bun"

# TMUX
if [[ -z $TMUX ]]; then
    export PATH="$PATH:$NPM_PACKAGES"
    export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.yarn/bin"
    export PATH="$PATH:$BUN_INSTALL/bin"
    export PATH="$PATH:$(go env GOPATH)/bin"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -U edit-command-line
zle -N edit-command-line

bindkey -v
bindkey '^v' edit-command-line

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if [[ -d /usr/share/fzf ]]; then
    source /usr/share/fzf/key-bindings.zsh
    source /usr/share/fzf/completion.zsh
fi

export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude '.git' --exclude 'node_modules' --no-ignore"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"

export FZF_DEFAULT_OPTS=' 
--ansi 
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc 
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 
--color=selected-bg:#45475a 
--reverse
--multi'

export EDITOR=nvim
export VISUAL=nvim
#export MANPAGER="nvim -c 'Man!' -o -"

if [[ "$(uname -n)" == "sazabi" ]]; then
    script_prefix="desktop"
fi
if [[ "$(uname -n)" == "TOCONALF3QT2CC" ]]; then
    script_prefix="work"
fi
if [[ "$(uname -r | grep -i android)" ]]; then
    script_prefix="tablet"
fi

#ALTERNATES
# cat -> bat
# find -> fd
# ps -> procs
# sed -> sd
# du -> dust
# grep -> rg (ripgrep)
# bandwhich
# grex
# dig -> dog
# uniq -> huniq
# jq -> jql
# lazygit -> gitui
# less -> moar

alias vim=nvim
alias sudo='sudo '
if command -v -- batcat > /dev/null 2>&1; then
    alias bat=batcat
fi
alias cat=bat
if command -v -- lsd > /dev/null 2>&1; then
    alias ls=lsd
fi
alias src="source ~/.zshrc"
alias crc="vim ~/.zshrc"
alias ssh="TERM=xterm-256color ssh"
alias zz="zellij"
alias zv='zellij --layout vim'
if command -v -- fdfind > /dev/null 2>&1; then
    alias fd='fdfind'
fi

alias tree='lsd --tree'

if [[ $script_prefix ]]; then
	source $HOME/.config/machine_configs/${script_prefix}_aliases.sh
	source $HOME/.config/machine_configs/${script_prefix}_funcs.sh
	source $HOME/.config/machine_configs/${script_prefix}_env.sh

	unset $script_prefix
fi

if command -v -- lf > /dev/null 2>&1; then
    bindkey -s "^g" "lf-cd\n"
    lf-cd () {
        tmp="$(mktemp)"
        lf -last-dir-path="$tmp" "$@"
        if [ -f "$tmp" ]; then
            dir="$(cat "$tmp")"
            rm -f "$tmp"
            [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
        fi
    }
fi

cu () {
    if [[ -z $1 ]]; then
        local num=1
    else
        local num=$1
    fi
    while [[ $num != 0 ]]; do
        cd ..
        num=$((num-1))
    done
}

# Extra setups
eval "$(starship init zsh)"

# man pager
eval "$(batman --export-env)"

# Missing some zsh features
# eval "$(zoxide init --cmd cd zsh)"
eval "$(zoxide init zsh)"

# FNM
# export PATH="/home/fleetscut/.local/share/fnm:$PATH"
if command -v -- fnm > /dev/null 2>&1; then
    eval "$(fnm env --use-on-cd)"
fi

