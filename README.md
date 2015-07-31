# How to configure GO-CD for the first time step-by-step

Recently in my last project, I had a very interesting task: I had to configure a Go-CD server instance
in my machine. For those people who don't know what GO-CD is, essentially GO-CD is a very advanced Continuous integration and release management system that allows you to automate the build-tests-deploy cycle of your aplication. Basically when you push your changes to a repository like github, GO-CD will clone the repo and run the tasks you specified on GO configurations file. The magic of it is that all of this is done automaticaly and if anything goes wrong the team has a visual and friendly interface that shows where and if posible what went wrong, any by default your changes won't be deployed to production until you fix it(or force it). 

The reason why I decided to write about GO-CD is that even thought it is a great aplication with a huge documentation, it is not yet a well known so there is not a lot of information of how to set up a simple GO-CD server easily and step-by-step. Oh it is also a open source software maintained by [Thoughtworks Inc](http://www.thoughtworks.com/) but that anyone can contribute! So no more talking and let's get started!


## Before we start we need to set up your machine 
GO works with Linux, MAC OS and Windows. You can choose the one you like the most, but since servers tend to be set up in a linux machine, we are going to use a [Ubuntu 14.04](http://www.ubuntu.com/download/desktop) version in this tutorial. Just a reminder, you will need su access to install and install and configurate everything.

### Installing Java JDK or JRE
To start using GO, first you need to have Java JRE or JDK instaled in your machine. GO doesn't support Java 6 anymore, so while I am writing this you have two options: Java 7 or 8. We are going to use OpenJDK because it is easier to be used when you are provisioning a machine since you don't need to interact with the console to confirm the you agree with Oracle terms. So on order to install Java open your terminal and type use these commands:

```
$ apt-get update
$ apt-get --yes install software-properties-common  python-software-properties
$ add-apt-repository --yes ppa:openjdk-r/ppa
$ apt-get update
$ apt-get --yes install openjdk-8-jdk
$ echo "export JAVA_HOME=java-1.8.0-openjdk-amd64" >> /etc/environment
```

### Installing GO SERVER
Java JDK or JRE is all you need to start using GO. You can install Go Server using a very friendly visual interface or, you can open the terminal again and type the following commands:

```
$ echo "deb http://dl.bintray.com/gocd/gocd-deb/ /" > /etc/apt/sources.list.d/gocd.list
$ wget --quiet -O - "https://bintray.com/user/downloadSubjectPublicKey?username=gocd" | sudo apt-key add -
$ apt-get update
$ apt-get --yes install go-server
```

In the first three lines,  you are telling ubuntu to include CO-CD repositories to the system so when you use `apt-get --yes install go-server`, ubuntu will known exactly where to find go-server package.
