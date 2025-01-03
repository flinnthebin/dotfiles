#!/usr/bin/env sh

#   __
#  / _|
# | |_
# |  _|
# |_|
#
# fuzzy file finder

file=$(find / -type f 2>/dev/null | fzf --preview '
  mime=$(file --mime-type -b {})
  case "$mime" in
    text/*) bat --style=plain --color=always {} ;;
    *) file {} ;;
  esac
')

[ -n "$file" ] && vim "$file"
