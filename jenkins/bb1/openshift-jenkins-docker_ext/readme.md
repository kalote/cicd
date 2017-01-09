# Jenkins Docker

##  Overview
This Docker build should inherit from openshift/jenkins-1-centos7


**********
## new base jenkins
**********
## how to install
### create volume
oc create -f jenkins-json\persist-volume.json

### create jenkins from template
#### secrets generation for access GIT
// only the first time
oc secrets new-basicauth gitbasic --username=axatech-ch_openpaas --password=<password form keypass(html encoded)>
> output > secret/gitbasic

oc secrets add serviceaccount/builder secrets/gitbasic

#### eu-central
oc new-app -f template\eu-central-1\jenkins-template-from-rh-docker.json
#### ap-southeast
oc new-app -f template\ap-southeast-1\jenkins-template-from-rh-docker.json

### create Jenkins over Openshift Web UI
add project
seraching for jenkins-openpaas

**********
## new deploy jenkins
**********
## how to install
### create volume
oc create -f jenkins-json\persist-volume.json

### create jenkins from template
#### eu-central
oc new-app -f template\eu-central-1\jenkins-template-deploy.json
#### ap-southeast
oc new-app -f template\ap-southeast-1\jenkins-template-deploy.json

### create Jenkins over Openshift Web UI
add project
seraching for jenkins-openpaas

*************
## where is Jenkins war file
*************
# jenkins.war
/usr/lib/jenkins/jenkins.war