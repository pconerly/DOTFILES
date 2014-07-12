export PS1="[\u@\W]$ "

## often need this for python
PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

#pear is gross
PATH=/Users/peterconerly/pear/bin:$PATH
PATH=/usr/local/mysql/bin/:$PATH
PATH=/usr/local/share/npm/bin:$PATH
PATH=/usr/local/sbin:$PATH
export PATH

source ~/Dotfiles/lc-listcommands-bash/listcommands.sh
source ~/Dotfiles/bash_completion.d/fab

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi


alias memcached_start='memcached -d -l 127.0.0.1 -p 11211 -m 64'
alias memcached_list='ps aux | grep memcached'

gitdiff() {
	git diff --patience --ignore-space-at-eol -b -w --ignore-blank-lines $1
}

alias restart_fucking_apache='sudo /usr/sbin/apachectl restart'

special_grep_kill() {
	ps -ef | grep $1 | grep -v grep | awk '{print $2}' | xargs kill -9
}

#personal aliases
alias chrome="open /Applications/Google\ Chrome.app"

forevervim() {
	forever list | grep $1 | awk '{print $8}' | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g" | xargs vim
}

# settings for virtualenv wrapper
export WORKON_HOME=~/.virtualenvs
export PROJECT_HOME=~/code
source /usr/local/bin/virtualenvwrapper.sh

## NVM stuff
[[ -s /Users/peterconerly/.nvm/nvm.sh ]] && . /Users/peterconerly/.nvm/nvm.sh # This loads NVM
#nvm install 0.8.23
nvm use 0.10.21

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
