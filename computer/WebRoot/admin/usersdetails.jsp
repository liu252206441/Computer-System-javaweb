<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<%@ page import="com.daowen.bll.*"%>
<%@ page import="com.daowen.entity.*" %>
<%@page import="com.daowen.dal.DALBase"%>
<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
    
    if( id!=null)
    {
     
      Users temobjusers=(Users)DALBase.load("users"," where id="+ id);
      request.setAttribute("users",temobjusers);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>后台用户信息查看</title>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
</head>
<body >
	<div class="search-title">
		<h2>查看 后台用户</h2>
		<div class="description"></div>
	</div>
	<table cellpadding="0" cellspacing="1" class="grid" width="100%">
		<tr>
			<td width="10%" align="right">用户名:</td>
			<td>${requestScope.users.username}</td>
			<td colspan="2" rowspan="6"><img id="imgXiangpian" width="200px" height="200px"
				src="${requestScope.users.xiangpian}" /></td>
		</tr>
		
		<tr>
			<td align="right">创建时间:</td>
			<td>${requestScope.users.createtime}</td>
		</tr>
		<tr>
			<td width="10%" align="right">邮箱 :</td>
			<td>${requestScope.users.email}</td>
		</tr>
		<tr>
			<td width="10%" align="right">创建人:</td>
			<td>${requestScope.users.creator}</td>
		</tr>
		<tr>
			<td width="10%" align="right">登陆次数:</td>
			<td>${requestScope.users.logtimes}</td>
		</tr>
		<tr>
			<td width="10%" align="right">昵称:</td>
			<td>${requestScope.users.nickname}</td>
		</tr>
		<tr>
			<td width="10%" align="right">姓名:</td>
			<td>${requestScope.users.realname}</td>
		
			<td align="right">性别 :</td>
			<td>${requestScope.users.sex}</td>
		</tr>
		
		<tr>
			<td width="10%" align="right">电话号码:</td>
			<td>${requestScope.users.tel}</td>
		</tr>
	</table>
</body>
</html>
