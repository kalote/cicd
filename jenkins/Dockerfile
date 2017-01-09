FROM jenkins:1.651.3

USER root
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
RUN \
	apt-get update && \
	apt-get install -Vy apt-transport-https ca-certificates
RUN echo "deb https://apt.dockerproject.org/repo debian-jessie main" > /etc/apt/sources.list.d/docker.list
RUN \
    apt-get update && \
    apt-get install -Vy sudo build-essential make docker-engine && \
	apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

RUN chown -R 1000 /var/lib/jenkins
ENV JENKINS_HOME /var/lib/jenkins
USER jenkins