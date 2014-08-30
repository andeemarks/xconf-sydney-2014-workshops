echo "sudo mkdir /opt/logstash/ssl/"
sudo mkdir /opt/logstash/ssl/

echo "sudo openssl req -x509 -batch -nodes -days 3650 -newkey rsa:2048 -keyout 
/opt/logstash/ssl/logstash-forwarder.key -out /opt/logstash/ssl/logstash-forwarder.crt"
sudo openssl req -x509 -batch -nodes -days 3650 -newkey rsa:2048 -keyout /opt/logstash/ssl/logstash-forwarder.key -out /opt/logstash/ssl/logstash-forwarder.crt

echo "sudo vim /opt/logstash/logstash-server.conf"
sudo vim /opt/logstash/logstash-server.conf

echo "cp /opt/logstash/ssl/logstash-forwarder.crt /vagrant/"
cp /opt/logstash/ssl/logstash-forwarder.crt /vagrant/

