FROM mbaltrusitis/centos-python:3.5

ENV LANG en_US.UTF-8

RUN yum clean all && yum swap fakesystemd systemd -y

RUN yum -y install yum-plugin-ovl
RUN yum -y update 
RUN yum -y install gcc
RUN yum -y install gettext
RUN yum -y install krb5-devel
RUN yum -y install postgresql postgresq-server postgresq-contrib postgresql-libs
RUN yum -y install httpd 
RUN yum -y install httpd-devel
RUN yum -y install gcc-c++ 
RUN yum -y install telnet 
RUN yum -y install glib*  
RUN yum -y install glibc.i686
RUN yum -y install libstdc++* 
RUN yum -y install libstdc++.i686  
RUN yum -y install libgcc.i686 
RUN yum -y install cyrus-sasl-plain
RUN yum -y clean all
