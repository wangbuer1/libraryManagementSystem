<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html lang="zh-CN" class="ax-vertical-centered">
<head>
    <%--<title>图书馆管理系统</title>--%>
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
                                <li><a href="<%=basePath%>student/student">修改</a></li>
                                <li role="presentation" class="divider"></li>
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
                    <a href="<%=basePath%>student/book"><i class="glyphicon glyphicon-chevron-right"></i> 图书查询</a>
                </li>
                <li>
                    <a href="<%=basePath%>student/borrowInfo"><i class="glyphicon glyphicon-chevron-right"></i> 借阅信息</a>
                </li>
                <%--<li>--%>
                    <%--<a href="#"><i class="glyphicon glyphicon-chevron-right"></i> 新书提醒</a>--%>
                <%--</li>--%>
                <%--<li>--%>
                    <%--<a href="#"><i class="glyphicon glyphicon-chevron-right"></i> 我的关注</a>--%>
                <%--</li>--%>
            </ul>
        </div>

        <!-- content -->
        <div class="col-md-10">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="text-muted bootstrap-admin-box-title">图书查询</div>
                        </div>
                        <div class="bootstrap-admin-panel-content">
                            <ul>
                                <li>根据图书编号、图书名称查询图书信息</li>
                                <li>可查询图书的编号、名称、分类、作者、价格、在馆数量等</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="text-muted bootstrap-admin-box-title">借阅信息</div>
                        </div>
                        <div class="bootstrap-admin-panel-content">
                            <ul>
                                <li>根据图书编号、图书名称查询自己借阅的图书信息</li>
                                <li>可查询除图书的基本信息、借阅日期、截止还书日期、超期天数等</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <%--<div class="col-md-6">--%>
                    <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                            <%--<div class="text-muted bootstrap-admin-box-title">图书查询</div>--%>
                        <%--</div>--%>
                        <%--<div class="bootstrap-admin-panel-content">--%>
                            <%--<ul>--%>
                                <%--<li>--%>
                                    <%--License: MIT (see below)--%>
                                <%--</li>--%>
                                <%--<li>--%>
                                    <%--License: MIT (see below)--%>
                                <%--</li>--%>
                                <%--<li>--%>
                                    <%--License: MIT (see below)--%>
                                <%--</li>--%>
                            <%--</ul>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="col-md-6">--%>
                    <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                            <%--<div class="text-muted bootstrap-admin-box-title">借阅信息</div>--%>
                        <%--</div>--%>
                        <%--<div class="bootstrap-admin-panel-content">--%>
                            <%--<ul>--%>
                                <%--<li>--%>
                                    <%--License: MIT (see below)--%>
                                <%--</li>--%>
                                <%--<li>--%>
                                    <%--License: MIT (see below)--%>
                                <%--</li>--%>
                                <%--<li>--%>
                                    <%--License: MIT (see below)--%>
                                <%--</li>--%>
                            <%--</ul>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="row">--%>
                <%--<div class="col-md-6">--%>
                    <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                            <%--<div class="text-muted bootstrap-admin-box-title">新书提醒</div>--%>
                        <%--</div>--%>
                        <%--<div class="bootstrap-admin-panel-content">--%>
                            <%--<ul>--%>
                                <%--<li>--%>
                                    <%--License: MIT (see below)--%>
                                <%--</li>--%>
                                <%--<li>--%>
                                    <%--License: MIT (see below)--%>
                                <%--</li>--%>
                                <%--<li>--%>
                                    <%--License: MIT (see below)--%>
                                <%--</li>--%>
                            <%--</ul>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="col-md-6">--%>
                    <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                            <%--<div class="text-muted bootstrap-admin-box-title">我的关注</div>--%>
                        <%--</div>--%>
                        <%--<div class="bootstrap-admin-panel-content">--%>
                            <%--<ul>--%>
                                <%--<li>--%>
                                    <%--License: MIT (see below)--%>
                                <%--</li>--%>
                                <%--<li>--%>
                                    <%--License: MIT (see below)--%>
                                <%--</li>--%>
                                <%--<li>--%>
                                    <%--License: MIT (see below)--%>
                                <%--</li>--%>
                            <%--</ul>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
            </div>
        </div>
    </div>
</div>
</body>
</html>