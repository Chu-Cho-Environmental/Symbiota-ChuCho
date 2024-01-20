 * Author: Nick Slugocki
 * Last Edited: 2024-01-19

## About this repository
This is a fork of [Symbiota](https://github.com/BioKIC/Symbiota) for Chu Cho Environmental.

This document details customizations made by Chu Cho Environmental on the Symbiota software
and any other information that might help someone understand how to configure things in 
case it has any issues.

The regular Symbiota README file can be located at [SYMBIOTA-README.md](SYMBIOTA-README.md)

Changes to the Symbiota codebase will be documented here:

## Changes

### Login Redirect
 * Created a login redirect. This is so that Brianna and I can protect the project while we 
   evaluate it. We need permission from TKDN before we would be allowed to make the information 
   public.
 * Changed the user creation link so that it's found under "User Permissions" in the 
   Administrative section

### Development Environment
 * Created a Docker stack, including PhpMyAdmin and Xdebug.
 * Files can be found in the `docker` directory.
    * Useful for anyone that wants to modify the CCE version of the software without affecting
      the production version.
    * Go to the [Docker Information](#docker-information) section for more info.


## Infrastructure
Currently, the project is hosted on Amazon Web Services (AWS). I have it hosted on an account
with my work e-mail `nick@chuchoenvironmental.com`. Dylan and I are looking into creating an 
organizational AWS account but haven't gotten around to doing that.

The web stack is currently set up on a Lightsail instance with the Bitnami Nginx package, 
sans the database.

 * **Web Server:** Nginx on Lightsail
 * **Database:** MariaDB on RDS
 * **Host URL:** http://15.156.162.196/Symbiota/profile/index.php



## Docker Information
### What is Docker?
Docker is a used to create a "containerized" version of different apps. For example, you 
could have one container for a webserver like Nginx, one container for a PostgresQL 
database, and so on.

This solves the problem of different versions of these apps being incompatible or breaking
each other. It's sort of like how Anaconda has separate environments so you don't mix up 
different  installs of Python for example.

### What is Docker Compose?
Docker Compose is a feature of docker that lets you orchestrate Docker containers into a single 
service or application. This is useful because web applications usually have multiple components, 
and you probably want each set of components to be orchestrated separately. Docker Compose helps 
with that orchestration process.

For example, `app1` might be composed of `nginx1` and `db1`. And `app2` might be composed of 
`nginx2` and `db2`. Without Docker Compose, Docker wouldn't really give you many clues as to 
which belongs with which. Or you might think a container is running but it was actually a 
different one and struggle to get your app working. It would probably get messy if you started 
mixing them up. So Docker Compose helps keep your cats all nice and herded.

### What components make up a web app? Why do I need so many of these "components" or "containers"?
That's just the way the world-wide web started and grew. It started out with the need for a 
web server that could send and receive requests from a web browser. Then people wanted to script 
things in programming languages. And then they wanted store stuff, so they needed a database.
And so on. Here's what typically makes up a basic "web app" or "web service":

 * Web server software (Apache or Nginx)
 * Server-side language extensions for the web server (PHP-FPM, Python-WSGI)
 * Database (MariaDB, MySQL, PostgresQL)
 * The web app itself, which is usually made up with a combination of HTML, CSS, Javascript, and
   a server-side language which in this case is PHP.

### Docker & Docker Compose

### How do I use the Docker envrionment?

#### Setting Up Docker
1. Install Docker and Docker Compose. 
   * I don't really have comprehensive instructions for that right now since Docker is a 
      bit technical to install.
   * If you're on Mac OS, you can either use 
      [Docker Desktop](https://docs.docker.com/desktop/install/mac-install/) if you want a 
      GUI or [Colima](https://github.com/abiosoft/colima) if you want to run it on command 
      line.
   * Docker Desktop has more complicated commercial licensing and tries to sell 
      subscription stuff so I stick with Colima.
2. Run Docker Compose file as normal. 
   * Example:
     * `cd path/to/symbiota/docker`
     * `docker-compose up`
3. If this is your first time
4. Direct your browser to `http://localhost:8080/index.php`

#### Stopping Docker
 * When you're not using it, you may want to bring the docker containers down to
   free up computer resources. In that case you can do:
   * `cd path/to/symbiota/docker`
   * `docker-compose down`

#### Other Notes
 * You can also set up the Docker file in an IDE like PhpStorm or code editor like VS Code. 
   This is a little more advanced. 