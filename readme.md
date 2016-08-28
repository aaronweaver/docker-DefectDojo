## Synopsis

Ready to run production environment for DefectDojo, a security defect tool.

## Motivation

DefectDojo is a great product for managing security defects. The project's goal is to make it simple to run Dojo in a production environment. Simply clone this project and start up with docker-compose.

## Installation and initial configuration

1. Install docker and docker-compose per the Docker website. 
1. Git clone the docker-DefectDojo repo and cd into its directory
1. If necessary, run <pre>$ chmod u+x setup.bash</pre> to make it executable.
1. Run the setup.bash script which will create a random password for MySQL and Dojo and other setup tasks. 


## Running

To run docker-DefectDojo and see the Dojo logs in the terminal, use:
<pre>$ docker-compose up</pre>

To run docker-DefectDojo and get your terminal prompt back, use:
<pre>$ docker-compose up -d</pre>


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
