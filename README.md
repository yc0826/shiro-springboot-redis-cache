# shiroAuth
该项目框架借鉴了原项目authManager的shiro redis缓存实现 在此基础上优化了数据结构和页面逻辑
原项目地址https://github.com/imalexyang/authManager


项目启动

1.运行项目中自带sql

2.启动redis,zookeeper 

3.选择根目录 mvn clean install -Dmaven.test.skip=true

4.启动dubbo 选择目录./shiroAuth-rpc-service mvn exec:java -Dexec.mainClass=com.alibaba.dubbo.container.Main

5.然后选择tomcat启动 shiroAuth-web-server项目

目前功能基本可用,列表页分页功能还有点问题，在持续完善中。
有问题加qq群 465400638咨询
