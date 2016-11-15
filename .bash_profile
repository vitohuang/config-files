# Git prompt
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

# Git completion
if [ -f ~/.bash/.git-completion.bash ]; then
	source ~/.bash/.git-completion.bash
fi

# Git in the PS1
export PS1="\u@\h \W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

# Colour for ls
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# bluAdmin build
export ANT_OPTS=-Xmx1g

# Vim as default editor
export EDITOR='vim'

# Alias
alias vi="vim"

# Mysql until
export PATH=/usr/local/mysql/bin:~/bin:/usr/local/bin:/usr/local/sbin:$PATH

# Nodejs start with rlwrap
alias node="env NODE_NO_READLINE=1 rlwrap node"

# Generic Colouriser
source "`brew --prefix`/etc/grc.bashrc"

# Save all the command line
export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; fi'

