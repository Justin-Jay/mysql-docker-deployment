#!/bin/bash

source ./mysql_backup_config.sh

## MAKE DIR
 echo "Creating BACK UPS DIR..."

echo "Creating Archiver Log Dir on host"
sudo mkdir -p $log_dir

sudo chown $user:$user $log_dir

echo "Creating Back Up Folder on host"
mkdir -p $mysql_backup_folder

sudo chown $user:$user $mysql_backup_folder

cd $bk_compose_dir/

echo "Old instance clean up"

#docker-compose -f docker-compose.archiver.yml down -v --remove-orphans

#BACK UP DATABASES
echo "Backing up databases"
source ./mysql_user_details.sh

docker exec $container_name sh -c 'exec mysqldump --all-databases -u"$MYSQL_USER" -p"$MYSQL_PASSWORD"' > "$mysql_backup_folder/$database_file_name"

#Copy Back up file to target
echo "Copying back up source to target folder"
echo "back up folder: $mysql_backup_folder Database file name $database_file_name Target folder $mysql_backup_init_target "

sudo cp $mysql_backup_folder/$database_file_name*  $mysql_backup_init_target/$database_file_name

#chmod 400 $mysql_backup_init_target/$database_file_name

#COPY ENV VARIABLES TO TARGET FOLDER
echo "Copying env variables target folder"

sudo cp $mysql_backup_vars_source/$mysql_arch_vars* $mysql_backup_vars_target
#chmod 400 $mysql_backup_vars_target/$mysql_arch_vars

# COPY API KEY
echo "Copying key target folder"

sudo cp $google_key_source/$api_key_name* $google_key_target

#chmod 400 $google_key_target/$api_key_name

# RUN BACK UP PROCESS

echo "Creating Archive Container"

docker-compose -f docker-compose.archiver.yml up -d

echo "Sleep for 5 Minutes......."
sleep 3
echo "Instance clean up"

#docker-compose -f docker-compose.archiver.yml down -v --remove-orphans

echo "Back up tasks complete..."
