#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
set -o vi

# Make colorcoding available for everyone

Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

NC="\e[m"               # Color Reset


# new alert text
ALERT=${BWhite}${On_Red} # Bold White on red background

# mostly used alias functions

alias cls="clear"
alias ..="cd .."
alias cd..="cd .."
alias ls="ls -CF --color=auto"
alias ll="ls -lisa --color=auto"
alias lsl="ls -lhFA | less"
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
alias sw="swallow"
alias zz="fzf"
alias jj="lsd -lrt"
alias j="lsd -lrta"
alias v="vim"
alias a="amp"
alias vc="vimcat"
alias vp="vimpager -u ~/.vimpagerrc"

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

# Change directory exiting from ranger
g ()
{
    tempfile="$(mktemp -t tmp.XXXXXX)"
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&

    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

# Change directory exiting from fff
f ()
{
    fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}}/.fff_d")"
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
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export PAGER="most"
export VISUAL="vim"
export EDITOR="vim"
export TERM="xterm-256color"
export RANGER_LOAD_DEFAULT_RC="FALSE"
export BROWSER="brave"
export READER="zathura"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# fff configs
export FFF_LS_COLORS=1
export FFF_HIDDEN=0
export FFF_COL1=2
export FFF_COL2=7
export FFF_COL3=6
export FFF_COL4=1
export FFF_COL5=0
export FFF_OPENER="xdg-open"
export FFF_STAT_CMD="stat"
export FFF_CD_ON_EXIT=1
export FFF_CD_FILE=~/.fff_d
export FFF_TRASH=~/.local/share/fff/trash
export FFF_TRASH_CMD="mv"
export FFF_FAV1=~/projects
export FFF_FAV2=~/.bashrc
export FFF_FAV3=~/Pictures/Wallpapers/
export FFF_FAV4=/usr/share
export FFF_FAV5=/
export FFF_FAV6=
export FFF_FAV7=
export FFF_FAV8=
export FFF_FAV9=
export FFF_W3M_XOFFSET=0
export FFF_W3M_YOFFSET=0
export FFF_FILE_FORMAT="%f"
export FFF_MARK_FORMAT=" %f*"

export PS1="\[\033[38;5;12m\][\[$(tput sgr0)\]\[\033[38;5;10m\]\u\[$(tput sgr0)\]\[\033[38;5;12m\]@\[$(tput sgr0)\]\[\033[38;5;7m\]\h\[$(tput sgr0)\]\[\033[38;5;12m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]: \[$(tput sgr0)\]\[\033[38;5;7m\]\w\[$(tput sgr0)\]\[\033[38;5;12m\]>\[$(tput sgr0)\]\[\033[38;5;10m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

[ -e "/etc/DIR_COLORS" ] && DIR_COLORS="/etc/DIR_COLORS"
[ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
[ -e "$DIR_COLORS" ] || DIR_COLORS=""
eval "`dircolors -b $DIR_COLORS`"
### End config ###

pfetch
source $HOME/.config/fzf/key-bindings.bash
source $HOME/.config/fzf/completion.bash

# source /usr/share/fzf/key-bindings.bash
# source /usr/share/fzf/completion.bash
# source /home/rtbm/.config/broot/launcher/bash/br
