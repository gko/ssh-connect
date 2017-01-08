#!/bin/bash

if [ -n "$ZSH_VERSION" ]; then
  src=$(dirname "${(%):-%N}")/listbox/listbox.sh
elif [ -n "$BASH_VERSION" ]; then
  src=$(dirname "${BASH_SOURCE[0]}")/listbox/listbox.sh
fi

ssh-history() {
  cat "$HISTFILE" | grep -E "^ssh\s" | sed -e 's/\s*$//' | sort | uniq -c | sort -nr | sed -e "s/^\s*[0-9]*\s//"
}

ssh-connect() {
  local hist=$(ssh-history | tr '\n' '|')
  res=$(bash -c ". $src && listbox -t \"Connect:\" -o \"$hist\" | tee /dev/tty | tail -n 1")
  echo ""
  echo "$res" >> ~/.bash_history
  eval "$res"
}
