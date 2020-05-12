<%@page import="com.daowen.bll.*"%>
<%@page import="com.daowen.entity.*,com.daowen.dal.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<%@ include file="law.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员登录</title>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" type="text/css"></link>

<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/box.all.css" type="text/css"></link>

<script
	src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery-1.5.2.min.js"
	type="text/javascript"></script>





</head>
<body>

	<jsp:include page="/e/head.jsp"></jsp:include>
    <div class="fn-clear"></div>
	<div class="wrap">
		<div class="line-title">
			当前位置：<a href="index.jsp">首页</a> &gt;&gt; <a href="myindex.jsp">会员中心</a>
		</div>
	
		
		   <div class="main">
		   
		       <jsp:include  page="menu.jsp"></jsp:include>
		       <div class="main-content">
					
					
					<div class="search-title">
					<h2>我的积分
					   
					</h2>
					<div class="description"></div>
				     </div>
				     
				    <div style="padding:30px;font-size:18px;">
				                   我的积分<span style="font-size:24px;font-weight:800;color:#f00;">${huiyuan.jifen}分</span>
				                   
				             <a href="<%=SystemParam.getSiteRoot() %>/e/huiyuan/chongjifen.jsp" class="btn btn-default">充积分</a>
				                   
				    </div> 
			
					
		   </div>
			
		</div>
		


	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>




</body>
</html>