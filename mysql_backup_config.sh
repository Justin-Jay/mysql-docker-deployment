#!/bin/bash

export mysql_backup_folder=/home/justin/data/backups
export mysql_backup_vars_source=/home/justin/secrets/database-deployment/mysql-archiver
export google_key_source=/home/justin/secrets/google-key

export mysql_backup_init_target=/home/justin/mysql-docker-deployment/mysql-backup/data/backups
export mysql_backup_vars_target=/home/justin/mysql-docker-deployment/mysql-backup/data-archiver
export google_key_target=/home/justin/mysql-docker-deployment/mysql-backup/key
export bk_compose_dir=/home/justin/mysql-docker-deployment/mysql-backup/


export mysql_arch_vars=mysql-archiver-vars.env
export database_file_name=all-databases.sql
export log_dir=/DataArchiver/Logs/

export container_name=rzdatabase

#mkdir $mysql_backup_init_target

chown justin:justin $google_key_target
chown justin:justin $mysql_backup_vars_target
chown justin:justin $mysql_backup_init_target

export user=justin