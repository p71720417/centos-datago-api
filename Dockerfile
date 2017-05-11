FROM centos/python-35-centos7:latest

#ENV http_proxy  http://10.144.156.1:8080 
#ENV https_proxy  http://10.144.156.1:8080 

#ENV LANG en_US.UTF-8
#CMD ["/bin/bash"]

#RUN yum clean all && yum swap fakesystemd systemd -y

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

#RUN yum -y update && yum install \
#                gcc \
#                gettext \
#                vim \
#                postgresql-client libpq-dev \
#                apache2 apache2-dev \
#        --no-install-recommends && rm -rf /var/lib/apt/lists/* && yum clean all


RUN yum -y update && yum install yum-plugin-ovl
RUN yum -y update && yum install gcc
RUN yum -y update && yum install gettext
RUN yum -y update && yum install vim
RUN yum -y update && yum install postgresql postgresq-server postgresq-contrib postgresql-libs
RUN yum -y update && yum install httpd httpd-devel          
RUN yum clean all

COPY requirements.txt /usr/src/app/requirements.txt
RUN pip install -r /usr/src/app/requirements.txt

# setup wsgi_module
RUN echo "LoadModule wsgi_module /usr/local/lib/python3.5/site-packages/mod_wsgi/server/mod_wsgi-py35.cpython-35m-x86_64-linux-gnu.so" > /etc/apache2/mods-available/wsgi_express.load
RUN a2enmod wsgi_express

COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf

#develop:8080(runserver), production:80(httpd) 
EXPOSE 8080 80
