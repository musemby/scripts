wget http://ftp.postgresql.org/pub/source/v{1}/postgresql-{1}.tar.gz /tmp/
tar zxvf postgresql-{1}.tar.gz
cd /tmp/postgresql-{1}
./configure --without-readline --without-zlib
make
su
make install
