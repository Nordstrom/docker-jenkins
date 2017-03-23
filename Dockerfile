FROM jenkinsci/jenkins:2.51
MAINTAINER Nordstrom Engineering Platform CI Team "techk8s@nordstrom.com"

RUN mkdir -p /usr/share/jenkins/ref/secrets/ \
 && echo "false" > /usr/share/jenkins/ref/secrets/slave-to-master-security-kill-switch
RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state
