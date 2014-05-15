#!/usr/bin/env zsh
# ajh17's ~/.zshrc

# Autoload {{{1
autoload -U edit-command-line
zle -N edit-command-line

# Source externals {{{1
source ~/.zsh/styles.zsh
source ~/.zsh/aliases
source ~/.zsh/ajh.zsh-theme
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.zsh/plugins/opp/opp.zsh
source ~/.zsh/plugins/opp/opp/surround.zsh
source `brew --prefix`/etc/autojump.sh
eval "$(rbenv init - --no-rehash zsh)"

# Variables {{{1
export ARCHFLAGS="-arch x86_64"
export BROWSER='open'
export CORRECT_IGNORE='_*'
export EDITOR=vim
export GREP_COLOR='1;33'
export GREP_OPTIONS='--color=auto'
export KEYTIMEOUT=1
export LANG='en_US.UTF-8'
export LESS='-F -g -i -M -R -S -w -X -z-4'
export PAGER='less'
export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=yellow,bold'
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=magenta,bold'

# Settings {{{1
setopt alwaystoend completeinword completealiases pathdirs automenu autolist menucomplete
setopt prompt_subst extendedglob globdots globcomplete correct recexact
setopt sharehistory histignoredups histreduceblanks histignorespace
setopt banghist incappendhistory histexpiredupsfirst histignorealldups
setopt histfindnodups histsavenodups histverify
setopt pushdtohome pushdsilent autopushd pushdminus
setopt longlistjobs autoresume multios
setopt autocd cdablevars multios rmstarwait
setopt rcquotes autoparamslash markdirs
setopt chaselinks combiningchars
unsetopt flowcontrol caseglob clobber extendedhistory nomatch

# History {{{1
HISTFILE=$HOME/.cache/.zhistory
HISTSIZE=200000
SAVEHIST=200000

# Key Remappings (Vi-mode) {{{1
bindkey -v
bindkey -M vicmd "?" history-incremental-pattern-search-backward
bindkey -M vicmd "/" history-incremental-pattern-search-forward
bindkey -M vicmd v edit-command-line
bindkey -M vicmd 'u' undo
bindkey -M vicmd '^r' redo
bindkey -M vicmd '~' vi-swap-case
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[Z' reverse-menu-complete
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^l' clear-screen
bindkey '^k' kill-line
bindkey '^u' backward-kill-line
bindkey '^r' history-incremental-search-backward
bindkey '^p' history-search-backward
bindkey '^n' insert-last-word
bindkey '^?' backward-delete-char

# Functions {{{1
function cdf {
    target=`osascript -e 'tell application "Finder" to get POSIX path of (target of front Finder window as text)'`
    if [[ "$target" != "" ]]; then
        cd "$target"; echo "Going to $target"
    else
        echo -e 'There are no Finder windows!' >$2
    fi
}
