FROM ubuntu:latest
MAINTAINER onedayrex "1115757866@qq.com"

#安装JDK
RUN apt-get update
#从官网下载jdk
RUN wget --no-cookies --no-check-certificate --header "Cookie:gpw_e24=http%3a%2f%2fwww.oracle.com%2ftechnetwork%2fjava%2fjavase%2fdownloads%2fjdk7-downloads-1880260.html;oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz
RUN tar -zxf jdk-7u79-linux-x64.tar.gz

# 配置环境变量
ENV JAVA_HOME /home/jdk1.7.0_79  
ENV JRE_HOME $JAVA_HOME/jre
ENV CLASSPATH .:$JAVA_HOME/lib:$JRE_HOME/lib
ENV PATH $PATH:$JAVA_HOME/bin

#安装tomcat
#RUN mkdir /var/tmp/tomcat
#RUN wget -P /var/tmp/tomcat http://mirrors.noc.im/apache/tomcat/tomcat-8/v8.0.33/bin/apache-tomcat-8.0.33.tar.gz
#RUN tar xzf /var/tmp/tomcat/apache-tomcat-8.0.33.tar.gz -C /var/tmp/tomcat
#RUN rm -rf /var/tmp/tomcat/apache-tomcat-8.0.33.tar.gz

#安装maven
RUN mkdir /var/tmp/maven
RUN wget -P /var/tmp/maven http://mirrors.cnnic.cn/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
RUN tar xzf /var/tmp/maven/apache-maven-3.3.9-bin.tar.gz -C /var/tmp/maven
RUN rm -rf /var/tmp/maven/apache-maven-3.3.9-bin.tar.gz
#设置maven环境变量
ENV MAVEN_HOME=/var/tmp/maven/apache-maven-3.3.9
ENV PATH=$MAVEN_HOME/bin:$PATH



RUN mkdir /var/tmp/webapp
ADD ./ /var/tmp/webapp
RUN cd /var/tmp/webapp && mvn package && java -Dfile.encoding=GBK -jar  /var/tmp/webapp/target/webdocker-1.0.0.jar
EXPOSE 8080

#CMD ["./var/tmp/tomcat/apache-tomcat-8.0.33/bin/catalina.sh","run"]