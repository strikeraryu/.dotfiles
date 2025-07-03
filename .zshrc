if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Initial Exports
export HOMEBREW_NO_AUTO_UPDATE=true
export ZSH="$HOME/.oh-my-zsh"
export ENV_HOME="$HOME/.env_config"
export SCRIPTS="$ENV_HOME/.scripts"
export MIND_PALACE="$HOME/mind-palace"
export WORK_STATION="$HOME/work-station"
export TLDR_AUTO_UPDATE_DISABLED=true
export EDITOR="vi"

source $HOME/.secrets


# Path Configuration
export PATH=$HOME/bin:$PATH
export PATH="$PATH:/opt/homebrew/bin"
export PATH="$PATH:$SCRIPTS"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="/bin/zsh:$PATH"
export PATH="/Users/striker/.local/bin:$PATH"



# Startup screen
neofetch  --ascii ~/striker_logo.txt --ascii-color 1 1 1 1


# ZSH THEME
ZSH_THEME="powerlevel10k/powerlevel10k"


# Plugins
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  aws
  dirhistory
  fzf-tab
)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src


# Loads
source $ZSH/oh-my-zsh.sh

intel() {
  arch -x86_64 $@
}


# ZSH Plugins Config
bindkey '^ ' autosuggest-accept

## disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
## set descriptions format to enable group support
## NOTE: don't use escape sequences here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
## set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
## force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
## preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
## switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'


# Link bar setup
source "$SCRIPTS/.link_bar.sh"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# aliases
alias staged-files="git diff --name-only --staged"
# alias vi='nvim'
alias mycmds='curl -Ls "https://gist.githubusercontent.com/strikeraryu/4f4e73cd30e627a9a8dd923feed44127/raw?q=$(date +%s)"'
alias mycnfgs='curl -Ls "https://gist.githubusercontent.com/strikeraryu/816d1bced2dccdfc125f7d237fdbd62e/raw?q=$(date +%s)"'
alias ls='eza --icons=always'
alias ss='tty-clock -s -t -c -S -n -b -S'
alias mp='cd $MIND_PALACE'
alias ws='cd $WORK_STATION'
alias vi='nvim'


# fzf + bat setup for preview
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)
export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"


# Zoxide setup
eval "$(zoxide init --cmd cd zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn


## Clipboard setting
function cget() {
  local index="${1:-1}"
  curl -s -H "X-Clipboard-Password: $CLIPBOARD_SERVER_PASSWORD" "$CLIPBOARD_SERVER_HOST/get/$index" | pbcopy
  echo "Copied clipboard entry #$index to system clipboard"
}

alias cshare='curl -X POST "$CLIPBOARD_SERVER_HOST/share" -H "X-Clipboard-Password: $CLIPBOARD_SERVER_PASSWORD" -d "data=$(pbpaste)"'
alias cpreview='curl -H "X-Clipboard-Password: $CLIPBOARD_SERVER_PASSWORD" "$CLIPBOARD_SERVER_HOST/preview"'
