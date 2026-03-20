#!/bin/bash

set -x

custom_bashrc() {
cat <<'EOF'
export LS_OPTIONS="--color=auto"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -la'
alias l='ls $LS_OPTIONS -lA'

# prompt SOLO per shell interattive
if [[ $- == *i* ]]; then
  if [ "$(id -u)" -eq 0 ]; then
    PS1="\[\e[35m\][\[\e[31m\]\u\[\e[36m\]@\[\e[32m\]\h\[\e[90m\] \w\[\e[35m\]]\[\e[0m\]# "
  else
    PS1="\[\e[35m\][\[\e[33m\]\u\[\e[36m\]@\[\e[32m\]\h\[\e[90m\] \w\[\e[35m\]]\[\e[0m\]$ "
  fi
  export PS1
fi
EOF
}

setup_bashrc() {
  for home in /root /home/*; do
    [ -d "$home" ] || continue
    bashrc="$home/.bashrc"

    # crea se manca
    [ -f "$bashrc" ] || touch "$bashrc"

    # evita duplicazioni
    grep -q '### CUSTOM BASHRC ###' "$bashrc" && continue

    {
      echo ''
      echo '### CUSTOM BASHRC ###'
      custom_bashrc
    } >> "$bashrc"
  done
}


_dirs
_main

setup_bashrc

# print cmd that will be executed
echo "Starting: $*" >&2

# launch CMD
exec "$@"

