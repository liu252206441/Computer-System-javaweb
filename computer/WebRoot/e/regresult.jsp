<%@page import="com.daowen.bll.*"%>
<%@page import="com.daowen.entity.*,com.daowen.dal.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统注册</title>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/index.css" type="text/css"></link>

<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/register.css" type="text/css"></link>

<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/box.all.css" type="text/css"></link>

<script
	src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery-1.5.2.min.js"
	type="text/javascript"></script>

<script src="<%=SystemParam.getSiteRoot()%>/e/js/jquery.iFadeSldie.js"
	type="text/javascript"></script>



</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>

	<div class="wrap round-block">
		<div class="cover-title">
			当前位置：<a href="index.jsp">首页</a> &gt;&gt; <a href="register.jsp">系统注册结果</a>
		</div>
	
        <div style="min-height:600px;" class="whitebox">
            <h1>
                会员注册<strong>Register</strong></h1>
            <div class="reg-box">
                <div class="reg-title">
                 
                </div>
                <div class="msg-tip">
                    <div class="ico warning">
                    </div>
                    <div class="text">
                        <strong>恭喜你注册成功！</strong>
                        <a href="<%=SystemParam.getSiteRoot() %>/e/login.jsp">登录系统</a>
                    </div>
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
	</div>

	<div class="fn-clear"></div>



</body>
</html>