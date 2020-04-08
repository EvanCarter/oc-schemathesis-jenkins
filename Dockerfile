FROM registry.redhat.io/openshift3/jenkins-slave-base-rhel7:latest


RUN : 'removed yum-config-manager' \
 || : \
 &&     INSTALL_PKGS="python3" \
 &&     yum install -y --setopt=tsflags=nodocs $INSTALL_PKGS \
 &&     rpm -V  $INSTALL_PKGS \
 &&     yum clean all

 ENV LC_ALL=en_US.utf-8 
 ENV  LANG=en_US.utf-8

RUN pip3 install schemathesis

RUN curl https://raw.githubusercontent.com/EvanCarter/swaggerHosting/master/swagger.json

USER 1001
