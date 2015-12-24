FROM guuuo/javaweb
MAINTAINER Fred Fu (fangyu.fu@ele.me)
WORKDIR /webapp
ENV MAVEN_VERSION 3.3.9
RUN wget --no-verbose -O /tmp/apache-maven-${MAVEN_VERSION}.tar.gz http://mirrors.hust.edu.cn/apache/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz  && \
 tar xzf /tmp/apache-maven-${MAVEN_VERSION}.tar.gz -C /opt/ && ln -s /opt/apache-maven-${MAVEN_VERSION} /opt/maven && ln -s /opt/maven/bin/mvn /usr/local/bin && rm -f /tmp/apache-maven-${MAVEN_VERSION}.tar.gz && \
 export MAVEN_HOME=/opt/maven && export PATH=$PATH:$MAVEN_HOME/bin
ADD . /webapp/

RUN cd /webapp &&  mvn clean package && cp -f target/caas-test.war /data/tomcat/webapps/
sed -i -e 's/\r$//g' /data/tomcat/bin/supervisord_tomcat.sh
EXPOSE 8080
