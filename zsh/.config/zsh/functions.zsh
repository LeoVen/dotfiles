zsh_stats() {
  fc -l 2 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep --color=auto -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n20
}

jsondiff() {
  local tmp1=$(mktemp).json
  local tmp2=$(mktemp).json
  trap "rm -f '$tmp1' '$tmp2'" EXIT
  jq -S . "$1" > "$tmp1"
  jq -S . "$2" > "$tmp2"
  nvim -d "$tmp1" "$tmp2"
}

urlencode() {
  python3 -c 'import urllib.parse, sys; print(urllib.parse.quote(sys.stdin.read().strip()))' <<< "$1"
}

cheat() {
  if [ -z "$1" ]; then
    echo "Usage: cheat <command>"
    return 1
  fi

  _glow() {
    glow -w 0 -p "$@"
  }

  local file="${XDG_CONFIG_HOME:-$HOME/.config}/cheats/${1}.md"

  # 1. Local custom sheet
  if [ -f "$file" ]; then
    _glow "$file"
    return 0
  fi

  echo "$file not found"
}
