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
