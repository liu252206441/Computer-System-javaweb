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
    String command="add";
    if( id!=null)
    {
      command="update";
      Qiandao temobjqiandao=(Qiandao)DALBase.load("qiandao"," where id="+ id);
      request.setAttribute("qiandao",temobjqiandao);
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
  <title>信息查看</title>
    <link rel="stylesheet" href="<%=SystemParam.getSiteRoot()%>/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot()%>/e/css/register.css" type="text/css"></link>
<link href="<%=SystemParam.getSiteRoot()%>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
<script src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
</head>
<body >
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap">
		<div class="cover-title">
			当前位置：<a href="<%=SystemParam.getSiteRoot()%>/e/index.jsp">首页</a> &gt;&gt; 管理
		</div>
	</div>
	<div class="wrap">
		<div class="main">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">	
			       <!-----开始---->
			               <table cellpadding="0" cellspacing="1" class="grid" width="100%" >
											   <tr>
											   <td align="right">日期:</td>
											   <td>
												   ${requestScope.qiandao.qddate}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >会员名:</td>
											   <td>
												   ${requestScope.qiandao.hyname}
												</td>
											   </tr>
				        </table>
			        <!-----结束---->
			</div>
	     </div>
	</div>
</body>
</html>
