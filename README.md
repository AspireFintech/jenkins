# Jenkins

This is a Docker container to run the Jenkins CI server and provide Docker and Docker-compose support inside the container.

It uses the Official Jenkins Docker image. See https://hub.docker.com/_/jenkins/ for more details.

#### Notes
- The Docker binary from the host is exposed to the container. Make sure commands are never run by the root user as it is the equivalent of giving root access to the host.
- On the host, create the directory `/var/jenkins_home` and grant ownership to this folder to the user running the Docker process (e.g. `chown -R ubuntu:ubuntu /var/jenkins_home`). This folder, when mounted as a volume, is a permanent data store for your Jenkins project.
- Mount the Jenkins file volume to `/var/jenkins_home`. Running `docker` inside this container actually executes in the host context, so for consistency, the workspace path is the same on the container and on the host.
- The Jenkins process runs on port 8080
