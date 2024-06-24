#update repos and installed packages
apt-get update
apt-get upgrade

#install node and npm
apt-get install -y nodejs
apt-get install -y npm

#install apache
apt-get install -y apache2

#create apache virual host
cat <<-VHCONFIG > /etc/apache2/sites-available/ocsitest.conf
<VirtualHost *:80>
   ServerAdmin webmaster@localhost
   DocumentRoot /var/www/html/ocsi_test_frontend/dist
   Alias /backend /var/www/html/ocsi_test_backend/public

   <Directory /var/www/html/ocsi_test_backend/public>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
   </Directory>

   ErrorLog ${APACHE_LOG_DIR}/error.log
   CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
VHCONFIG

#disable default host and enable new virtual host
a2dissite 000-default.conf
a2ensite ocsitest

#enable modrewrite for laravel urls
a2enmod rewrite
service apache2 restart
apachectl -t -D DUMP_MODULES | grep rewrite

#install PHP 8.3 and dependencies
apt install curl gpg gnupg2 software-properties-common ca-certificates apt-transport-https lsb-release -y
add-apt-repository ppa:ondrej/php
apt update -uy
apt -y install php8.3
#enable php xml module
apt -y install php8.3-xml
phpenmod -s cli php8.3-xml
#enable php curl module
apt -y install php8.3-curl
phpenmod -s cli php8.3-curl
#enable mb-string module
apt -y install php8.3-mbstring
phpenmod -s cli php8.3-mbstring
#enable php pgsql module
apt -y install php8.3-pgsql
phpenmod -s cli php8.3-pgsql

service apache2 restart


#install postresql 16.3 (latest)
sh -c 'echo "deb https://apt.PostgreSQL.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.PostgreSQL.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
apt update
apt install postgresql-16 -y

#create local db user and database
sudo -u postgres psql -c "CREATE USER ocsiuser WITH PASSWORD '1cY&1!2oS2EaK53E';"
sudo -u postgres createdb -O ocsiuser ocsitest

#install composer
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
(cd /var/www/html/ocsi_test_backend && composer install)
(cd /var/www/html/ocsi_test_backend && php artisan migrate --seed)


#run npm install in the frontend
(cd /var/www/html/ocsi_test_frontend && npm install)


#update nodejs and node from package manager versions (vue-cli build errors)
sudo npm install -g n #add n globally to pull latest nodejs/npm
apt -y remove npm # remove default npm package
source ~/.bashrc #refresh terminal
sudo n lts 



