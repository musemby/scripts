DROP DATABASE IF EXISTS edi;
CREATE DATABASE edi WITH OWNER postgres;
GRANT ALL ON DATABASE edi TO app;