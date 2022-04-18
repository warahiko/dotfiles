# zi --------------------
if [[ ! -f $HOME/.zi/bin/zi.zsh ]]; then
  print -P "%F{33}▓▒░ %F{160}Installing (%F{33}z-shell/zi%F{160})…%f"
  command mkdir -p "$HOME/.zi" && command chmod g-rwX "$HOME/.zi"
  command git clone -q --depth=1 --branch "main" https://github.com/z-shell/zi "$HOME/.zi/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zi/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi
# examples here -> https://z.digitalclouds.dev/docs/ecosystem/annexes
zicompinit # <- https://z.digitalclouds.dev/docs/guides/commands

zi light zsh-users/zsh-syntax-highlighting
zi light zsh-users/zsh-completions
zi light zsh-users/zsh-autosuggestions

# zsh settings --------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt append_history
setopt inc_append_history

# Set theme via `starship`
eval "$(starship init zsh)"

# alias --------------------
## basic
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'

## git
alias ga='git add'
alias gd='git diff'
alias gs='git status'
alias gp='git push'
alias gb='git branch'
alias gsw='git switch'
alias gco='git checkout'
alias gf='git fetch -p'
alias gc='git commit -F- <<EOM'
alias gm='git merge'
alias gst='git stash'
alias gst-file='git stash push --'
alias gt='git tree'

## pipe
alias -g C='| pbcopy'
alias -g G='| grep --color=auto'
alias -g H='| head'
alias -g T='| tail'

# ls
if which exa >/dev/null 2>&1; then
  alias ls='exa'
  alias l='exa -F'
  alias la='exa -a'
  alias ll='exa -la'
else
  alias ls='ls'
  alias l='ls -CF'
  alias la='ls -A'
  alias ll='ls -lA'
fi

# cat
if which bat >/dev/null 2>&1; then
  alias cat='bat'
fi

