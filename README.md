# Webserver Installer

Simple Script to install Apache2 with PHP7.4 and MySQL with phpMyAdmin on your Debian based System

For secure your database run:

```bash
mysql_secure_installation
```

and follow the instructions

You have to create MySQL user manuel:

```bash
mysql -u root
```

```SQL
CREATE USER '<username>'@'localhost' IDENTIFIED BY '<password>';
CREATE DATABASE <dbname>;
GRANT ALL PRIVILEGES ON <dbname> . * TO '<username>'@'localhost';
FLUSH PRIVILEGES;
```

![alt text](https://devnetcoding.ga/data/files/logo_min.png "") by devnetcoding
