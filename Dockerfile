FROM index.alauda.cn/guuuo/javaweb

MAINTAINER Fred Fu (fangyu.fu@ele.me)

RUN wget --no-verbose -O /tmp/apache-maven-3.2.2.tar.gz http://archive.apache.org/dist/maven/maven-3/3.2.2/binaries/apache-maven-3.2.2-bin.tar.gz && \
 echo "87e5cc81bc4ab9b83986b3e77e6b3095 /tmp/apache-maven-3.2.2.tar.gz" | md5sum -c && \
 tar xzf /tmp/apache-maven-3.2.2.tar.gz -C /opt/ && ln -s /opt/apache-maven-3.2.2 /opt/maven && ln -s /opt/maven/bin/mvn /usr/local/bin && rm -f /tmp/apache-maven-3.2.2.tar.gz && \
 export MAVEN_HOME=/opt/maven && export PATH=$PATH:$MAVEN_HOME/bin

RUN mvn clean install

RUN cp -f target/caas-test.war /data/tomcat/webapps/

EXPOSE 8080



