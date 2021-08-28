# Containerized docker-mendix-buildpack #

The **containerized docker-mendix-buildpack** takes the [docker-mendix-buildpack](https://github.com/mendix/docker-mendix-buildpack) 
and containerizes it using Docker, to remove the need of copying a Mendix project 
into the buildpack's folder structure.

## Creating the containerized-docker-mendix-buildpack image ##

To create the image locally you can either run

```bash
$ docker build -t containerized-docker-mendix-buildpack .
```

or use the already buildt bash script that runs the same command

```bash
$ ./docker.build.containerized-docker-mendix-buildpack.sh
```

## Using the containerized-docker-mendix-buildpack container ##

To use the containerized-docker-mendix-buildpack image, run the following command 
from your Mendix project folder:

```bash
$ docker run --rm -it \
        -v //var/run/docker.sock:/var/run/docker.sock \
        -v /$(pwd):/docker-mendix-buildpack/project \
        --name cntnr-dmb \
        containerized-docker-mendix-buildpack
```

This will run the containerized-docker-mendix-buildpack container, attach to it 
and present a command prompt where you can execute the commands require to build
the Docker image for your project.

## Notes ##
This has been developed on a **Windows 10** environment using **Docker** and **git bash**.
When running **Docker containers** from **git bash**, I've need to prefix commands 
with winpty to avoid the following error message:

```
the input device is not a TTY.  If you are using mintty, try prefixing the command with 'winpty'
```
