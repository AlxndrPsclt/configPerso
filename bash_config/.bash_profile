
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


source ~/.xsh


#Some Virtualevwrapper conf
export WORKON_HOME="~/Documents/Alex/.virtualenv"
source /usr/local/bin/virtualenvwrapper.sh
