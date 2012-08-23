#i ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -AlFrt'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# If PS1 is not set at all, this is not an interactive
# shell and we should not mess with it.
if [ -n "$PS1" ]; then
    # A temporary variable to contain our prompt command
    NEW_PROMPT_COMMAND='
        TRIMMED_PWD=${PWD: -40};
        TRIMMED_PWD=${TRIMMED_PWD:-$PWD}
    '

    # If there's an existing prompt command, let's not 
    # clobber it
    if [ -n "$PROMPT_COMMAND" ]; then
        PROMPT_COMMAND="$PROMPT_COMMAND;$NEW_PROMPT_COMMAND"
    else
        PROMPT_COMMAND="$NEW_PROMPT_COMMAND"
    fi

    # We're done with our temporary variable
    unset NEW_PROMPT_COMMAND

    # Set PS1 with our new variable
    # \h - hostname, \u - username
    PS1='\u@\h:$TRIMMED_PWD\$ '
fi

alias h=history
alias cdv='cd "/mnt/goliath/projlib/Current Projects/Advanced Coding, Encoders and Mobile/Viper"'
alias vi='vim' 
alias svndiff="svn diff | grep ^[+-]"
alias ssh='ssh -X'
export VIPER_IP=172.17.118.60
export JAVA_HOME=/usr/lib/jvm/java-6-sun/
alias pgrep='pgrep -fl'
alias ch='google-chrome &'
alias chj='google-chrome hudson-satv.tandbergtv.lan &'
alias export TODOTXT_DEFAULT_ACTION=ls
alias t='todo.sh -d ~/.todo/config'
