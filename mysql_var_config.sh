#!/bin/bash

export secrets_source=/home/justin/secrets/database-deployment/mysql/
export deployment_conf=/home/justin/mysql-docker-deployment/mysql/conf/
export compose_dir=/home/justin/mysql-docker-deployment/mysql/


export schema_init_file_name=init.sql
export data_init_file_name=data.sql
export mysql_var_file_name=mysql-vars.env
export mysql_cnf_file_name=my.cnf
export volume_mount=/var/lib/mysql

export user=justin



