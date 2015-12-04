alias search="apt-cache search"

# some more ls aliases
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .5='cd ../../../../..'

alias 'p'='cd -'
alias d='du -sh *'

alias vimrc='vim ~/.vim/vimrc'
alias cdvim='cd ~/.vim'

alias torb='~/Documents/Apps/Security/tor-browser_en-US/start-tor-browser'

alias shortcuts='less ~/Documents/Archive/shortcuts'
alias eshortcuts='vim ~/Documents/Archive/shortcuts'

alias c='clear'

# Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'


alias mdv='/home/alex/Documents/Apps/Others/terminal_markdown_viewer/mdv.py'


# Appends last command to my system_install.sh script to reinstall environement easy.
alias sav='~/.config/perso/saveCommand.sh'
alias editsav='vim ~/.config/perso/saveCommand.sh'

alias editsys='vim ~/.config/perso/system_install.sh'

alias adminTools='~/.config/perso/adminTools.sh'

export MARKPATH=$HOME/.marks
function jump { 
    cd -P $MARKPATH/$1 2>/dev/null || echo "No such mark: $1"
}
function mark { 
    mkdir -p $MARKPATH; ln -s $(pwd) $MARKPATH/$1
}
function unmark { 
    rm -i $MARKPATH/$1 
}
function marks {
    ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}




function undozip(){
  unzip -l "$1" |  awk 'BEGIN { OFS="" ; ORS="" } ; { for ( i=4; i<NF; i++ ) print $i " "; print $NF "\n" }' | xargs -I{} rm -r {}
}



function mcd() {
  mkdir -p "$1" && cd "$1";
}


n (){
($* ; notify-send "Command over" "$*")
}
