echo "sudo vim /opt/kibana/kibana-3.1.0/config.js"
sudo vim /opt/kibana/kibana-3.1.0/config.js

echo "sudo mkdir /var/www/kibana3"
sudo mkdir /var/www/kibana3

echo "sudo cp -R /opt/kibana/kibana-3.1.0/* /var/www/kibana3"
sudo cp -R /opt/kibana/kibana-3.1.0/* /var/www/kibana3

echo "sudo vim kibana3.conf"
sudo vim kibana3.conf

echo "sudo cp kibana3.conf /etc/httpd/conf.d/ "
sudo cp kibana3.conf /etc/httpd/conf.d/ 

