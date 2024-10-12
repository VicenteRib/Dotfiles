#auto-completion
autoload -U compinit && compinit

#history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
#aliases
alias ls='ls --color=auto'

#Prompt
PS1='[%n@%m] [%F{cyan}%~%f] >> '

# functions

gen_html() {
	pandoc -f markdown -t html $1 | cat _header.html - _footer.html > "$(echo "$1" | sed 's/.md/.html/')"
}

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64


eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
