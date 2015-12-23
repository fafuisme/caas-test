FROM index.alauda.cn/guuuo/javaweb

MAINTAINER Fred Fu (fangyu.fu@ele.me)
ENV MAVEN_VERSION 3.3.9
RUN wget --no-verbose -O /tmp/apache-maven-${MAVEN_VERSION}.tar.gz http://mirrors.hust.edu.cn/apache/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz  && \
 tar xzf /tmp/apache-maven-${MAVEN_VERSION}.tar.gz -C /opt/ && ln -s /opt/apache-maven-${MAVEN_VERSION} /opt/maven && ln -s /opt/maven/bin/mvn /usr/local/bin && rm -f /tmp/apache-maven-${MAVEN_VERSION}.tar.gz && \
 export MAVEN_HOME=/opt/maven && export PATH=$PATH:$MAVEN_HOME/bin
RUN pwd
RUN ls -al
RUN mvn clean install

RUN cp -f target/caas-test.war /data/tomcat/webapps/

EXPOSE 8080
