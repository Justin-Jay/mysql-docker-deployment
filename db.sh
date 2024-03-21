#!/bin/bash

source ./mysql_var_config.sh

echo "Creating volume mount  $volume_mount "

sudo mkdir -p $volume_mount
sudo chown $user:$user $volume_mount

sudo mkdir -p $deployment_conf
sudo chown $user:$user $deployment_conf

cd $compose_dir

echo "Bringing up database..."

echo "Creating secrets and vars to target"

cp $secrets_source/$mysql_var_file_name* $deployment_conf
cp $secrets_source/$schema_init_file_name* $deployment_conf
cp $secrets_source/$data_init_file_name* $deployment_conf
#cp $secrets_source/$mysql_cnf_file_name* $deployment_conf



sudo chmod +x $deployment_conf/$mysql_var_file_name
sudo chmod +x $deployment_conf/$schema_init_file_name
sudo chmod +x $deployment_conf/$data_init_file_name

sudo chown 1000:1000 $deployment_conf/$mysql_var_file_name
sudo chown 1000:1000 $deployment_conf/$schema_init_file_name
sudo chown 1000:1000 $deployment_conf/$data_init_file_name


echo "Creating Database"
cd $compose_dir
docker-compose -f docker-compose.mysql.yml up -d

#./pagent.sh

echo "Database script executed..."


