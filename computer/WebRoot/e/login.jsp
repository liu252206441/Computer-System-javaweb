<%@page import="com.daowen.bll.*"%>
<%@page import="com.daowen.entity.*,com.daowen.dal.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%

       String reurl=request.getParameter("reurl");
       if(reurl!=null)
         request.setAttribute("reurl", reurl);
 %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员登录</title>

      <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="<%=SystemParam.getSiteRoot() %>/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script  type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validateex.js" ></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/messages_cn.js" ></script>

   <link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/index.css" type="text/css"></link>
    <link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/box.all.css" type="text/css"></link>
   <link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/register.css" type="text/css"></link>
   
   
<script type="text/javascript">
 
           $(function(){
	           
	            $.metadata.setType("attr","validate");
	            $("#form1").validate();
	        });  
 
 </script>


</head>
<body>
   <jsp:include page="head.jsp"></jsp:include>
	
	
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="<%=SystemParam.getSiteRoot() %>/e/index.jsp">首页</a> &gt;&gt; <a href="login.jsp">会员登录</a>
		</div>
	
		<div style="min-height:600px;" class="whitebox">

			<h1>用户登录</h1>
           <form name="form1" id="form1" method="post" action="<%=SystemParam.getSiteRoot()%>/admin/huiyuanmanager.do">
			<input type="hidden" name="actiontype" value="login" />
			
			<input type="hidden"  name="errorurl" value="/e/login.jsp"/>
			<input type="hidden"  name="usertype" value="0" />    
							
			<div class="reg-box">

				
				<div class="reg-content">
					
					<dl>
					    ${errormsg}
					</dl>
					<dl>
						<dt>用户名:</dt>
						<dd>
							<input type="text" value="${accountname}" validate="{required:true,messages:{required:'请输入账户名'}}" class="ui-input" id="txtHuiyuanname"
								name="accountname"> <i></i>

						</dd>

					</dl>

					<dl>
						<dt>密码:</dt>
						<dd>
							<input type="password" value="${password }" class="ui-input" validate="{required:true,messages:{required:'请输入密码'}}" id="txtPassword"
								name="password"> 
								<i>

								 </i>

						</dd>

					</dl>
			
					  
					                                     
					
					
				     <dl>
						<dt></dt>
						<dd>
							<input type="submit" class="btn btn-default" id="btnReigster"
								value="登录" name="btnReigster">
						</dd>

					</dl>
					<dl>
					
					    <dt></dt>
					    <dd> </dd>
					</dl>

                
				</div>


			</div>
          </form>

		</div>
		

	</div>

	<div class="fn-clear"></div>



</body>
</html>