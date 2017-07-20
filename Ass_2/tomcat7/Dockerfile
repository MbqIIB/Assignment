FROM centos:centos6

MAINTAINER kaviraj.kyatam@gmail.com


######## Adding MongoDB repository
RUN echo -e "[mongodb]\nname=MongoDB Repository\nbaseurl=http://downloads-distro.mongodb.org/repo/redhat/os/`uname -m`/\ngpgcheck=0\nenabled=1" > /etc/yum.repos.d/mongodb.repo

######## Updating the Repos
RUN yum update -y

######## Install Software collection on centos
RUN yum -y install centos-release-SCL

######## Install MongoDB Server
RUN yum -y install mongodb-org.x86_64 mongodb-org-server.x86_64

######## Install Python
RUN yum install -y python27

######## Installing Additional tools
RUN yum -y install sudo wget
RUN yum clean all

######## Installing JDK8

ENV JAVA_HOME /opt/java
ENV CATALINA_HOME /opt/tomcat

RUN wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" \
 "http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz" && \
 tar xvf jdk-8u131-linux-x64.tar.gz && \
 rm jdk*.tar.gz && \
 mv jdk* ${JAVA_HOME}
RUN echo ${JAVA_HOME} >> /etc/environment

######## Installing TOMCAT 7

RUN wget https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.57/bin/apache-tomcat-7.0.57.tar.gz && \
    tar -xvf apache-tomcat-7.0.57.tar.gz && \
        rm apache-tomcat*.tar.gz && \
        mv apache-tomcat* ${CATALINA_HOME}

RUN chmod +x ${CATALINA_HOME}/bin/*sh

WORKDIR /opt/tomcat
RUN echo ${JAVA_HOME} >> /etc/default/tomcat7
RUN groupadd tomcat
RUN useradd -s /bin/bash -g tomcat tomcat
RUN chown -Rf tomcat.tomcat ${CATALINA_HOME}

EXPOSE 8080

USER tomcat

####### Starting the Tomcat Service using User tomcat
CMD /opt/tomcat/bin/catalina.sh run;