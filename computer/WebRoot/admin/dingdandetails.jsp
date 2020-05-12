<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.text.*"%>
<%@ page import="com.daowen.bll.*"%>
<%@ page import="com.daowen.entity.*"%>
<%@page import="com.daowen.dal.DALBase"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
	String id = request.getParameter("id");

	Dingdan temobjdingdan=null;
	if (id != null) {
		
	    temobjdingdan = (Dingdan) DALBase.load("dingdan",
				" where id=" + id);
		request.setAttribute("dingdan", temobjdingdan);
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>订单信息查看</title>
<link href="<%=SystemParam.getSiteRoot()%>/admin/css/web2table.css"
	rel="stylesheet" type="text/css" />
<link href="<%=SystemParam.getSiteRoot()%>/admin/css/layout.css"
	rel="stylesheet" type="text/css" />
<link href="<%=SystemParam.getSiteRoot()%>/admin/css/menu.css"
	rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript"
	src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery-1.9.0.js"></script>
</head>
<body>
	<div class="search-title">
		<h2>订单管理-> 查看订单</h2>
		<div class="description"></div>
	</div>
	<table cellpadding="0" cellspacing="1" class="grid" width="100%">

		<tr>
			<td align="right">订单号:</td>
			<td>${requestScope.dingdan.ddno}</td>

			<td align="right">下单时间:</td>
			<td>${requestScope.dingdan.xiadantime}</td>
		</tr>
		<tr>
			<td align="right">下单人:</td>
			<td>${requestScope.dingdan.xiadanren}</td>

			<td align="right">总价格:</td>
			<td>${requestScope.dingdan.totalprice}</td>
		</tr>
		<tr>
			<td align="right">状态:</td>
			<td>${requestScope.dingdan.status}</td>


			<td align="right">收货地址:</td>
			<td>${requestScope.dingdan.shouhuodizhi}</td>
		</tr>
		<tr>
			<td align="right">收货人电话:</td>
			<td>${requestScope.dingdan.shrtel}</td>

			<td align="right">收货人姓名:</td>
			<td>${requestScope.dingdan.shrname}</td>
		</tr>

		<tr>
			<td colspan="4">

				<table border="0" cellspacing="1" class="whitegrid" cellpadding="0"
					width="100%">

					<tr>
						<td>快照</td>
						<td>商品名</td>
						<td>商品数量</td>
						<td>商品价格(元)</td>
					</tr>

					<%
						List<Dingdanitems> listdingdanitems = DALBase.getEntity(
								"dingdanitems", "where ddno='" + temobjdingdan.getDdno()
										+ "'");

						for (Dingdanitems items : listdingdanitems) {
					%>
					<tr>

						<td bgcolor="#ffffff"><img src='<%=items.getSpimage()%>'
							width="60px" height="60px" /></td>
						<td><%=items.getSpname()%></td>

						<td><%=items.getShuliang()%></td>

						<td><%=items.getJiage()%>￥</td>
					</tr>

					<%
						}
					%>
				</table>
			</td>
		</tr>

		
		

	</table>
</body>
</html>
