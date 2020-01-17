#!/bin/bash

set -e

if [ -f /etc/configured ]; then
        echo 'already configured'
else
      #code that need to run only one time ....
      #check if container linked to database and pass the info to correct configuration file
       #if database present 
        if [ -n "$DB_NAME" ] ; then
               
          
               #configuration file that need to be modified 
               # /var/www/mywebsql/config/auth.php
               
               # need to be done 
               # define('AUTH_TYPE', 'LOGIN'); ==> define('AUTH_TYPE', 'NONE');
               # define('AUTH_SERVER', 'localhost|mysql5'); ==> 'db|type_database'
               # where type_database can be : mysqli, sqlite, pgsql
               # define('AUTH_LOGIN', 'test'); ==> Real login ID
               # define('AUTH_PASSWORD', 'test'); ===>Real password
               
               # example
               # define('AUTH_TYPE', 'NONE');
               # define('AUTH_SERVER', 'db|pgsql');
               # define('AUTH_LOGIN', 'postgres');
               # define('AUTH_PASSWORD', 'mysecretpassword');
                
               # code ...
               sed -i.back "s#define('AUTH_TYPE'\, 'LOGIN')\;#define('AUTH_TYPE'\, 'BASIC')\;#"  /var/www/mywebsql/config/auth.php
               #need to allow different database type
               if [ -n "$DB_ENV_MYSQL_ROOT_PASSWORD" ]; then
                sed -i.back "s#define('AUTH_SERVER'\, 'localhost|mysql5')\;#define('AUTH_SERVER'\, 'db:3306|mysqli')\;#"  /var/www/mywebsql/config/auth.php       
                sed -i.back "s#define('AUTH_LOGIN'\, 'test')\;#define('AUTH_LOGIN'\, 'root')\;#"  /var/www/mywebsql/config/auth.php
                sed -i.back "s#define('AUTH_PASSWORD'\, 'test')\;#define('AUTH_PASSWORD'\, '`echo $DB_ENV_MYSQL_ROOT_PASSWORD`')\;#"  /var/www/mywebsql/config/auth.php
               fi
               # for postgres
               if [ -n "$DB_ENV_POSTGRES_PASSWORD" ]; then
                sed -i.back "s#define('AUTH_SERVER'\, 'localhost|mysql5')\;#define('AUTH_SERVER'\, 'db:5432|pgsql')\;#"  /var/www/mywebsql/config/auth.php       
                sed -i.back "s#define('AUTH_LOGIN'\, 'test')\;#define('AUTH_LOGIN'\, 'postgres')\;#"  /var/www/mywebsql/config/auth.php
                sed -i.back "s#define('AUTH_PASSWORD'\, 'test')\;#define('AUTH_PASSWORD'\, '`echo $DB_ENV_POSTGRES_PASSWORD`')\;#"  /var/www/mywebsql/config/auth.php
               fi
               # etc
        fi
        
        #needed for fix problem with ubuntu and cron
        update-locale 
        date > /etc/configured
fi
