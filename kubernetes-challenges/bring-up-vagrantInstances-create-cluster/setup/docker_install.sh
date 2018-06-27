#!/bin/bash
set -x

#Adding docker repo
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

#Installing and starting docker
yum -y install docker-ce;systemctl enable docker;systemctl start docker