#!/bin/bash
   # Variable Declaration
   PACKAGE='openjdk-11-jdk openjdk-17-jdk openjdk-21-jdk maven'
   TEMPDIR="/tmp/webfiles"
   NULLDIR="/dev/null"
   SVC='jenkins'

   echo "Running Setup on CentOS"
   # Installing Dependencies
   echo "########################################"
   echo "Installing packages."
   echo "########################################"
   sudo apt update
   sudo apt install $PACKAGE -y > /dev/null
   echo

   # Start & Enable Service
   echo "########################################"
   echo "Install Jenkins in a new EC2 Instance   "
   echo "########################################"
   sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
        https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
   echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
        https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
        /etc/apt/sources.list.d/jenkins.list > /dev/null
   sudo apt-get update
   sudo apt-get install jenkins
   echo

   # Start Service
   echo "########################################"
   echo "Restarting HTTPD service"
   echo "########################################"
   systemctl status $SVC
   echo

   # Clean Up
   echo "########################################"
   echo "Removing Temporary Files"
   echo "########################################"
   rm -rf $NULLDIR
   echo

#   sudo systemctl status $SVC
#   ls /var/www/html/