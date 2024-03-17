#!/bin/bash

echo "Bringing up database..."

echo "Creating secrets and vars to target"

source ./mysql_restoration_config.sh

cp $mysql_backup_source/$database_file_name* $mysql_backup_target
cp $mysql_vars_source/$mysql_var_file_name* $mysql_vars_target
cp $mysql_conf_source/$mysql_cnf_file_name* $mysql_conf_target

echo "Creating volume mount  $volume_mount "

sudo mkdir -p $volume_mount

chown $user:$user $volume_mount

cd $compose_restore

docker-compose -f docker-compose.dbrestore.yml up -d

echo "Database Restored "