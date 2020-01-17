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
               sed -i.back "s#define\('AUTH_TYPE'\, 'LOGIN'\)\;#define\('AUTH_TYPE'\, 'NONE'\)\;#"  /var/www/mywebsql/config/auth.php
               #need to allow different database type
               # for mysql
                #sed -i.back "s#define\('AUTH_SERVER'\, 'localhost\|mysql5'\)\;#define\('AUTH_SERVER'\, 'db\|mysql5'\)\;#"  /var/www/mywebsql/config/auth.php       
                #sed -i.back ""  /var/www/mywebsql/config/auth.php
                #sed -i.back ""  /var/www/mywebsql/config/auth.php
               # for postgres
                #sed -i.back "s#define\('AUTH_SERVER'\, 'localhost\|mysql5'\)\;#define\('AUTH_SERVER'\, 'db\|pgsql'\)\;#"  /var/www/mywebsql/config/auth.php       
                #sed -i.back ""  /var/www/mywebsql/config/auth.php
                #sed -i.back ""  /var/www/mywebsql/config/auth.php
               # etc
        fi
        
        #needed for fix problem with ubuntu and cron
        update-locale 
        date > /etc/configured
fi
