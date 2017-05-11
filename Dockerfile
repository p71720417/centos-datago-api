FROM mbaltrusitis/centos-python:3.5

#ENV http_proxy  http://10.144.156.1:8080 
#ENV https_proxy  http://10.144.156.1:8080 

#ENV http_caching  packages


#ENV LANG en_US.UTF-8
#CMD ["/bin/bash"]


RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

#RUN yum -y update && yum install \
#                gcc \
#                gettext \
#                vim \
#                postgresql-client libpq-dev \
#                apache2 apache2-dev \
#        --no-install-recommends && rm -rf /var/lib/apt/lists/* && yum clean all

#RUN yum -y install gcc
#RUN yum -y install gettext
#RUN yum -y install vim
#RUN yum -y install postgresql-client postgresql-libs
#RUN yum -y clean metadata 
#RUN yum -y provides '*/applydeltarpm'
#RUN yum -y install deltarpm
RUN yum -y update && yum install \
							gcc \
							gettext \
							vim \
							postgresql-client postgresql-libs \
              httpd httpd-devel \
           --no-install-recommends && yum clean all

#RUN yum clean all

COPY requirements.txt /usr/src/app/requirements.txt
RUN pip install -r /usr/src/app/requirements.txt

# setup wsgi_module
#RUN echo "LoadModule wsgi_module /usr/local/lib/python3.5/site-packages/mod_wsgi/server/mod_wsgi-py35.cpython-35m-x86_64-linux-gnu.so" > /etc/apache2/mods-available/wsgi_express.load
#RUN a2enmod wsgi_express

#COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf

#develop:8080(runserver), production:80(httpd) 
#EXPOSE 8080 80