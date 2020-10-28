CREATE DATABASE wordpress;

CREATE USER 'bshang'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'bshang'@'localhost';
FLUSH PRIVILEGES;
