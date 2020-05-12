<%@page import="com.daowen.bll.SystemParam"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script  type="text/javascript">
     
   $(function(){

      $("#side-menu .menu-group li").removeClass("current");
     
      var seedid='<%=request.getParameter("seedid")%>';
      
      if(seedid!="null")
         $("#"+seedid).addClass("current");
      else
        $("#m1").addClass("current");
      
   })

</script>
<div id="side-menu">

	<div class="menu-group">
		<h2>订单管理 </h2>
		<ul>
		
		    
		  	<li id="301" >
				<a  href="<%=SystemParam.getSiteRoot() %>/admin/dingdanmanager.do?seedid=301&xiadanren=${huiyuan.accountname}&isurl=1&actiontype=get&forwardurl=/e/huiyuan/dingdanmanager.jsp">我的订单</a>
			</li>
			
			
			
			<li id="303" >
				<a  href="<%=SystemParam.getSiteRoot() %>/admin/shoucangmanager.do?actiontype=get&scren=${huiyuan.accountname}&isurl=true&seedid=303&forwardurl=/e/huiyuan/shoucangmanager.jsp">我的收藏夹</a>
			</li>
			
			  
		 
			
		</ul>
	</div>
	
<div class="menu-group">
		<h2><i class="fa fa-cog"></i>安全中心 </h2>
		<ul>
		
		
		  
			<li id="203">
				<a href="<%=SystemParam.getSiteRoot() %>/e/huiyuan/modifypw.jsp?seedid=203" target="_self">登录密码修改</a>
			</li>
			<li id="204">
				<a href="<%=SystemParam.getSiteRoot() %>/e/huiyuan/modifypaypw.jsp?seedid=204" target="_self">支付密码修改</a>
			</li>
			
		</ul>
	</div>
	<div class="menu-group">
		<h2>
			账户信息
		</h2>
		<ul>
			<li id="101" class="current">
				<a  href="<%=SystemParam.getSiteRoot()%>/e/huiyuan/accountinfo.jsp?seedid=101">账户信息</a>
			</li>
			
			
			<li id="103">
				<a href="<%=SystemParam.getSiteRoot() %>/e/huiyuan/modifyinfo.jsp?seedid=103" target="_self">信息修改</a>
			</li>
			<li id="104">
				<a href="<%=SystemParam.getSiteRoot() %>/e/huiyuan/yue.jsp?seedid=104" target="_self">账户余额</a>
			</li>
			<li id="106" >
				<a  href="<%=SystemParam.getSiteRoot() %>/e/huiyuan/jifen.jsp?seedid=106">我的积分</a>
			</li>
         
		</ul>
	</div>




</div>