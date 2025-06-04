# Enable Powerlevel10k instant prompt (must stay at the top)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zsh config directory
export ZSH="$HOME/.zsh"
export ZINIT_HOME="$HOME/.local/share/zinit/zinit.git"

# Pywal colors (if available)
[ -f "$HOME/.cache/wal/colors.zsh" ] && source "$HOME/.cache/wal/colors.zsh"

# Initialize Zinit plugin manager
source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light romkatv/powerlevel10k

# Load custom shell modules
for file in $ZSH/*.zsh; do
  source "$file"
done

# Powerlevel10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Set terminal title
precmd() {
  print -Pn "\e]0;%n@%m: %~\a"
}

# Keybinds and completions
bindkey -e
autoload -Uz compinit && compinit

# Broot (zsh launcher)
source /home/vaish/.config/broot/launcher/bash/br

# If not running interactively, don't do anything (zsh-compatible)
[[ -o interactive ]] || return

# Aliases (work the same in zsh)
alias grep='grep --color=auto'

# Git safety alias (works in zsh)
alias git='[[ $PWD == "/" ]] && echo "Refusing to run git in /" || command git'

# rm safety alias (works in zsh)
alias rm='[[ $PWD == "/" ]] && echo "🚫 Refusing to delete root directory!" || command rm'

# PATH modifications (same in zsh)
export PATH=~/.npm-global/bin:/usr/local/bin:/usr/bin:$PATH

# Share history between all sessions
setopt SHARE_HISTORY        # Write & import history on every command
setopt INC_APPEND_HISTORY   # Append history incrementally (instead of on exit)
setopt EXTENDED_HISTORY     # Save timestamps
HISTFILE=~/.zsh_history     # History file location
HISTSIZE=100000            # Max history in memory
SAVEHIST=100000            # Max history in file

















# Finalize Powerlevel10k (must be at the end)
(( ! ${+functions[p10k]} )) || p10k finalize
