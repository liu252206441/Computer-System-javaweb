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
    Leaveword temobjleaveword=null;
    if( id!=null)
    {
      temobjleaveword=(Leaveword)DALBase.load("leaveword"," where id="+ id);
      request.setAttribute("leaveword",temobjleaveword);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>留言信息查看</title>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
</head>
<body >
	<div class="search-title">
		<h2>查看留言</h2>
		<div class="description"></div>
	</div>
	<table cellpadding="0" cellspacing="1" class="grid" width="100%">
		
		<tr>
			<td width="10%" align="right">时间:</td>
			<td><fmt:formatDate value="${requestScope.leaveword.pubtime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
		</tr>
	
		<tr>
			<td width="10%" align="right">状态:</td>
			<td>
			    <%if(temobjleaveword.getStatus()==0) {%>
			                   待回复
			    <%} %>
			    <%if(temobjleaveword.getStatus()==1) {%>
			                   已回复
			    <%} %>
			</td>
		</tr>
		
		<tr>
			<td width="10%" align="right">留言人:</td>
			<td>${requestScope.leaveword.lwren}</td>
		</tr>
		<tr>
			<td align="right">留言内容:</td>
			<td colspan="3">${requestScope.leaveword.dcontent}</td>
		</tr>
		<%if(temobjleaveword.getStatus()==1){ %>
		<tr>
			<td width="10%" align="right">回复人:</td>
			<td>${requestScope.leaveword.replyren}</td>
		</tr>
		<tr>
			<td width="10%" align="right">回复时间:</td>
			<td>
			  <fmt:formatDate value="${requestScope.leaveword.replytime}" pattern="yyyy-MM-dd hh:mm:ss"/>
			
			</td>
		</tr>
		<tr>
			<td width="10%" align="right">回复内容:</td>
			<td>${requestScope.leaveword.replycontent}</td>
		</tr>
		<%} %>
		
	</table>
</body>
</html>
