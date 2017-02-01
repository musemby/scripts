# shortcuts

alias env='workon env'
alias backdir='cd ~/savannah/emr-backend'
alias authdir='cd ~/savannah/emr-backend/bin'
alias backend='env; backdir'
alias frontend='cd ~/savannah/emr-frontend'
alias backendrun='backend; ./manage.py runserver'
alias frontendrun='frontend; grunt connect'

# git stuff
alias gs='git status'
alias gp='git pull'
alias ga='git add'
alias gaa='git add .'
alias gd='git diff'
alias gc='git commit'
alias gca='gaa; gc'
alias gcm='git checkout master'
alias auth='authdir; workon auth; python auth server'
alias valueset='workon valueset; cd ~/savannah/slade360-valuesets-server/; ./manage.py runserver 8050'

alias gbncss='gbn; grunt build_css'

alias gbn='grunt build_newer'

alias p8='ping 8.8.8.8'
