# How to configure GO-CD for the first time step-by-step

Recently in my last project, I had a very interesting task: I had to configure a Go-CD server instance
in my machine. For those people who don't know what GO-CD is, essentially GO-CD is a very advanced Continuous integration and release management system that allows you to automate the build-tests-deploy cycle of your aplication. Basically when you push your changes to a repository like github, GO-CD will clone the repo and run the tasks you specified on GO configurations file. The magic of it is that all of this is done automaticaly and if anything goes wrong the team has a visual and friendly interface that shows where and if posible what went wrong, any by default your changes won't be deployed to production until you fix it(or force it).

The reason why I decided to write about GO-CD is that even thought it is a great aplication with a huge documentation, it is not yet a well known so there is not a lot of information of how to set up a simple GO-CD server easily and step-by-step. I hope you will enjoy it!


## Before we start we need to set up your machine 
GO works with Linux, MAC OS and Windows. You can choose the one you like the most, but since servers tend to be set up in a linux machine, we are going to use a [Ubuntu 14.04](http://www.ubuntu.com/download/desktop) version in this tutorial.
To start using GO, first you need to have JAVA JRE or JDK instaled in your machine. GO doesn't support Java 6 anymore, so while I am writing this you have two options: Java 7 or 8. We are going to use OpenJDK because it is easier to be used when you are provisioning a machine since you don't need to interact with the console. 

```
$   apt-get update
$   apt-get --yes install software-properties-common  python-software-properties
$   add-apt-repository --yes ppa:openjdk-r/ppa
$   apt-get update
$   apt-get --yes install openjdk-8-jdk
$   echo "export JAVA_HOME=java-1.8.0-openjdk-amd64" >> /etc/environment
```

* Spring MVC 
* SpringBoot
* Gradle
* PostgreSQL
* Hibernate
* [Bootstrap3](http://getbootstrap.com/)

##### Testes
* JUnit
* Hamcrest
* Mockito
* Jasmine
* Karma
* Sinon
* Chai

## Pré-requisitos para executar os testes de front-end

##### Mac OS X

```
$ brew install node
```

No Mac OS X, instalando somente o 'node', o npm já é incluso.

##### Linux

```
$ sudo apt-get update
$ sudo apt-get install nodejs
$ sudo apt-get install npm
```

## Como executar os testes de front-end

```
$ ./gradlew jsTest
```
