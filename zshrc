config_dir=${${(%):-%N}:A:h}

source "$config_dir/zsh_profile"
source "$config_dir/aliases"
unset config_dir

command -v brew >/dev/null && eval "$(brew shellenv)"
command -v direnv >/dev/null && eval "$(direnv hook zsh)"
command -v mise >/dev/null && eval "$(mise activate zsh)"

for env_file in \
  "$HOME/.cargo/env" \
  "$HOME/.deno/env" \
  "$HOME/.local/bin/env" \
  "$HOME/.zshrc.local"
do
  if [[ -r "$env_file" ]]; then
    source "$env_file"
  fi
done
unset env_file
