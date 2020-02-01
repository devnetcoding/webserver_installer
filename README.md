# Webserver Installer

Simple Script to install Apache2 with PHP7.4 and MariaDB with phpMyAdmin on your Debian based System

For secure your database-server run:

```bash
mysql_secure_installation
```

and follow the instructions.

You have to create MariaDB user manuel:

```bash
mysql -u root
```

for users only access one database:

```SQL
CREATE USER '<username>'@'localhost' IDENTIFIED BY '<password>';
CREATE DATABASE <dbname>;
GRANT ALL PRIVILEGES ON <dbname> . * TO '<username>'@'localhost';
FLUSH PRIVILEGES;
```

for users access all databases:

```SQL
CREATE USER '<username>'@'localhost' IDENTIFIED BY '<password>';
GRANT ALL PRIVILEGES ON * . * TO '<username>'@'localhost';
FLUSH PRIVILEGES;
```
