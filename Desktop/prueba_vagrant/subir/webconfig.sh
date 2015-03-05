     sudo apt-get update
     sudo apt-get install -y apache2
     sudo apt-get install -y php5 php5-gd php5-mysql libssh2-php
     sudo apt-get install -y libapache2-mod-php5
     cd /var/www/html
     sudo wget http://wordpress.org/latest.tar.gz
     sudo tar xzvf latest.tar.gz
     cd wordpress
     sudo cp wp-config-sample.php wp-config.php
     sudo sed -i "/DB_HOST/s/'[^']*'/'10.33.33.11'/2" wp-config.php
     sudo sed -i "/DB_NAME/s/'[^']*'/'wordpress'/2" wp-config.php
     sudo sed -i "/DB_USER/s/'[^']*'/'andrea'/2" wp-config.php
     sudo sed -i "/DB_PASSWORD/s/'[^']*'/'andrea'/2" wp-config.php
