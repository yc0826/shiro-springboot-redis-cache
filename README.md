# shiroAuth

启动

1.运行项目中自带sql

2.启动redis,zookeeper 

3.选择根目录 mvn install

4.启动dubbo 选择目录./shiroAuth-rpc-service mvn exec:java -Dexec.mainClass=com.alibaba.dubbo.container.Main

5.然后选择tomcat启动 shiroAuth-web-server项目

目前功能基本可用,列表页分页功能还有点问题，在持续完善中。
有问题加qq群 465400638咨询
