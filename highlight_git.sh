# indicates which git branch one is currently working on
# e.g musemby@server:~/scripts/ (fix-weird-bug)$ (currently on the fix-weird-bug branch)
# paste this into the .bashrc file and source it
function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

GREEN="\[\033[0;32m\]"
NO_COLOR="\[\033[0m\]"
LIGHT_CYAN="\[\033[0;96m\]"

PS1="$GREEN\u@\h$NO_COLOR:\w$LIGHT_CYAN\$(parse_git_branch)$NO_COLOR\$ "
