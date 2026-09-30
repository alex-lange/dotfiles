for directory in "$HOME/.local/bin" "$HOME/bin"; do
  case ":$PATH:" in
    *":$directory:"*) ;;
    *) PATH="$directory:$PATH" ;;
  esac
done
export PATH

for env_file in \
  "$HOME/.cargo/env" \
  "$HOME/.deno/env" \
  "$HOME/.local/bin/env"
do
  if [ -r "$env_file" ]; then
    . "$env_file"
  fi
done
unset directory env_file
