FROM centos:7.3.1611  

ENV LANG en_US.UTF-8

#RUN mkdir -p /usr/src/app
WORKDIR /root

RUN yum -y install yum-plugin-ovl
RUN yum -y update 
RUN yum -y install gcc
RUN yum -y install gettext
RUN yum -y install krb5-devel
RUN yum -y install postgresql postgresq-server postgresq-contrib postgresql-libs postgresql-devel
RUN yum -y install httpd 
RUN yum -y install httpd-devel.x86_64 
RUN yum -y install gcc-c++         
RUN yum -y clean all

#yum install gcc krb5-devel postgresql-devel httpd-devel.x86_64 gcc-c++

COPY requirements.txt /root/requirements.txt
RUN pip install -r /root/requirements.txt