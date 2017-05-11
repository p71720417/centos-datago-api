FROM mbaltrusitis/centos-python:3.5

#ENV http_proxy  http://10.144.156.1:8080 
#ENV https_proxy  http://10.144.156.1:8080 

ENV container docker

RUN yum -y swap -- remove systemd-container systemd-container-libs -- install systemd systemd-libs

RUN yum -y update; yum clean all; \
(cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]


ENV LANG en_US.UTF-8
CMD ["/bin/bash"]

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


RUN yum -y update && yum install \
#                    yum-plugin-ovl \
#                    gcc \
#									  gettext  \
#									  vim   \
#									  postgresql postgresq-server postgresq-contrib postgresql-libs \
                    httpd httpd-devel \         
       --no-install-recommends && yum clean all

#COPY requirements.txt /usr/src/app/requirements.txt
#RUN pip install -r /usr/src/app/requirements.txt

# setup wsgi_module
#RUN echo "LoadModule wsgi_module /usr/local/lib/python3.5/site-packages/mod_wsgi/server/mod_wsgi-py35.cpython-35m-x86_64-linux-gnu.so" > /etc/apache2/mods-available/wsgi_express.load
#RUN a2enmod wsgi_express

#COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf

#develop:8080(runserver), production:80(httpd) 
#EXPOSE 8080 80
