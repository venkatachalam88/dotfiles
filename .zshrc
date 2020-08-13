# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk


# Zinit Snippets
# oh-my-zsh plugins
zinit snippet	OMZ::plugins/archlinux/archlinux.plugin.zsh
zinit cdclear -q

zinit snippet	OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

# Zinit Plugins
# Two regular plugins loaded without investigating.
# Added Multi word search
# zinit for \
#    light-mode  zsh-users/zsh-autosuggestions \
#    light-mode  zdharma/fast-syntax-highlighting \
#                zdharma/history-search-multi-word

# Prompt
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure
# zinit   light	denysdovhan/spaceship-prompt
# zinit ice depth=1; zinit light romkatv/powerlevel10k


# Spaceship theme configrations
# SPACESHIP_CHAR_SYMBOL='❯ '
# SPACESHIP_PROMPT_ADD_NEWLINE=false
# SPACESHIP_VI_MODE_SHOW=true
# SPACESHIP_VI_MODE_COLOR='#1793D1'


# z
zinit ice wait blockf lucid
zinit light rupa/z

# Don't bind these keys until ready
bindkey -r '^[[A'
bindkey -r '^[[B'
function __bind_history_keys() {
 bindkey '^[[A' history-substring-search-up
 bindkey '^[[B' history-substring-search-down
}

# History substring searching
zinit ice wait lucid atinit'__bind_history_keys'
zinit light zsh-users/zsh-history-substring-search

# Tab completions
zinit ice wait lucid blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

# Syntax highlighting
zinit ice wait lucid atinit'zpcompinit; zpcdreplay'
zinit light zdharma/fast-syntax-highlighting

# autosuggestions, trigger precmd hook upon load
zinit ice wait lucid atload'_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# History search multi word
zinit load zdharma/history-search-multi-word


# Lines configured by zsh-newuser-install

# ===== History
HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000

# Treat the '!' character specially during expansion
setopt BANG_HIST

# Allow multiple terminal sessions to all append to one zsh command history
setopt APPEND_HISTORY

# Save each command’s beginning timestamp (in seconds since the epoch) and the duration (in seconds) to the history file
setopt EXTENDED_HISTORY

# Add commands as they are typed, don't wait until shell exit
setopt INC_APPEND_HISTORY

# If the internal history needs to be trimmed to add the current command line, setting this option will cause the oldest history event that has a duplicate to be lost before losing a unique event
setopt HIST_EXPIRE_DUPS_FIRST

# Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_ALL_DUPS

# Do not enter command lines into the history list if they are duplicates of the previous event
setopt HIST_IGNORE_DUPS

# remove command lines from the history list when the first character on the line is a space
setopt HIST_IGNORE_SPACE

# When searching history don't display results already cycled through twice
setopt HIST_FIND_NO_DUPS

# remove the history (fc -l) command from the history list when invoked
setopt HIST_NO_STORE

# Don't write duplicate entries in the history file
setopt HIST_SAVE_NO_DUPS

# remove superfluous blanks from each command line being added to the history list
setopt HIST_REDUCE_BLANKS

# whenever the user enters a line with history expansion, don’t execute the line directly 
setopt HIST_VERIFY

# this option both imports new commands from the history file, and also causes your typed command
unsetopt SHARE_HISTORY

# Beep when accessing nonexistent history
setopt HIST_BEEP


# Bindkeys
bindkey -v
bindkey	"^[[H"	beginning-of-line
bindkey	"^[[F"	end-of-line
bindkey	"^[[5~"	beginning-of-buffer-or-history
bindkey	"^[[6~"	end-of-buffer-or-history
bindkey	"^[[3~"	delete-char
bindkey	"^[[2~"	overwrite-mode
bindkey	"^[[Z"	reverse-menu-complete
bindkey	"^R"	history-search-multi-word


# URxvt BindKeys
bindkey	"^[[1~"	beginning-of-line
bindkey	"^[[4~"	end-of-line
bindkey	"^[[7~"	beginning-of-line
bindkey	"^[[8~"	end-of-line

# End of lines configured by zsh-newuser-install


# Tmux fix
# DISABLE_AUTO_TITLE="true"


# Export
export EDITOR='vim'


# Nord Directory
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Zsh Completion - Zinit
# autoload -Uz compinit
# compinit

# zinit cdreplay -q
# zinit cdlist


zstyle ':completion:*' rehash true


# Vi mode
#function zle-line-init zle-keymap-select {
#    RPS1="${${KEYMAP/vicmd}/(main|viins)}"
#    RPS2=$RPS1
#    zle reset-prompt
#}

#zle -N zle-line-init
#zle -N zle-keymap-select


# Reduce latency when pressing <Esc>
export KEYTIMEOUT=1


# Completion for kitty
# kitty + complete setup zsh | source /dev/stdin


# Paths
export PATH="$HOME/.local/bin:$PATH"


#Alias
eval $(thefuck --alias)


# My Alias
alias ls='ls --color=auto'
alias tree='tree -C'


# My Commands

$HOME/Documents/Scripts/shell_scripts/ASCII/scripts/arch_logo_toilet.sh

#case $TERM in
#  rxvt*)
#    sh $HOME/Documents/Scripts/shell_scripts/ASCII/scripts/arch_logo_toilet.sh #| lolcat
#    ;;
#	  *)
#     sh $HOME/Documents/Scripts/shell_scripts/ASCII/scripts/arch_logo_toilet.sh
#    ;;
#esac


#case $TERM in
#  rxvt*)
#    precmd () {print -Pn "\e]0;Urxvt - %~\a"}
#    ;;
#  xterm-termite)
#    precmd () {print -Pn "\e]0;Termite - %~\a"}
#    ;;
#  alacritty)
#    precmd () {print -Pn "\e]0;Alacritty - %~\a"}
#    ;;
#esac

alias config='/usr/bin/git --git-dir=/home/venkat/.cfg/ --work-tree=/home/venkat'
