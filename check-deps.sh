function isinstalled {
  if dnf list installed "$@" >/dev/null 2>&1; then
    true
  else
    false
  fi
}

if isinstalled $1; then exit 0; else exit 1; fi
