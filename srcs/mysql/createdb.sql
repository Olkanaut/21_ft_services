FLUSH PRIVILEGES;
CREATE DATABASE wordpress;
CREATE USER 'bshang'@'%' IDENTIFIED BY 'mypass';
GRANT ALL PRIVILEGES ON wordpress.* TO 'bshang'@'%';
FLUSH PRIVILEGES;

-- CREATE DATABASE wordpress;
-- GRANT ALL PRIVILEGES ON *.* TO 'bshang'@'localhost' IDENTIFIED BY 'mypass' WITH GRANT OPTION;
-- FLUSH PRIVILEGES;

-- CREATE DATABASE wordpress;

-- CREATE USER 'bshang'@'localhost' IDENTIFIED BY 'mypass';
-- GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'localhost';
-- FLUSH PRIVILEGES;
