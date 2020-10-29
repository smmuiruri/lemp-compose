server {

        
        server_name localhost;
 
        error_log "/opt/nginx/logs/myapp-error.log";
        access_log  "/opt/nginx/logs/myapp-access.log";
 
        root /var/www/php;
        index index.php index.html;
 
        location / {
 
                try_files $uri $uri/ /index.php?$args;
        }
 
        location ~ \.php$ {
 
                include fastcgi.conf;
                fastcgi_intercept_errors on;
                fastcgi_pass phpfpm:9000;
        }
 
        location ~* \.(js|css|png|jpg|jpeg|gif|ico)$ {
                expires max;
                log_not_found off;
        }
}
