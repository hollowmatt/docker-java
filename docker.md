# Doing stuff With Docker

##What is it?
It is a container system which creates a runtime environment where processes are isolated from protected resources except wher explicitly allowed. (This has been a feature of UNIX style Operating Systems for a long time)

Containers give greater security through isolation (everything happens in the container, and provides "application jails".

##What isn't it?
Without containers, people traditionally made use of Virtual Machines to provide isolation.  VMs provide virtual hardware, on which an OS would be installed, then the app would be installed in the VM.  VMs take a long time to instantiate (minutes) and creates significant resource overhead becuase they run a full copy of an OS.

Docker doesn't use hardware virtualization, programs inside docker interface directly with the host OS.

##What does Docker solve?
* improves portability: you can be sure when you develop within a docker container that it will run anywhere (in a docker container) - it gives consistency
* improves security: Like a physical jail cell, anything inside the container can only access things inside it (except what is explicitly allowed)
* Abstraction: allows you to focus on what you need to do rather than on complications of environments.  Also, when you remove a container, everything within is gone (nothing else to clean up)

## Some Basic Commands
* **docker ps** <-this will list all of the docker instances
* **docker ps -a** <- even if stopped
* **docker run <file>** : this will look for an image on the computer, if it isn't installed, it will search docker hub for the image, if it finds it, it downloads it , installes it, then creates a container and starts it
* **docker run --detach --name <name> <image>** : this will run a detached instance of an image (runs in background as daemon).  you can use -d in place of --detach
* **docker restart <name>** : this will restart a stopped container
* **docker container stop <name>** : this will stop an instance
* **docker container rm <name>** : this will delete a container
* **docker image rm <name>** : this will delete an image of a container (Base)
* **docker exec <image> <command>** : this will run the command on the named image (i.e. docker exec mycontainer ps - lists the processes running on the container named 'mycontainer')
* **docker logs <image>** : will tail the logs on the container
* **docker rm -vf $(docker ps -a -q)** : quick cleanup of all docker containers
* **docker pull <image>** : pull an image down
* **docker save -o myfile.tar <image>** : save an image 
* **docker load -i myfile.tar** : load an image
* **docker build <folder>** : build an image from a Dockerfile
* **docker image ls** : list docker images
* **docker rmi <image>** : remove an image


## Docker Volumes:
* **docker run -d --volume <folder> --name <container_name> image** : This will create a docker container that is a storage volume
* **docker run -d --volumes-from <container_name from above> --name <container_name> image** - this will create a container that mounts the volume from the other container

There are two types of volumes: Bind Volumes and Managed Volumes.
###Bind Volume
A bind volumne is a mount to a user specified location on the host file system
* **docker run -d --name bmweb -v ~/example-docs:/usr/local/apache2/htdocs -p 80:80 httpd:latest** : this will mount the local ~/example-docs folder to the /usr/local/apache2/htdocs folder in the container.




