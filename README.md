# shiroAuth
该项目框架借鉴了原项目authManager的shiro redis缓存实现 在此基础上改进了项目结构接口和实现解耦，
通过rpc接口dubbo来实现接口，同时优化了数据结构和页面逻辑，功能基本可用，持续完善中。。。
原项目地址https://github.com/imalexyang/authManager


项目启动
zookeeper官网下载地址 http://www-us.apache.org/dist/zookeeper/
redis官网下载地址此版本为微软官方给redis做的windows版本实现 https://github.com/MicrosoftArchive/redis/releases

1.在mysql创建auth数据库并在库里执行项目中自带auth.sql

2.启动redis,zookeeper 修改项目配置文件jdbc.properties redis.properties

3.选择根目录 mvn clean install -Dmaven.test.skip=true

4.启动dubbo 选择目录./shiroAuth-rpc-service mvn exec:java -Dexec.mainClass=com.alibaba.dubbo.container.Main

5.然后选择tomcat启动 shiroAuth-web-server项目

目前功能基本可用,在持续完善中。
有问题加qq群 465400638咨询
