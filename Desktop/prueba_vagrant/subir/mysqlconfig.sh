     sudo apt-get update
     echo "instalacion "
     #echo "mysql-server mysql-server/root_password password root" | sudo debconf-set-selections
     #echo "mysql-server mysql-server/root_password_again password root" | sudo debconf-set-selections
     #sudo apt-get -y install mysql-server
     #mysql_secure_installation
     sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
     sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
     sudo apt-get -y install mysql-server

     echo "mysql-server instalado"

     #For some reason important to restart - otherwise possible errors
     #mysql -uroot -p -e 'USE mysql; UPDATE `user` SET `Host`="%" WHERE `User`="root" AND `Host`="localhost"; DELETE FROM `user` WHERE `Host` != "%" AND `User`="root"; FLUSH PRIVILEGES;'

      mysql -u root --password=root -e "
     CREATE USER 'andrea'@'localhost' IDENTIFIED BY 'andrea';
     GRANT ALL PRIVILEGES ON *.* TO 'andrea'@'localhost' WITH GRANT OPTION;
     CREATE USER 'andrea'@'%' IDENTIFIED BY 'andrea';
     GRANT ALL PRIVILEGES ON *.* TO 'andrea'@'%' WITH GRANT OPTION;
     CREATE DATABASE wordpress;"
     #cd /etc/mysql
     sed -i 's/127\.0\.0\.1/0\.0\.0\.0/g' /etc/mysql/my.cnf
     sudo service mysql restart
