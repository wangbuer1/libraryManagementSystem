# 基于SSM的图书馆管理系统

## 1、项目介绍

基于SSM的图书馆管理系统5拥有两个角色，分别为管理员和学生，具体功能如下：

管理员：图书管理、分类管理、图书借阅管理、图书归还管理、借阅查询、学生管理

学生：图书借阅、借阅信息


## 2、项目技术

后端框架：SSM（Spring、SpringMVC、Mybatis）

前端框架：Bootstrap、jsp、css、JavaScript、JQuery

## 3、开发环境

- JAVA版本：JDK1.8，其它版本理论上可以
- IDE类型：IDEA、Eclipse、Myeclipse都可以。推荐IDEA与Eclipse
- tomcat版本：Tomcat 7.x、8.x、9.x、10.x版本均可
- 数据库版本：MySql 5.x
- 硬件环境：Windows 或者 Mac OS


## 4、功能介绍

### 4.1 登录

![批注 2020-04-01 223310](https://gitee.com/buer_wang/project-drawing-bed/raw/master/Typora-Images/20220513204933.jpg)

管理员和学生均可以通过此界面登录至系统。

### 4.2 学生模块

![学生-图书借阅](https://gitee.com/buer_wang/project-drawing-bed/raw/master/Typora-Images/20220513205208.jpg)

![学生-查询图书详情](https://gitee.com/buer_wang/project-drawing-bed/raw/master/Typora-Images/20220513205211.jpg)

![学生-借阅信息](https://gitee.com/buer_wang/project-drawing-bed/raw/master/Typora-Images/20220513205217.jpg)

- 图书借阅：学生可以通过图书编号和图书名称多条件查询筛选图书信息，还可以查看图书的详细信息、预约图书、直接借书。
- 借阅信息：学生还可以查看自己的借阅信息，并归还图书。在借阅信息界面中，会显示图书的借阅日期、截止还书日期、超期天数等信息。

### 4.3 管理员模块

![管理员-首页](https://gitee.com/buer_wang/project-drawing-bed/raw/master/Typora-Images/20220513210048.jpg)

![管理员-图书管理](https://gitee.com/buer_wang/project-drawing-bed/raw/master/Typora-Images/20220513210128.jpg)

![管理员-借阅查询](https://gitee.com/buer_wang/project-drawing-bed/raw/master/Typora-Images/20220513210135.jpg)

![管理员-图书归还](https://gitee.com/buer_wang/project-drawing-bed/raw/master/Typora-Images/20220513210137.jpg)

- 图书管理：管理员可以通过图书编号和名称多条件查询图书，然后对图书进行查看、增加、修改和删除操作
- 分类管理：管理员可以对图书分类进行增删改查操作
- 图书借阅：管理员可以通过学生编号和图书编号为学生借阅图书
- 图书归还：管理员可以通过学生编号和图书编号为学生还书，在图书归还界面有借阅的详细信息，例如超期天数、罚款金额、借阅日期等
- 借阅查询：管理员可以通过图书编号、学号等条件查询图书馆的借阅信息
- 学生管理：管理员可以对学生信息进行增删改查操作
- 系统设置：管理员可以设置图书最多借阅天数、学生最多借阅本数、超期罚款金额等

## 5、视频演示

[点击播放视频，视频位于文章最后](https://mp.weixin.qq.com/s/N4ZBCGCYag8Fu5BzwFlglg)

## 6、获取方式

关注公众号： **程序员王不二**，回复 “**图书馆5**” ，即可获取完整版的项目代码。此公众号持续分享各种免费java项目源码。

![image-20220509000010316](https://gitee.com/buer_wang/project-drawing-bed/raw/master/Typora-Images/20220509000012.png)

## 7、其它项目

* [点击访问各种项目源码](https://mp.weixin.qq.com/s?__biz=MzkwMjM1MjM0Ng==&mid=2247483834&idx=1&sn=40517cecf36ce5d7663ed774a033fa2c&chksm=c0a79d0ff7d0141943c5d8da40b489e8ecdda5c345568776f475576506c76a954bd8238dc4f5#rd)
* [SSM框架项目](https://mp.weixin.qq.com/mp/appmsgalbum?__biz=MzkwMjM1MjM0Ng==&action=getalbum&album_id=2387377591113859072#wechat_redirect)

* [springboot项目](https://mp.weixin.qq.com/mp/appmsgalbum?__biz=MzkwMjM1MjM0Ng==&action=getalbum&album_id=2387377898791223296#wechat_redirect)

* [简单无框架项目](https://mp.weixin.qq.com/mp/appmsgalbum?__biz=MzkwMjM1MjM0Ng==&action=getalbum&album_id=2387378317047218183#wechat_redirect)

  

