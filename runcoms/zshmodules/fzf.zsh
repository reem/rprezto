# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */usr/local/opt/fzf/man* && -d "/usr/local/opt/fzf/man" ]]; then
  export MANPATH="$MANPATH:/usr/local/opt/fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/usr/local/opt/fzf/shell/key-bindings.zsh"

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
