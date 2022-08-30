#!/bin/bash

if [ -n "$ZSH_VERSION" ]; then
  src=$(dirname "${(%):-%N}")/listbox/listbox.sh
elif [ -n "$BASH_VERSION" ]; then
  src=$(dirname "${BASH_SOURCE[0]}")/listbox/listbox.sh
else
  src=$(dirname "$0")/listbox/listbox.sh
fi

source "$src"

ssh-history() {
  cat $HISTFILE | grep -E "(^|;)ssh\s[0-9A-Za-z]" | sed -e 's/\s*$//' | sed -e 's/:\s[0-9]*:[0-9]*;//' | sort | uniq -c | sort -nr | sed -e 's/^\s*[0-9]*\s//'
}

ssh-connect() {
  local hist=$(ssh-history | tr '\n' '|')
  res=$(listbox -t "Connect:" -o "$hist" | tee /dev/tty | tail -n 1)
  echo ""
  echo "$res" >> "$HISTFILE"
  eval "$res"
}
