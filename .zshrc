# ==============================================================================
# 1. CORE ENVIROMENT & HISTORY SETUP
# ==============================================================================
export LANG="en_US.UTF-8"
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000

# Share history across tabs instantly, ignore duplicate commands
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt AUTO_CD             # Type a directory name to 'cd' into it directly

# ==============================================================================
# 2. ADVANCED COMPLETIONS (Native Zsh)
# ==============================================================================
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case-insensitive matching
zstyle ':completion:*' menu select                       # Visual tab-selection menu

# ==============================================================================
# 3. FAST & BLINDING PROMPT (Starship)
# ==============================================================================
# In 2026, Starship is the gold standard for blazing-fast, async prompts.
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
else
    # Minimal fallback prompt if starship is not installed
    PROMPT='%F{cyan}%~%f %F{green}→%f '
fi

# ==============================================================================
# 4. ESSENTIAL PLUGINS (Vanilla Loading / No Heavy Frameworks)
# ==============================================================================
# Clone these directly or use a lightweight manager like Zap or Zinit
PLUGIN_DIR="$HOME/.local/share/zsh-plugins"
mkdir -p "$PLUGIN_DIR"

# Helper to automatically fetch plugins if they don't exist
function load_plugin() {
  local repo_path="$1"
  local plugin_name=$(basename "$repo_path")
  local target_dir="$PLUGIN_DIR/$plugin_name"
  local repo_url="https://github.com/$repo_path.git"

  if [ ! -d "$target_dir" ]; then
      echo "Installing $plugin_name..."
      git clone --depth=1 "$repo_url" "$target_dir"
  fi

  if [ -f "$target_dir/$plugin_name.zsh" ]; then
      source "$target_dir/$plugin_name.zsh"
  elif [ -f "$target_dir/$plugin_name.plugin.zsh" ]; then
      source "$target_dir/$plugin_name.plugin.zsh"
  fi
}

# Load pure utility plugins (Syntax Highlighting MUST be loaded last)
load_plugin "zsh-users/zsh-autosuggestions"
load_plugin "zsh-users/zsh-syntax-highlighting"

# ==============================================================================
# 5. PRODUCTIVITY ALIASES
# ==============================================================================
alias ls="ls --color=auto"
alias ll="ls -lah"
alias l="ls -l"
alias v="nvim"

alias g="git"
alias grep='rg --color=auto'
alias diff='diff --color=auto'
alias df='df -h'
alias smycshrc='source ${HOME}/.zshrc'
alias mycshrc='nvim ${HOME}/.zshrc'
alias rmf='rm -rvf'
alias h='history'
alias c='clear'

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/hoangnguyen/.lmstudio/bin"
# End of LM Studio CLI section

# Added by cua-driver-rs installer — see https://github.com/trycua/cua
export PATH="/Users/hoangnguyen/.local/bin:$PATH"
