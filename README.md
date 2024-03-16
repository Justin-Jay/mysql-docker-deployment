This respository consits of multiple shell scripts that are designed assist with the set up, configuration and back up of 
a MYSQL Database running in a Docker container. 

Script 1. db.sh

This is the first script that is required to be executed upon set up of a new environment. 

This script will first pull the environment variables required for the script from a seperate script which is not hosted on GitHub. 
The script only has environment declared and everything else is done in db.sh

Once all configurations are in place, the script will use docker-compose file located in /mysql directory to pull a MYSQL Docker image, the version is noted in the docker compose file. 
This image is then configured with the provided configuration including init scripts. 

Upon completion of the script a new MYSQL Database running in a docker container is available at localhost port 3306 for any connections to the given database config provided in the initial step. 

Script 2. db_backup.sh

This script is designed to be automated using crontab -e

It is currently configured to run once a day at midnight. 

The script itself follows the same pattern by requesting the environment variables required for the entire job from an externally hosted script. 

Once all configurations are in place, the script will use mysqldump to make a dump of the running MYSQL container started in script 1. This is achieved using the flag --all-databases to captured all information to a dump file all-databases.sql.

Once the file is dumped into the expected back up folder. 

The script will use docker-compose file located in /mysql-backup to request an image from docker hub justinmaboshego/data-archiver
and start the container. 

The data-archiver container will look for the all-databases.sql file and upladed to a Google GCP storage and store it in a folder convention of date/time/all-databases.sql 

Once the operation is completed, an email will be sent to the administrator whos credentails are provided in the environment variables required to start the container. 

Post completion of the back up and notification, a clean up phase is initailsed and the backup container and volumes are removed. 

Script 3. db_restoration.sh

Upon completion of the initial configuration steps required for the scripts to run i.e environment variables set up. 

The script will attempt to recreate the MYSQL Database in a new container using the back up file all-databases.sql made available through the back up process. 

A container to retrieve the file from Google GCP and place it into a new back up folder specifically for the restoration process is currently in development.  
