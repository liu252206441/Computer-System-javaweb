<%@page import="com.daowen.bll.*"%>
<%@page import="com.daowen.entity.*,com.daowen.dal.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<%@ include file="law.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线充值-账户充值</title>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" type="text/css"></link>

<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/box.all.css" type="text/css"></link>

<script src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery-1.5.2.min.js"
	
	type="text/javascript"></script>
 <script  type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/messages_cn.js" ></script>

    <script type="text/javascript">
    
    
           $(function ()
            {
               
                $.metadata.setType("attr","validate");
                $("#chongzhiForm").validate();
            });  
    
    </script>



</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>

	<div class="wrap">
		<div class="line-title">
			当前位置：<a href="<%=SystemParam.getSiteRoot() %>/e/index.jsp">首页</a> &gt;&gt; 在线充值
		</div>
	</div>


	<div class="fn-clear"></div>

		<div class="wrap">
		
		   <div class="main">
		   
		       <jsp:include  page="menu.jsp"></jsp:include>
		       <div class="main-content">
					
					 <form name="chongzhiForm" action="<%=SystemParam.getSiteRoot() %>/admin/huiyuanmanager.do" id="chongzhiForm" method="post">
					   <input type="hidden" name="id" value="${huiyuan.id}"/>
					   <input type="hidden" name="actiontype" value="chongzhi"/>
					   <input type="hidden" name="forwardurl" value="/e/huiyuan/chongzhiresult.jsp"/>
						<table border="0" cellspacing="1" class="grid" cellpadding="0"
							width="100%">
							
							<tr>
							
							    <td align="right">
							                   账户余额
							    </td>
							    <td >
							      
							          <span style="font-size:24px;font-weight:800;color:#f00;">${huiyuan.yue}￥</span>
							    </td>
							    
							</tr>
							
							<tr>
								<td align="right">充值金额 :</td>
								<td align="left">
								    <input name="jine" style="width:80px" validate="{required:true,number:true,messages:{required:'请填写充值金额',number:'请填写正确充值金额'}}" type="text"id="txtJine" class="input-txt" />元
								</td>
								
							</tr>
							<tr>
							   <td colspan="2">
							        <div style="margin-left: 120px;">
								<input type="submit" value="充值" class="btn btn-default">
						    </div>
						
							   </td>
							</tr>
						
							
						</table>
						
						   
					</form>
					</div>
		   </div>
			
		</div>
		


	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>