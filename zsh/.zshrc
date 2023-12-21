# If you come from bash you might have to change your $PATH.
#if [[ -z $TMUX ]]; then
#    export PATH=$HOME/.local/bin/:$PATH
#fi

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

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

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
plugins=(git zsh-autosuggestions)


export PROFILE="work"
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Exports
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/
export NPM_PACKAGES=$HOME/.npm-packages/bin
export PATH="$PATH:$NPM_PACKAGES"
export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.yarn/bin"
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fnm
which fnm &> /dev/null
if [[ ! $? ]] then;
    export PATH="/home/fleetscut/.local/share/fnm:$PATH"
    eval "`fnm env`"
fi

# ~/.tmux/plugins
export PATH=$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
# ~/.config/tmux/plugins
export PATH=$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# export FZF_DEFAULT_COMMAND="fdfind --hidden --follow --exclude '.git' --exclude 'node_modules'"
export FZF_DEFAULT_COMMAND="fdfind --hidden --follow --exclude 'node_modules' --no-ignore"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--reverse"

export EDITOR=vim
export VISUAL=vim

if [[ "$(hostname)" == "sazabi" ]]; then
    script_prefix="desktop"
fi
if [[ "$(hostname)" == "TOCONALF3QT2CC" ]]; then
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
#alias bat=batcat
alias cat=batcat
alias ls=lsd
alias src="source ~/.zshrc"
alias ssh="TERM=xterm-256color ssh"
alias zz="zellij"
alias zv='zellij --layout vim'
alias fd='fdfind'
alias kittyupdate='curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin dest=/opt/apps/'

if [[ $script_prefix ]]; then
	source $HOME/.config/machine_configs/${script_prefix}_aliases.sh
	source $HOME/.config/machine_configs/${script_prefix}_funcs.sh
	source $HOME/.config/machine_configs/${script_prefix}_env.sh

	unset $script_prefix
fi

autoload -U edit-command-line
zle -N edit-command-line

bindkey -v
bindkey '^v' edit-command-line
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

cpicker () {
    slurp -p | grim -g - - | convert - txt: | tail -n 1
}

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

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# bun completions
[ -s "/home/loschiav/.bun/_bun" ] && source "/home/loschiav/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
