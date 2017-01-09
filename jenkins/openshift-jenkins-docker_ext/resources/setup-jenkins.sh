#!/bin/bash
set -x
echo 'start Jenkins setup'
BUILD_DIR=/tmp/build/jenkins
JENKINS_DIR=/usr/lib/jenkins
JENKINS_WAR=/usr/lib/jenkins/jenkins.war
TEMP_DIR=/tmp/resources
PLUGIN_DIR=/tmp/plugins
MAVEN_DIR=/opt/axatech/apache-maven
#------------------------
#-extract jenkins.war and replace a file (not needed at the moment)
#JENKINS_WAR=jenkins.war
#- go to working dir
#cd $BUILD_DIR
#- extract
#jar -xvf /usr/lib/jenkins/jenkins.war
#cp /usr/lib/jenkins/web.xml $BUILD_DIR/WEB-INF/web.xml
#echo 'start compressing jenins.war'
#rm -rf $JENKINS_WAR
#- zip it
#jar -cvfm $JENKINS_WAR $BUILD_DIR/META-INF/MANIFEST.MF .
ls -la $TEMP_DIR
#------------------------------
# maven
#------------------------------
echo 'maven copy'
mkdir -p $MAVEN_DIR
cd $MAVEN_DIR
tar -xzvf $TEMP_DIR/apache-maven.tar.gz
chmod -R 777 $MAVEN_DIR/apache-maven-3.3.3

#------------------------------
# maven settings
#------------------------------
echo 'maven settings'
cp $TEMP_DIR/settings.xml $MAVEN_DIR/apache-maven-3.3.3/conf/settings.xml
chmod 666  $MAVEN_DIR/apache-maven-3.3.3/conf/settings.xml

#------------------------------
# maven-repo
#------------------------------
mkdir -p /var/lib/jenkins/repo/

#------------------------------
# Jenkins config.xml
#------------------------------
echo 'Jenkins config.xml'
cp $TEMP_DIR/config.xml /opt/openshift/configuration/config.xml
chmod 666 /opt/openshift/configuration/config.xml

#------------------------------
# Jenkins additional config for Maven
#------------------------------
cp $TEMP_DIR/hudson.tasks.Maven.xml /opt/openshift/configuration/hudson.tasks.Maven.xml
chmod 666 /opt/openshift/configuration/hudson.tasks.Maven.xml

#------------------------------
# Jenkins plugins
#------------------------------
# echo 'Jenkins plugin'
cp $PLUGIN_DIR/*.hpi /opt/openshift/plugins
chmod 666 /opt/openshift/plugins/*.hpi
# cp $TEMP_DIR/plugins.txt /opt/openshift/configuration/plugins.txt
# #USER root
# sh /usr/local/bin/plugins.sh /opt/openshift/configuration/plugins.txt

rm -rf $BUILD_DIR
rm -rf /tmp/resources

echo 'end Jenkins setup'