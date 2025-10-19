
CHANGE REPLICATION SOURCE TO 
  SOURCE_HOST='source_sql',
  SOURCE_USER='slave_user',
  SOURCE_PASSWORD='password',
  SOURCE_AUTO_POSITION=1,
  SOURCE_SSL=1,
  SOURCE_SSL_CA='/etc/mysql/certs/custom-ca.pem',
  SOURCE_SSL_CERT='/etc/mysql/certs/client-cert.pem',
  SOURCE_SSL_KEY='/etc/mysql/certs/client-key.pem';


START REPLICA;

-- Create the admin user 
DROP USER IF EXISTS 'app_admin'@'localhost';
DROP USER IF EXISTS 'app_admin'@'%';
CREATE USER 'app_admin'@'localhost' IDENTIFIED BY 'strong_password_here';
CREATE USER 'app_admin'@'%'        IDENTIFIED BY 'strong_password_here';

-- Give full privileges on the *database only*
GRANT ALL PRIVILEGES ON app.* TO 'app_admin'@'localhost';
GRANT ALL PRIVILEGES ON app.* TO 'app_admin'@'%';

USE app;