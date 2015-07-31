# How to set up GO-CD, for the first time

Recently in my last project, I had a very interesting task: I had to configure a Go server instance
in my local machine and then deploy it to AWS virtual machine. For those people who don't know what Go is, essentially Go is a very advanced Continuous integration and release management system that allows you to automate the build-tests-deploy cycle of your aplication. Basically when you push your changes to a repository like github, Go will clone the repo and run the tasks you specified on Go configurations file. The magic of it is that all of this is done automaticaly and if anything goes wrong the team has a visual and friendly interface that shows where and if posible what went wrong, any by default your changes won't be deployed to production until you fix it(or force it). 

The reason why I decided to write about Go is that even thought it is a great application with a huge documentation, it is not yet a well known so there is not a lot of information of how to set up a simple GO-CD server easily and step-by-step. Oh it is also a open source software maintained by [Thoughtworks Inc](http://www.thoughtworks.com/) but that anyone can contribute! So no more talking and let's get started!


## First things first
GO works with Linux, MAC OS and Windows. You can choose the one you like the most, but since servers tend to be set up in a linux machine, we are going to use a [Ubuntu 14.04](http://www.ubuntu.com/download/desktop) version in this tutorial. Just a reminder, you will need su access to install and install and configurate everything.

### Installing Java JRE or JDK
To start using Go, first you need to have Java JRE or JDK instaled in your machine. Go doesn't support Java 6 anymore, so while I am writing this you have two options: Java 7 or 8. We are going to use OpenJDK because it is easier to be used when you are provisioning a machine since you don't need to interact with the console to confirm the you agree with Oracle terms. So on order to install Java open your terminal and type use these commands:

```
$ apt-get update
$ apt-get --yes install software-properties-common  python-software-properties
$ add-apt-repository --yes ppa:openjdk-r/ppa
$ apt-get update
$ apt-get --yes install openjdk-8-jdk
$ echo "export JAVA_HOME=java-1.8.0-openjdk-amd64" >> /etc/environment
```

### Installing Go server
Java JDK or JRE is all you need to start using Go. You can install Go Server using a very friendly visual interface or, you can open the terminal again and type the commands:

```
$ echo "deb http://dl.bintray.com/gocd/gocd-deb/ /" > /etc/apt/sources.list.d/gocd.list
$ wget --quiet -O - "https://bintray.com/user/downloadSubjectPublicKey?username=gocd" | sudo apt-key add -
$ apt-get update
$ apt-get --yes install go-server
```

In the first three lines,  you are telling ubuntu to include Co to the system repositories  so when you use `apt-get --yes install go-server`, ubuntu will known exactly where to get go-server installation  package.
If you get no erros while installing it, Go will be successfully installed in your machine and you can check its status by running the command:

```
/etc/init.d/go-server status
```
And the console should show the following message:

```
Go Server is stopped.
```

Try to start it running the command: 
```
/etc/init.d/go-server start
```
And you should get:
```
Started Go Server on http://"the address":8153/go
```
Now if you try to access the address displayed in the console using your favorite web browser, the Go default first screen will appear to you, just like the image bellow:

[Image]

If you try to set up your Go instance now, it will not work because first you need to install another component called Go agent, so let's install it now before starting set up  
