<%@page import="com.daowen.bll.*"%>
<%@page import="com.daowen.entity.*,com.daowen.dal.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<%@ include file="law.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员登录</title>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/box.all.css" type="text/css"></link>

<script src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery-1.8.3.min.js"
	type="text/javascript"></script>





</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>

	<div class="wrap round-block">
		<div class="line-title">
			当前位置：首页>> 会员中心
		</div>
	
		
		   <div class="main">
		   
		       <jsp:include  page="menu.jsp"></jsp:include>
		       <div class="main-content">
					
					   <table cellpadding="0" cellspacing="1" class="grid" width="100%">
							<tr>
								<td width="15%" align="right" class="title">账号:</td>
								<td width="35%">${huiyuan.accountname}(${huiyuan.nickname})</td>
								<td width="*" colspan="2" rowspan="5">
								  
								    <img  src="${huiyuan.touxiang}"  width="200" height="200"/>
								
								</td>
							</tr>
							
							
							<tr>
								<td align="right" class="title">用户类型:</td>
								<td>
								     <c:if test="${huiyuan.yue>100 }">
								                        游戏达人
								     </c:if>
								     <c:if test="${huiyuan.yue<100 }">
								                        普通用户
								     </c:if>
								</td>
							</tr>
							
							<tr>
								<td align="right" class="title">姓名:</td>
								<td>${huiyuan.name}</td>
							</tr>
							
							<tr>
								<td align="right" class="title">性别:</td>
								<td>${huiyuan.sex}</td>
							</tr>
							<tr>
								<td align="right" class="title">登录次数:</td>
								<td>${huiyuan.logtimes} 次</td>
							</tr>
							<tr>
								<td align="right" class="title">注册时间:</td>
								<td>
								    
								   <fmt:formatDate value="${huiyuan.regdate}" pattern="yyyy-MM-dd"/> 
								</td>
							</tr>
						
							<tr>
								<td align="right" class="title">手机:</td>
								<td>${huiyuan.mobile}</td>
							
								<td width="15%" align="right" class="title">邮箱:</td>
								<td width="35%">${huiyuan.email}</td>
							</tr>
							
							
						</table>
					
					</div>
		   </div>
			
		</div>
		


	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>