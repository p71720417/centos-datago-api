FROM mbaltrusitis/centos-python:3.5

#ENV http_proxy  http://10.144.156.1:8080 
#ENV https_proxy  http://10.144.156.1:8080 

ENV LANG en_US.UTF-8
CMD ["/bin/bash"]

RUN yum clean all && yum swap fakesystemd systemd -y

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

#RUN yum -y update && yum install \
#                gcc \
#                gettext \
#                vim \
#                postgresql-client libpq-dev \
#                apache2 apache2-dev \
#        --no-install-recommends && rm -rf /var/lib/apt/lists/* && yum clean all

RUN yum -y install yum-plugin-ovl
RUN yum -y update 
RUN yum -y install gcc
RUN yum -y install gettext
RUN yum -y install vim
RUN yum -y install postgresql postgresq-server postgresq-contrib postgresql-libs
RUN yum -y install httpd 
RUN yum -y install httpd-devel 
#RUN yum -y install mod_wsgi         
RUN yum -y clean all

COPY requirements.txt /usr/src/app/requirements.txt
RUN pip install -r /usr/src/app/requirements.txt

# setup wsgi_module
#RUN echo "LoadModule wsgi_module /usr/lib64/httpd/modules/mod_wsgi-py35.cpython-35m-x86_64-linux-gnu.so" > /etc/httpd/modules/mod_wsgi.so
#RUN a2enmod mod_wsgi.so

COPY 000-default.conf /etc/httpd/sites-enabled/000-default.conf

#develop:8080(runserver), production:80(httpd) 
EXPOSE 8080 80
