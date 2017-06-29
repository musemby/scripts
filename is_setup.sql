DROP DATABASE IF EXISTS integration_services;
CREATE DATABASE integration_services;
DROP USER IF EXISTS integration_app;
CREATE USER integration_app;
GRANT ALL PRIVILEGES ON DATABASE integration_services TO integration_app;
