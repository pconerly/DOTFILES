# export PS1="[\u@\W]$ "

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u \[\033[32m\]\W\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

## often need this for python
PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

PATH=/usr/local/mysql/bin/:$PATH
PATH=/usr/local/share/npm/bin:$PATH
PATH=/usr/local/sbin:$PATH
export PATH

source ~/Dotfiles/lc-listcommands-bash/listcommands.sh
source ~/Dotfiles/bash_completion.d/fab

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

gitdiff() {
	git diff --patience --ignore-space-at-eol -b -w --ignore-blank-lines $1
}

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
nvm use 8.9.1

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin/

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PGDATA=~/pgdata

export CSC_NAME='Mac Developer: Peter Conerly (487Y6HV8ZT)'
unset CSC_NAME
unset CSC_LINK
unset CSC_KEY_PASSWORD


# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/peterconerly/Downloads/google-cloud-sdk/path.bash.inc' ]; then source '/Users/peterconerly/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/peterconerly/Downloads/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/peterconerly/Downloads/google-cloud-sdk/completion.bash.inc'; fi

alias notifyTestsDone="osascript -e 'display notification \"Tests done\" with title \"Tests Done\"'"
alias notifyTD=notifyTestsDone

export NODE_OPTIONS=--max_old_space_size=8192

eval "$(direnv hook bash)"
