<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html lang="zh-CN" class="ax-vertical-centered">
<head>
    <title>图书馆管理系统</title>
    <base href="<%=basePath%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<%=basePath%>static/plugins/bootstrap-3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>static/plugins/bootstrap-3.3.5/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="<%=basePath%>static/plugins/bootstrap-3.3.5/css/bootstrap-admin-theme.css">
    <link rel="stylesheet" href="<%=basePath%>static/css/common.css">
    <script src="<%=basePath%>static/plugins/jquery-1.11.3/jquery.min.js"></script>
    <script src="<%=basePath%>static/plugins/bootstrap-3.3.5/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>static/plugins/bootstrap-3.3.5/js/bootstrap-dropdown.min.js"></script>
</head>
<body class="bootstrap-admin-with-small-navbar">
    <nav class="navbar navbar-default navbar-fixed-top bootstrap-admin-navbar bootstrap-admin-navbar-under-small" role="navigation">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="collapse navbar-collapse main-navbar-collapse">
                        <a class="navbar-brand" href="#"><strong>欢迎使用图书馆管理系统</strong></a>
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-hover="dropdown"> <i class="glyphicon glyphicon-user"></i> 欢迎您，${username} <i class="caret"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="<%=basePath%>logout">退出</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </nav>

    <div class="container">
        <!-- left, vertical navbar & content -->
        <div class="row">
            <!-- left, vertical navbar -->
            <div class="col-md-2 bootstrap-admin-col-left">
                <ul class="nav navbar-collapse collapse bootstrap-admin-navbar-side">
                    <li>
                        <a href="<%=basePath%>admin/book"><i class="glyphicon glyphicon-chevron-right"></i> 图书管理</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>admin/bookType"><i class="glyphicon glyphicon-chevron-right"></i> 图书分类管理</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>admin/borrow"><i class="glyphicon glyphicon-chevron-right"></i> 图书借阅</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>admin/return"><i class="glyphicon glyphicon-chevron-right"></i> 图书归还</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>admin/borrowInfo"><i class="glyphicon glyphicon-chevron-right"></i> 借阅查询</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>admin/admin"><i class="glyphicon glyphicon-chevron-right"></i> 管理员管理</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>admin/student"><i class="glyphicon glyphicon-chevron-right"></i> 学生管理</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>admin/setting"><i class="glyphicon glyphicon-chevron-right"></i> 系统设置</a>
                    </li>
                </ul>
            </div>

            <!-- content -->
            <div class="col-md-10">
                <%--<div class="row">--%>
                    <%--<div class="col-lg-12">--%>
                        <%--<div class="page-header">--%>
                            <%--<h1>介绍</h1>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>

                <div class="row">
                    <div class="col-md-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <a href="<%=basePath%>admin/book"><div class="text-muted bootstrap-admin-box-title">图书管理</div></a>
                            </div>
                            <div class="bootstrap-admin-panel-content">
                                <ul>
                                    <li>根据图书编号、图书名称查询图书基本信息</li>
                                    <li>添加、修改、删除图书</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <a href="<%=basePath%>admin/bookType"><div class="text-muted bootstrap-admin-box-title">图书分类管理</div></a>
                            </div>
                            <div class="bootstrap-admin-panel-content">
                                <ul>
                                    <li>根据分类名称查询图书分类信息</li>
                                    <li>添加、修改、删除图书分类</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <a href="<%=basePath%>admin/borrow"><div class="text-muted bootstrap-admin-box-title">图书借阅</div></a>
                            </div>
                            <div class="bootstrap-admin-panel-content">
                                <ul>
                                    <li>根据学号、图书编号借阅图书</li>
                                    <li>展示此学号的借阅信息</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <a href="<%=basePath%>admin/return"><div class="text-muted bootstrap-admin-box-title">图书归还</div></a>
                            </div>
                            <div class="bootstrap-admin-panel-content">
                                <ul>
                                    <li>根据学号、图书编号归还图书</li>
                                    <li>展示此学号的借阅信息</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <a href="<%=basePath%>admin/borrowInfo"><div class="text-muted bootstrap-admin-box-title">借阅查询</div></a>
                            </div>
                            <div class="bootstrap-admin-panel-content">
                                <ul>
                                    <li>展示所有学生的图书借阅信息</li>
                                    <li>可根据图书编号、图书名称、学号、姓名进行查询</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <a href="<%=basePath%>admin/admin"><div class="text-muted bootstrap-admin-box-title">管理员管理</div></a>
                            </div>
                            <div class="bootstrap-admin-panel-content">
                                <ul>
                                    <li>根据管理员编号、管理员名称查询管理员基本信息</li>
                                    <li>添加、修改、删除管理员基本信息</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <a href="<%=basePath%>admin/student"><div class="text-muted bootstrap-admin-box-title">学生管理</div></a>
                            </div>
                            <div class="bootstrap-admin-panel-content">
                                <ul>
                                    <li>根据学号、姓名查询学生基本信息</li>
                                    <li>添加、修改、删除学生信息</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <a href="<%=basePath%>admin/setting"><div class="text-muted bootstrap-admin-box-title">系统设置</div></a>
                            </div>
                            <div class="bootstrap-admin-panel-content">
                                <ul>
                                    <li>设置最多借阅天数</li>
                                    <li>设置最多借阅本数</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div>
    	<input type="hidden" id="basePath" value="<%=basePath%>"/>
    </div>
</body>
</html>