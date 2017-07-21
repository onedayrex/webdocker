FROM fabric8/java-alpine-openjdk8-jdk
MAINTAINER onedayrex "1115757866@qq.com"
ENV MAVEN_HOME="/apache-maven-3.5.0"
ENV PATH $MAVEN_HOME/bin:$PATH

#安装基本工具
RUN apk add --no-cache --virtual=build-dependencies wget ca-certificates unzip
RUN mkdir /var/tmp/maven
RUN wget -P /var/tmp/maven  http://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.tar.gz
RUN tar xzf /var/tmp/maven/apache-maven-3.5.0-bin.tar.gz
RUN rm -rf /var/tmp/maven/apache-maven-3.5.0-bin.tar.gz
RUN mvn --version
CMD ["mvn","-version"]
