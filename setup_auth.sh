psql -U postgres -c 'DROP DATABASE IF EXISTS wot;'

export WORKON_HOME=~/Envs
source /usr/local/bin/virtualenvwrapper.sh

rmvirtualenv auth
mkvirtualenv -p /usr/bin/python3.5 auth
workon auth
pip install sil-auth-server
psql -U postgres -c 'create database wot;'
psql -U postgres -c 'grant all on database wot to app;'
authserver_manage migrate

authserver_manage loaddata ~/Envs/auth/lib/python3.5/site-packages/authserver/data/default_data.json
