sudo apt install -y
sudo apt install freeradius freeradius-mysql freeradius-utils -y
sudo apt install mariadb-server mariadb-client -y
sudo mysql -u root -p : password=root

"""
# Create a new database named freeradiusdb
CREATE DATABASE freeradiusdb;

# Create a user named freeradiususer and allow to access freeradiusdb
GRANT ALL ON freeradiusdb.* TO freeradiususer@localhost IDENTIFIED BY "RadiusDatabasePassword";

# Reload tables privileges
FLUSH PRIVILEGES;

"""

# Stop freeradius service
sudo systemctl stop freeradius

# Verify freeradius status
sudo systemctl status freeradius

sudo su
mysql -u root -p freeradiusdb < /etc/freeradius/3.0/mods-config/sql/main/mysql/schema.sql

mysqlshow freeradiusdb

vim /etc/freeradius/3.0/mods-available/sql 
"""
sql {
			dialect = "mysql"
			
			#driver = "rlm_sql_null"
			driver = "rlm_sql_${dialect}"
"""
### Lot of editing in file

# Activate MariaDB/MySQL module FreeRADIUS
sudo ln -s /etc/freeradius/3.0/mods-available/sql /etc/freeradius/3.0/mods-enabled/

# Change ownership to freerad
sudo chown -h freerad.freerad /etc/freeradius/3.0/mods-enabled/sql

######################## Install Daloradius
# Change working directory
cd /var/www/html/

# Download the daloRADIUS source code
wget https://github.com/lirantal/daloradius/archive/refs/tags/1.3.tar.gz


# Extract daloRADIUS source code
tar -xf 1.3.tar.gz

# Verify extracted directory
ls

# Rename directory to `daloradius`
mv daloradius-1.3 daloradius

# Verify changed directory name to daloradius
ls

# import daloRADIUS database schema
mysql -u root -p freeradiusdb < /var/www/html/daloradius/contrib/db/fr2-mysql-daloradius-and-freeradius.sql

# verify database schema
mysqlshow freeradiusdb

cp /var/www/html/daloradius/library/daloradius.conf.php.sample /var/www/html/daloradius/library/daloradius.conf.php
"""
Lot of edit happened
"""

# Change ownership to www-data
sudo chown -R www-data:www-data /var/www/html/daloradius/

# Change permission to 0664
sudo chmod 0664 /var/www/html/daloradius/library/daloradius.conf.php

sudo systemctl restart freeradius

default user (administrator) and password (radius), 