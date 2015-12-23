FROM vpcz-dt-dev-1.vm.elenet.me:5000/fafu/javaweb

MAINTAINER Fred Fu (fangyu.fu@ele.me)

ADD target/caas-test.war /data/tomcat/webapps/

EXPOSE 8080



