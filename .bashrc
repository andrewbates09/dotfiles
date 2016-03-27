# this can be saved where you need it for lots of users (ex: /etc/bash.bashrc )

if [ -f /etc/bash_completion ]; then
            . /etc/bash_completion
fi

export EDITOR=/usr/bin/vim
export BROWSER=/usr/bin/palemoon

# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# how do you moo && must have cowsay installed
if [ -x /usr/games/cowsay ]; then
	cowsay -f tux "Hello $USER @ $(hostname) $(uname -r) Uptime is $(uptime)"
	# cowsay -f tux "Hello $USER. Server time and uptime is $(uptime)"
        # cowsay -f tux "Hello $USER @ $(uname -s -r -i)"
fi

# simplify bash
alias cd..='cd ..'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias l='ls --group-directories-first --color=auto -F'
alias ls='ls --group-directories-first --color=auto -F'
alias la='ls -A --group-directories-first --color=auto -F'
alias ll='ls -l --group-directories-first --color=auto -F'
alias lla='ls -la --group-directories-first --color=auto -F'
alias egrep='egrep --color'
alias fgrep='fgrep --color'
alias grep='grep --color=tty -d skip'
alias dusi='du -s --si * | sort -h'
