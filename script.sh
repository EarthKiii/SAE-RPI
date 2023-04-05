sudo apt update
sudo apt upgrade -y
sudo apt install -y tree apache2 openssl php php-mbstring git-all

git clone https://github.com/EarthKiii/SAE-RPI.git


# Installation of the Apache2 Config
sudo source /etc/apache2/envvars
sudo mv -f SAE-RPI/apache2/apache2.conf /etc/apache2/apache2.conf
sudo mv -f SAE-RPI/apache2/envvars /etc/apache2/envvars
sudo mv -f SAE-RPI/apache2/ports.conf /etc/apache2/ports.conf

sudo mv -f SAE-RPI/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf
sudo mv -f SAE-RPI/apache2/sites-available/default-ssl.conf /etc/apache2/sites-available/default-ssl.conf
sudo mv -f SAE-RPI/apache2/sites-available/www.tek-it-izy.conf /etc/apache2/sites-available/www.tek-it-izy.conf
sudo mv -f SAE-RPI/apache2/sites-available/intranet.tek-it-izy.conf /etc/apache2/sites-available/intranet.tek-it-izy.conf

sudo mkdir /etc/apache2/certs
sudo mv -f SAE-RPI/apache2/certs/apache.crt /etc/apache2/certs/apache.crt

# Installation of the Default Website
sudo mv -f SAE-RPI/html/* /var/www/html/
sudo chmod -R 755 /var/www/html/

sudo mkdir -p /var/www/html/users_pages/bob
sudo useradd -d /var/www/html/users_pages/bob bob
(echo bob; echo bob) | sudo passwd bob
sudo chown bob:bob /var/www/html/users_pages/bob
sudo chmod -R 755 /var/www/html/users_pages/bob

sudo mkdir /var/www/html/users_pages/alice
sudo useradd -d /var/www/html/users_pages/alice alice
(echo alice; echo alice) | sudo passwd alice 
sudo chown alice:alice /var/www/html/users_pages/alice
sudo chmod -R 755 /var/www/html/users_pages/alice



# Installation of the Public Website
sudo mkdir -p /srv/www/public/error_pages
sudo mkdir /srv/www/public/folder
sudo mv -f SAE-RPI/srv/www/public/* /srv/www/public/
sudo mv -f SAE-RPI/srv/www/public/error_pages/* /srv/www/public/error_pages/

sudo chmod -R 755 /srv/www/public/
sudo chmod 700 /srv/www/public/chmod700file.txt


# Installation of the Intranet Website
sudo mkdir -p /srv/intranet/error_pages
sudo mkdir /srv/intranet/folder
sudo mv -f SAE-RPI/srv/intranet/* /srv/intranet/
sudo mv -f SAE-RPI/srv/intranet/error_pages/* /srv/intranet/error_pages/

sudo chmod -R 755 /srv/intranet/
sudo chmod 700 /srv/intranet/chmod700file.txt


sudo mkdir /srv/private/
sudo mv -f SAE-RPI/srv/private/.htpasswd /srv/private/.htpasswd


# Apache2 Configuration
sudo a2enmod userdir
sudo a2ensite www.tek-it-izy
sudo a2ensite intranet.tek-it-izy
sudo a2ensite default

sudo systemctl restart apache2

echo "Unless there was an error, everything is up and running !"