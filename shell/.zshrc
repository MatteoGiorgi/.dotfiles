# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install


# The following lines were added by compinstall
# zstyle :compinstall filename '/home/rtbm/.zshrc'
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|?=** r:|?=**'
autoload -Uz compinit
compinit
# End of lines added by compinstall


### QuteTile config ###
alias cls="clear"
alias ..="cd .."
alias ...="cd .. && cd .."
alias ....="cd .. && cd .. && cd .."
alias .....="cd .. && cd .. && cd .. && cd .."
alias cd..="cd .."
alias ls="ls -CF --color=auto"
alias ll="ls -lis --color=auto"
alias l="ls -lisa --color=auto"
alias lsl="ls -lhFA | less"
alias aa='exa -l --git --icons --group-directories-first'
alias a='exa -l --git --tree --icons --group-directories-first'
alias home="cd ~"
alias df="df -ahiT --total"
alias mkdir="mkdir -pv"
alias userlist="cut -d: -f1 /etc/passwd"
alias fhere="find . -name "
alias free="free -mt"
alias ps="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias wget="wget -c"
alias histg="history | grep"
alias myip="curl http://ipecho.net/plain; echo"
alias logs="find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"
alias folders='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias grep='grep --color=auto'
alias vimpager="vimpager -u ~/.vimpagerrc"
alias vifm="vifmrun"
alias ranger='ranger_jump'
alias shfm='shfm_jump'

# Creates an archive (*.tar.gz) from given directory.
function maketar()
{
    tar cvzf "${1%%/}.tar.gz"  "${1%%/}/";
}

# Create a ZIP archive of a file or folder.
function makezip()
{
    zip -r "${1%%/}.zip" "$1";
}

function extract
{
    if [ -z "$1" ]; then
       # display usage if no parameters given
       echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    else
        if [ -f $1 ] ; then
            # NAME=${1%.*}
            # mkdir $NAME && cd $NAME
            case $1 in
                *.tar.bz2)   tar xvjf ../$1    ;;
                *.tar.gz)    tar xvzf ../$1    ;;
                *.tar.xz)    tar xvJf ../$1    ;;
                *.lzma)      unlzma ../$1      ;;
                *.bz2)       bunzip2 ../$1     ;;
                *.rar)       unrar x -ad ../$1 ;;
                *.gz)        gunzip ../$1      ;;
                *.tar)       tar xvf ../$1     ;;
                *.tbz2)      tar xvjf ../$1    ;;
                *.tgz)       tar xvzf ../$1    ;;
                *.zip)       unzip ../$1       ;;
                *.Z)         uncompress ../$1  ;;
                *.7z)        7z x ../$1        ;;
                *.xz)        unxz ../$1        ;;
                *.exe)       cabextract ../$1  ;;
                *)           echo "extract: '$1' - unknown archive method";;
            esac
        else
            echo "$1 - file does not exist"
        fi
    fi
}

# Change directory exiting from shfm
shfm_jump ()
{
    cd "$(command shfm "$@")"
}

# Change directory exiting from ranger
ranger_jump ()
{
    tempfile="$(mktemp -t tmp.XXXXXX)"
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&

    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

# jump directorys upwards until it hits a directory with multiple folders
up ()
{
    local d=""
    limit=$1
    for ((i=1 ; i <= limit ; i++))
        do
          d=$d/..
        done
    d=$(echo $d | sed 's/^\///')
    if [ -z "$d" ]; then
        d=..
    fi
    cd $d
}

# create an directory and directly cd into it
mcd ()
{
    mkdir -p $1
    cd $1
}

# set PATH so it includes user's private bin directories
# (do I have to "export" PATH and PROMPT?)
export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/.cargo/bin"
export PAGER="vimpager"      # most
export BAT_PAGER="vimpager"  # most
export VISUAL="nvim"
export EDITOR="nvim"
export TERM="xterm-256color"
export RANGER_LOAD_DEFAULT_RC="FALSE"
export BROWSER="firefox"
export READER="zathura"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'
export BAT_THEME="base16"
export MICRO_TRUECOLOR=1
export SHFM_OPENER="shfm-opener"

export PROMPT="%B%K{blue}%F{black} %n  %m %K{074}%F{blue}%K{074}%F{black} %9~ %(?.%K{white}%F{074} %K{white}%F{black}  %k%F{white}.%K{magenta}%F{074} %K{magenta}%F{black} %? %k%F{magenta})%k%f"$'\n'"%#%b "
# export PROMPT="%B[%F{cyan}%n%f@%F{magenta}%m%f] [%F{blue}%9~%f] %(?.%F{green} .%F{red} %?)%f"$'\n'"%#%b "

### End config ###

pfetch
source $HOME/.config/fzf/key-bindings.zsh
source $HOME/.config/fzf/completion.zsh

# source /usr/share/fzf/key-bindings.zsh
# source /usr/share/fzf/completion.zsh
source $HOME/.config/broot/launcher/bash/br
