This container not ready for used ... 

# docker-mywebsql

Docker container for [Mywebsql][3]

" Simplified Database Web Administration. For MySQL, SQLite and PostgreSQL databases. Manage your databases over the web using a secure and intuitive interface with blazing fast performance "

## Install dependencies

  - [Docker][2]

To install docker in Ubuntu 14.04 use the commands:

    $ sudo apt-get update
    $ sudo apt-get install docker.io

 To install docker in other operating systems check [docker online documentation][4]

## Usage

To run container use the command below:
 
    $ docker run -d -p xxxx:80 quantumobject/docker-mywebsql

Check port and point your browser to http://[ip]:xxxx/

when done please execute this command for security and remove the install script:

    $ docker exec -it container_id after_install

## More Info

About mywebsql[www.dokuwiki.org][1]

To help improve this container [quantumobject/docker-mywebsql][5]

[1]:http://mywebsql.net/
[2]:https://www.docker.com
[3]:http://mywebsql.net/downloads/
[4]:http://docs.docker.com
[5]:https://github.com/QuantumObject/docker-mywebsql
