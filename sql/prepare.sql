DROP USER IF EXISTS apiatlashub_user@'localhost';
DROP USER IF EXISTS apiatlashub_user@'%';
DROP DATABASE IF EXISTS apiatlashub_db;

CREATE DATABASE apiatlashub_db;
CREATE USER apiatlashub_user@'localhost' IDENTIFIED BY 'ApiAtlasHub2024';
CREATE USER apiatlashub_user@'%' IDENTIFIED BY 'ApiAtlasHub2024';

GRANT ALL PRIVILEGES ON apiatlashub_db.* TO apiatlashub_user@'localhost';
GRANT ALL PRIVILEGES ON apiatlashub_db.* TO apiatlashub_user@'%';
FLUSH PRIVILEGES;