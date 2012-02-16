** Package installs galaxy to run on production server*****************

The package downloaded has
* Script that installs all dependencies required for galaxy
* Installs nginx server , postgresql, proftpd server.
* Installs samtools,bowtie,tophat 

*** INSTALLATION PROCEDURE********************************************

1) //Extract the zip file , run setup.sh

   sudo sh setup.sh

******* DATABASE******************************************************        

2) //Login as postgres user in terminal

   sudo su - postgres

   //Use createdb to create new database for galaxy

   createdb galaxy_prod

   //Connect to database using psql

   psql galaxy_prod

   //Create galaxy user for PostgreSQL database

   CREATE USER galaxy WITH PASSWORD 'password';
   GRANT ALL PRIVILEGES ON DATABASE galaxy_prod to galaxy;
   \q

*******************FTP*********************************************

3) proftpd server

   via terminal

   ftp open <server name>
   username <ftp login name>
   password <ftp login password>
   cd <navigate to galaxy-globus directory/database/files/>
   put <your files> 

***********************************************************************

4) To edit configuration of galaxy 

   edit -> universe_wsgi.ini file in galaxy-globus directory

***********************************************************************




