# Dockerbuild for openshift http header dump
FROM openshift/jenkins-1-centos7

USER root

MAINTAINER Raphael Greger

# RUN echo 'we are running some of cool things'

# LABEL template.controllerTemplate.template.spec.containers[0].name=jenkins
RUN echo "http_proxy  -> "$http_proxy_host:$http_proxy_port && \
    echo "https_proxy -> "$https_proxy_host

COPY ./docker.repo /etc/yum.repos.d/docker.repo

COPY ./openshift /opt/openshift
COPY ./jenkins /usr/local/bin
ADD ./s2i /usr/libexec/s2i

RUN chown -R 1001:0 /opt/openshift && \
    /usr/local/bin/fix-permissions /opt/openshift && \
    /usr/local/bin/fix-permissions /var/lib/jenkins

#- jdk --
RUN yum install -y sudo gcc gcc-c++ openssl-devel make docker-engine \
    tar unzip bc which lsof java-1.8.0-openjdk java-1.8.0-openjdk-devel && \
    yum clean all -y
RUN ln -s $((readlink -f $(which javac ))| sed "s:bin/javac::") /usr/lib/jvm/axa-java1.8

RUN echo "1001 ALL=NOPASSWD: ALL" >> /etc/sudoers
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

USER 1001
CMD ["/usr/libexec/s2i/run"]