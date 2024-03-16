#!/bin/bash

export mysql_backup_source=/home/justin/data/backups/
export mysql_vars_source=/home/justin/secrets/database-deployment/mysql/
export mysql_conf_source=/home/justin/secrets/database-deployment/mysql/

export mysql_backup_target=/home/justin/mysql-docker-deployment/mysql-restoration/conf/
export mysql_vars_target=/home/justin/mysql-docker-deployment/mysql-restoration/conf/
export mysql_conf_target=/home/justin/mysql-docker-deployment/mysql-restoration/conf/

export compose_restore=/home/justin/mysql-docker-deployment/mysql-restoration/

export database_file_name=all-databases.sql
export mysql_var_file_name=mysql-vars.env
export mysql_cnf_file_name=my.cnf
export volume_mount=/var/lib/mysql

export user=justin