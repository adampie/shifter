# Set up the enviroment
echo "SETTING UP ENVIROMENT"

rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
yum install -y epel-release
yum update -y

# PHP
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
yum -y update
yum clean all
yum -y install php70w php70w-mysql php70w-mcrypt php70w-dom php70w-mbstring

systemctl start httpd
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/bin/composer
chmod +x /usr/bin/composer

# Node

# PostgreSQL
rpm -iUvh http://yum.postgresql.org/9.3/redhat/rhel-7-x86_64/pgdg-centos93-9.3-1.noarch.rpm
yum -y update
yum -y install postgresql93 postgresql93-server postgresql93-contrib postgresql93-libs
#/usr/pgsql-9.3/bin/postgresql93-setup initdb
#systemctl start postgresql-9.3

# Keycloak
