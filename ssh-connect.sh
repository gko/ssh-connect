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
  history 1 | awk '$2=="ssh" && $3!="" { $1=""; print }' | awk '$1=$1' | tail -r | uniq
}

ssh-connect() {
  local hist=$(ssh-history | tr '\n' '|')
  res=$(listbox -t "Connect:" -o "$hist" | tee /dev/tty | tail -n 1)
  echo && echo $res >> "$HISTFILE"
  eval $res
}
