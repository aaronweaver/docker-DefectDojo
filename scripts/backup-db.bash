#!/bin/bash
# Backups up the data from dojo and dumps it to a folder specified in DUMPS_FOLDER

# Configuration
CONTAINER_NAME="dockerdefectdojo_mysql_1"
FILENAME="dojomysqlbackup-`date +%Y-%m-%d-%H:%M:%S`.sql"
DUMPS_FOLDER="/Users/aweaver/dojo/"
BUCKET_NAME="dojomysqlbackup-private"
BACKUP_DAYS=7

#load the SQL env variables from common.env
MYSQL_DATABASE=`awk '/MYSQL_DATABASE/' ../env/common.env | awk -F'=' '{print $2}'`
MYSQL_USER=`awk '/MYSQL_USER/' ../env/common.env | awk -F'=' '{print $2}'`
MYSQL_PASSWORD=`awk '/MYSQL_PASSWORD/' ../env/common.env | awk -F'=' '{print $2}'`

# Backup from docker container
docker exec $CONTAINER_NAME sh -c "mysqldump $MYSQL_DATABASE --user $MYSQL_USER --password=$MYSQL_PASSWORD" > /$DUMPS_FOLDER/$FILENAME

# Keep only 7 most recent backups
cd $DUMPS_FOLDER && (ls -t | head -n $BACKUP_DAYS ; ls -t) | uniq -u | xargs --no-run-if-empty rm
cd $DUMPS_FOLDER && bzip2 --best $FILENAME

# Upload on S3
#/usr/bin/aws s3 sync --delete $DUMPS_FOLDER s3://$BUCKET_NAME
