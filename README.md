本项目采用dubbo框架作为rpc服务，并运用了maven的多模块结构

启动说明

1.运行需要先执行init.sql


2.在management-rpc-service/conf/application.properties对db地址 zk地址进行变更 需提供mysql和zk服务


3.启动rpc服务 运行management-rpc-service\src\main\java\com\babysky\management\Application.java 里的main方法


4.启动web服务 修改management-web-server下的配置文件 zk地址 web上下文 redis地址和密码等 management-web-server\src\main\java\com\babysky\management\Bootstrap.java 里的main方法