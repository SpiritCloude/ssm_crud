# SpringMVC + Spring + MyBatis 简单增删改

## 文件名	作用

src	根目录，下面有main和test。
- main	主要目录，可以放java代码和一些资源文件。
- - java	存放java代码，有dao service controller三层。。
- - resources	存放资源文件，譬如各种的spring，mybatis，log配置文件。
- - - mapper	存放dao中每个方法对应的sql，在这里配置，无需写daoImpl。
- - - spring	这里当然是存放spring相关的配置文件，
- - - sql	其实这个可以没有，但是为了项目完整性还是加上吧。
- - - webapp	这个貌似是最熟悉的目录了，用来存放我们前端的静态资源，如jsp js css。
- - - - static	这里的资源是指项目的静态资源，如js css images等。
- - - - WEB-INF	把jsp放在这里，另外就是web.xml配置。
- test	这里是测试分支。
- - java	测试java代码，应遵循包名相同的原则。

## MyBatis逆向生成
修改生成规则ssm_crud/generatorConfig.xml。启动/ssm_crud/src/test/java/cn/edu/test/MBDTest.java
