# Docker and Kubernetes

- [Docker and Kubernetes](#docker-and-kubernetes)
- [Commands - Manipulating Containers](#commands---manipulating-containers)
  - [Getting Help](#getting-help)
  - [Running Containers](#running-containers)
  - [Listing Containers](#listing-containers)
  - [Stopping \& Starting Containers](#stopping--starting-containers)
  - [Removing Containers](#removing-containers)
  - [Inspecting Containers](#inspecting-containers)
  - [Executing Commands in Containers](#executing-commands-in-containers)
  - [Container Resource Usage](#container-resource-usage)
  - [Renaming Containers](#renaming-containers)
  - [Copying Files](#copying-files)
- [Commands - Building Custom Images](#commands---building-custom-images)
  - [Getting Help](#getting-help-1)
  - [Building Images](#building-images)
  - [Tagging Images](#tagging-images)
  - [Listing Images](#listing-images)
  - [Removing Images](#removing-images)
  - [Image History \& Details](#image-history--details)
  - [Saving \& Loading Images](#saving--loading-images)
  - [Exporting \& Importing Containers as Images](#exporting--importing-containers-as-images)
  - [Pushing \& Pulling Images](#pushing--pulling-images)
  - [Logging into Docker Hub](#logging-into-docker-hub)
  - [BuildKit (Advanced Builds)](#buildkit-advanced-builds)
  - [Cleaning Up Build Cache](#cleaning-up-build-cache)

# Commands - Manipulating Containers

## Getting Help

Help for a command:

> docker --help  
> docker run --help  
> docker ps --help  

---

## Running Containers

Run a container:

> docker run nginx  

Run interactive container:

> docker run -it ubuntu bash  

---

## Listing Containers

List running containers:

> docker ps  

List all containers (including stopped):

> docker ps -a  

---

## Stopping & Starting Containers

Stop a container:

> docker stop container_id  

Start a stopped container:

> docker start container_id  

Restart a container:

> docker restart container_id  

---

## Removing Containers

Remove a container:

> docker rm container_id  

Force remove a running container:

> docker rm -f container_id  

Remove all stopped containers:

> docker container prune  

---

## Inspecting Containers

View container details:

> docker inspect container_id  

View container logs:

> docker logs container_id  

Follow logs in real time:

> docker logs -f container_id  

---

## Executing Commands in Containers

Run command in running container:

> docker exec container_id ls  

Open interactive shell inside container:

> docker exec -it container_id bash  

---

## Container Resource Usage

Show container resource usage:

> docker stats  

---

## Renaming Containers

Rename a container:

> docker rename old_name new_name  

---

## Copying Files

Copy file from container to host:

> docker cp container_id:/path/to/file ./file  

Copy file from host to container:

> docker cp ./file container_id:/path/to/file  

---

# Commands - Building Custom Images 

## Getting Help

Help for a command:

> docker build --help  
> docker image --help  

---

## Building Images

Build an image from a Dockerfile:

> docker build .  

Build an image with a tag:

> docker build -t my-image:latest .  

Build image with specific Dockerfile:

> docker build -f Dockerfile.dev .  

Build without using cache:

> docker build --no-cache -t my-image .  

---

## Tagging Images

Tag an existing image:

> docker tag image_id my-image:latest  

Tag image for a repository:

> docker tag my-image username/my-image:latest  

---

## Listing Images

List local images:

> docker images  

List images with more details:

> docker image ls  

---

## Removing Images

Remove an image:

> docker rmi image_id  

Force remove an image:

> docker rmi -f image_id  

Remove unused images:

> docker image prune  

Remove all unused images (including dangling and unreferenced):

> docker image prune -a  

---

## Image History & Details

Show image history:

> docker history image_id  

Inspect an image:

> docker inspect image_id  

---

## Saving & Loading Images

Save image to a file:

> docker save -o my-image.tar my-image  

Load image from a file:

> docker load -i my-image.tar  

---

## Exporting & Importing Containers as Images

Export a container to a tar file:

> docker export container_id > container.tar  

Import a container as an image:

> cat container.tar | docker import - my-image:latest  

---

## Pushing & Pulling Images

Pull image from Docker Hub:

> docker pull nginx  

Push image to Docker Hub:

> docker push username/my-image:latest  

---

## Logging into Docker Hub

Login to Docker Hub:

> docker login  

Logout from Docker Hub:

> docker logout  

---

## BuildKit (Advanced Builds)

Enable BuildKit (Linux/macOS):

> export DOCKER_BUILDKIT=1  

Build with BuildKit:

> docker build -t my-image .  

---

## Cleaning Up Build Cache

Remove build cache:

> docker builder prune  

Remove all build cache without prompt:

> docker builder prune -f

---

