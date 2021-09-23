#!/bin/bash

yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "Hello Team This is a sample web page from Shyam." > /var/www/html/index.html
