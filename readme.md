## Synopsis

Ready to run production environment for DefectDojo, a security defect tool.

## Motivation

DefectDojo is a great product for managing security defects. The project's goal is to make it simple to run Dojo in a production environment. Simply clone this project and start up with docker-compose.

## Installation

Install docker and docker-compose. Run the setup.bash script which will create a random password for MySQL and Dojo. (This is highly recommended.)

The compose file will start three containers labeled as: dojo, nginx and mysql. The initial start will take a minute or so as the startup script is creating the database and setting up the default user. Once the service is started (usually a minute or less), then browse to https://localhost and login with the username admin and the password that is in the .env file.

## Building

If you would like to build the docker file and test it out with more debugging then run:

`docker-compose -f docker-compose-dev.yml build`

Then:

`docker-compose -f docker-compose-dev.yml up`

## Contributors

* Aaron Weaver
* Matt Tesauro

## License

MIT
