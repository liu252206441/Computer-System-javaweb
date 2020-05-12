<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
 <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="<%=SystemParam.getSiteRoot() %>/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <link href="<%=SystemParam.getSiteRoot() %>/webui/easydropdown/themes/easydropdown.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/webui/easydropdown/jquery.easydropdown.js" type="text/javascript"></script>  
    <script  type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/messages_cn.js" ></script>
    <script type="text/javascript">
            $(function (){
               
                $.metadata.setType("attr","validate");
                $("#payform").validate();
            });
    </script>
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
			<td><fmt:formatDate value="${requestScope.dingdan.xiadantime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
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
						<td>商品价格</td>
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

						<td><%=items.getJiage()%></td>
					</tr>

					<%
						}
					%>
				</table>
				
			</td>
		</tr>
		<tr>
		    <td>发货物流:</td>
		    <td>
		    
		        <select name="wltype" class="dropdown">
		              <option>顺风物流</option>
		              <option>申通物流</option>
		        </select>
		    
			</td>
		    <td>物流货单号</td>
		    <td>
		    <input name="wlorderno"  class="input-txt" type="text" 
					 validate="{required:true}" /></td>
		</tr>
			<tr>
						<td colspan="4">
						
						
						 <form name="payform" id="payform" method="post" action="<%=SystemParam.getSiteRoot()%>/admin/dingdanmanager.do">
						 
						      <input type="hidden" name="actiontype" value="fahuo"/>
						      
						      <input type="hidden" name="fahuoren" value="${adminuser.username}"/>
						      
						      <input type="hidden" name="forwardurl" value="/admin/fahuoresult.jsp"/>
						      <input type="hidden" name="ddid" value="<%=id%>"/>
						      <span >
						          <input type="submit" class="orange-button" value="发货"/>
						       </span>
						 
						 </form>
						 
						   
						
						</td>
						
					</tr>

		
	</table>
</body>
</html>
