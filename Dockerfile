FROM library/jenkins:1.651.1

USER root
RUN apt-get update && apt-get install sudo -y
RUN echo "jenkins ALL = NOPASSWD: /usr/bin/docker" > /etc/sudoers
RUN curl -L https://github.com/docker/compose/releases/download/1.7.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose
RUN echo "jenkins ALL = NOPASSWD: /usr/local/bin/docker-compose" >> /etc/sudoers

RUN mkdir -p /var/jenkins_home
RUN chown -R jenkins:jenkins /var/jenkins_home
RUN chown -R jenkins:jenkins /tmp
VOLUME /var/jenkins_home

USER jenkins
