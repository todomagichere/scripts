#!/bin/bash 

CURRENTPHP=$(ls /etc/apache2/mods-enabled | grep php.*conf | sed 's/\.conf//g') 
if [ -z "$CURRENTPHP" ]; then     
	sudo a2enmod php$1; 
	sudo systemctl restart apache2; 
	exit 
fi 

sudo a2dismod $CURRENTPHP; 
sudo a2enmod php$1; 
sudo service apache2 restart; 
sudo update-alternatives --set php /usr/bin/php$1; 
echo "-------------------------------------------------------------";
php -v 
