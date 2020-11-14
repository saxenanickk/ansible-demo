server {
        listen 443 ssl http2 default_server;
        listen [::]:443 ssl http2 default_server;

        ssl_certificate /etc/ssl/certs/certificate.cert;
        ssl_certificate_key /etc/ssl/private/certificate.key;

        ssl_protocols TLSv1.2;
        
        root /home/vagrant/abc.com;

        server_name abc.com www.abc.com;

        location / {
                try_files $uri $uri/ =404;
        }
}

server {
       listen         80;
       listen    [::]:80;
       server_name    127.0.0.1 abc.com;
       return         301 https://$server_name$request_uri;
}