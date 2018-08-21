本项目采用dubbo框架作为rpc服务，并运用了maven的多模块结构

启动说明

1.运行需要先执行init.sql

2.启动rpc服务 在management-rpc-service\src\main\resources\application.properties对db地址 zk地址进行变更 需提供mysql和zk服务
运行management-rpc-service\src\main\java\com\babysky\management\Application.java 里的main方法

3.启动web服务 修改management-web-server下的配置文件 zk地址 web上下文 redis地址和密码等
运行management-web-server\src\main\java\com\babysky\management\Bootstrap.java 里的main方法

4.登陆帐号admin 密码123456

5.项目demo访问地址www.haochen.online，数据每10分钟重置

6.拦截器中有防重复登陆配置，帐号同时登陆 先登陆用户会被后登陆踢下线

有使用和发布问题加群833825797讨论
