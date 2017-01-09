# Dockerbuild for openshift http header dump
FROM openshift/jenkins-1-centos7

USER root

MAINTAINER Raphael Greger

# RUN echo 'we are running some of cool things'

# LABEL template.controllerTemplate.template.spec.containers[0].name=jenkins
RUN echo "http_proxy  -> "$http_proxy_host:$http_proxy_port && \
    echo "https_proxy -> "$https_proxy_host

COPY s2i /usr/libexec/s2i
RUN chmod 777 -R /usr/libexec/s2i

#- jdk --
RUN yum install -y gcc gcc-c++ openssl-devel make \
    tar unzip bc which lsof java-1.8.0-openjdk java-1.8.0-openjdk-devel && \
    yum clean all -y
RUN ln -s $((readlink -f $(which javac ))| sed "s:bin/javac::") /usr/lib/jvm/axa-java1.8

#- files
COPY resources/ /tmp/resources/
COPY plugins/ /tmp/plugins/
RUN chmod 777 /tmp/plugins/*
RUN chmod 777 /tmp/resources/*.sh
RUN /tmp/resources/setup-jenkins.sh

user 1001