# my aliases
alias refresh='source ~/.bashrc'
alias rc='subl ~/.bashrc'

alias env='workon env'

# emr
alias backdir='cd ~/savannah/emr-backend'
alias authdir='cd ~/savannah/emr-backend/bin'
alias backend='env; backdir'
alias frontend='cd ~/savannah/emr-frontend'
alias backendrun='backend; ./manage.py runserver'
alias frontendrun='frontend; grunt connect'

# edi
alias edidir='cd ~/savannah/slade360'
alias edienv='workon slade'
alias edi='edidir; edienv;'
alias edirun='edi; ./manage.py runserver 8080'
alias ediauth='workon auth; authserver_manage runserver 9000'
alias providerdir='cd ~/savannah/sil-provider-portal'
alias providerrun='providerdir; grunt connect:dev'

# github
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

