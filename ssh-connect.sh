#!/bin/bash

source $(dirname "${BASH_SOURCE[0]}")/listbox/listbox.sh

ssh-history() {
  cat ~/.bash_history | grep -E "^ssh\s" | sed -e 's/[[:space:]]*$//' | sort -u
}

ssh-connect() {
  local hist=$(ssh-history | tr '\n' '|')
  listbox -t "Connect:" -o "$hist" -r res
  echo ""
  echo "$res" >> ~/.bash_history
  eval "$res"
}
