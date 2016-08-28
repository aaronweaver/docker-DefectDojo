#!/bin/bash
echo "=============================================================================="
echo "Welcome to Docker DefectDojo!"
echo "=============================================================================="
echo
echo "First let's setup the passwords for MySQL and Dojo."
echo
stty -echo
read -p "Enter the password for MySQL root or enter for a random password: " SQLPWDROOT; echo
stty echo
if [ -z "$SQLPWDROOT" ]; then
  SQLPWDROOT=`LC_CTYPE=C tr -dc A-Za-z0-9_\!\@\#\$\%\^\&\*\(\)-+ < /dev/urandom | head -c 32 | xargs`
fi

stty -echo
read -p "Enter the password for MySQL Dojo or enter for a random password: " SQLPWDDOJO; echo
stty echo
if [ -z "$SQLPWDDOJO" ]; then
  SQLPWDDOJO=`LC_CTYPE=C tr -dc A-Za-z0-9_\!\@\#\$\%\^\&\*\(\)-+ < /dev/urandom | head -c 32 | xargs`
fi

stty -echo
read -p "Enter the password for the admin Dojo user or enter for a random password: " DOJOADMPWD; echo
stty echo
if [ -z "$DOJOADMPWD" ]; then
  DOJOADMPWD=`LC_CTYPE=C tr -dc A-Za-z0-9_\!\@\#\$\%\^\&\*\(\)-+ < /dev/urandom | head -c 32 | xargs`
fi
stty echo

BREW_CMD=$(which brew)
#Create the .env file
cp env/mysql.dist env/mysql.env
cp env/dojo.dist env/dojo.env
cp env/common.dist env/common.env
if [[ ! -z $BREW_CMD ]]; then
	sed -i ''  "s/MYSQLROOTPWD/$SQLPWDROOT/g" env/mysql.env
	sed -i ''  "s/MYSQLPWD/$SQLPWDDOJO/g" env/common.env
	sed -i ''  "s/DOJOADMINPWD/$DOJOADMPWD/g" env/dojo.env
else
	sed -i  "s/MYSQLROOTPWD/$SQLPWDROOT/g" env/mysql.env
	sed -i  "s/MYSQLPWD/$SQLPWDDOJO/g" env/common.env
	sed -i  "s/DOJOADMINPWD/$DOJOADMPWD/g" env/dojo.env
fi

echo
echo "Passwords saved in the .env file"
echo
echo "Startup dojo with docker-compose up."
echo "Wait a minute for initialization and then browse to: http://localhost/"
echo "Login with: admin/$DOJOADMPWD"
