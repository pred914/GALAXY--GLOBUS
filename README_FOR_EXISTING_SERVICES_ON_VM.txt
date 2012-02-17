*********** How to run existing services************************************

Services can be accessed via Virtual Machine on which services are installed

gogalaxy.soer11.ceres.auckland.ac.nz

to run access virtual machine from outside of University network
it is necessary to ssh to 

athena.cs.auckland.ac.nz

and then ssh to gogalaxy.soer11.ceres.auckland.ac.nz

****************************************************************************
Services Present on the Virtual Machine 
****************************************************************************
*nginx server

 Nginx server is used to proxy the Galaxy requests.
 Default installation folder /usr/local/sbin nginx
 Default configuration folder nano /usr/local/nginx/conf nginx.conf
 Start the nginx server at /usr/local/sbin


*Galaxy

 To access galaxy , One must switch to galaxy user on Virtual machine

 sudo su galaxy  


 A initialization script to run galaxy is present in

 sudo /etc/init.d/galaxy 

 This brings up galaxy and can be accessed at 130.216.161.77:80 

*proftpd
 
 proftpd server is used to transfer files via ftp
 Default installation folder /usr/local/sbin proftpd
 start the proftpd server to start accepting the connections
 To begin the transfer login via terminal

 $ ftp 
 ftp> open gogalaxy.soer11.ceres.auckland.ac.nz
 ftp> username galaxy
 ftp> passwd   galaxy
 ftp> cd <navigate to galaxy-globus/database/files/>
 ftp> put <the path of desired file to transfer>

or alternatively an ftp client can be used.

*postgresql
 Galaxy database is offloaded to postgresql
 Name of the database - galaxy_prod
 to access database 
 $psql 
 psql> \c galaxy_prod;

******************************************************************************
*LOGS

To check the logs of events in galaxy 
check the event table in galaxy_prod database

select  * from event;

To check the logs 

in galaxy -globus folder check through paster.log file.
******************************************************************************
* Tool Dependencies

Various tools for ex 
1) Tophat
2) bowtie
3) Samtools

are installed and their binaries can be accessed from tool_dependencies folder in 
galaxy_globus folder.
********************************************************************************


