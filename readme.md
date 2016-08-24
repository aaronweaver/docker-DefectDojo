## Synopsis

Ready to run production environment for DefectDojo, a security defect tool.

## Motivation

DefectDojo is a great product for managing security defects. This project's goal is to make it simple to run Dojo in a production environment by simply cloning this project and starting docker-compose.

## Installation

Provided that docker is installed then run docker-compose up. The compose file will start three containers: dojo, nginx and mysql. The initial start will take a minute or so as the startup script is creating the database and setting up the default user. Once the service is started, then browse to https://localhost and login with the username admin and the password is in the .env file.

## Contributors

* Aaron Weaver
* Matt Tesauro

## License

MIT
