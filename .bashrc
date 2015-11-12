# this can be saved where you need it for lots of users (ex: /etc/bash.bashrc )

# how do you moo && must have cowsay installed
if [ -x /usr/games/cowsay ]; then
	cowsay -f tux "Hello $USER @ $(hostname) $(uname -r) Uptime is $(uptime)"
	# cowsay -f tux "Hello $USER. Server time and uptime is $(uptime)"
        # cowsay -f tux "Hello $USER @ $(uname -s -r -i)"
fi

# simplify bash
alias cd..='cd ..'
alias cp='cp -i'
alias df='df -h'
alias free='free -m'
alias l='ls --group-directories-first --color=auto -F'
alias ls='ls --group-directories-first --color=auto -F'
alias la='ls -A --group-directories-first --color=auto -F'
alias ll='ls -l --group-directories-first --color=auto -F'
alias lla='ls -la --group-directories-first --color=auto -F'
alias egrep='egrep --color'
alias fgrep='fgrep --color'
alias grep='grep --color'
alias dusi='du -s --si * | sort -h'
