DROP USER IF EXISTS 'slave_user'@'%';
CREATE USER 'slave_user'@'%' IDENTIFIED  BY 'password' REQUIRE SSL;
GRANT REPLICATION SLAVE ON *.* TO 'slave_user'@'%';
-- FLUSH PRIVILEGES;

-- Create the admin user 
DROP USER IF EXISTS 'app_admin'@'localhost';
DROP USER IF EXISTS 'app_admin'@'%';
CREATE USER 'app_admin'@'localhost' IDENTIFIED BY 'strong_password_here';
CREATE USER 'app_admin'@'%'        IDENTIFIED BY 'strong_password_here';

-- Give full privileges on the *database only*
GRANT ALL PRIVILEGES ON app.* TO 'app_admin'@'localhost';
GRANT ALL PRIVILEGES ON app.* TO 'app_admin'@'%';

USE app;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

