<%@page import="com.daowen.uibuilder.*"%>

<%@ page language="java" import="com.daowen.bll.SystemParam" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.daowen.bll.* ,com.daowen.entity.*"%>
 
 <script type="text/javascript">
  
    $(function(){
      
    	
      
      $(".exit").click(function(){
          
            var pageurl_pagescope= $("#pageurl_pagescope").val();
            
            $.ajax({
		                     
		              url:encodeURI('<%=SystemParam.getSiteRoot()%>/admin/huiyuanmanager.do?actiontype=exit'),
					   method:'get',
					   success:function(){
					      window.location.reload();
					  },
					  error:function(xmhttprequest,status,excetpion){
					     $.alert("系统错误，错误编码"+status);
					  }
		     });

      });
      
      $(".main-nav .menus li a").removeClass("current");
	      var headid='<%=request.getParameter("headid")%>';
	      if (headid != '') {
	           
	     	 $("#"+headid).addClass("current");
	 	 }
    
      
      
    });

</script>
 
<%
      Huiyuan temhy=(Huiyuan)request.getSession().getAttribute("huiyuan");
      if(temhy!=null)
         request.setAttribute("huiyuan", temhy);
      String spname=request.getParameter("spname");
      if(spname!=null)
    	  request.setAttribute("spname", spname);
      
     
   
     

 %>

  
 <div id="header_top">
  <div id="top">
    <div class="Inside_pages">
      <div class="Collection">
                          <em></em><a href="#">收藏我们</a>
      </div>
	<div class="hd_top_manu clearfix">
	  <ul class="clearfix">
	  <li class="hd_menu_tit zhuce" >
	  <%if(temhy!=null){ %>
	       
	       欢迎<a href="<%=SystemParam.getSiteRoot() %>/e/huiyuan/accountinfo.jsp">${huiyuan.accountname }</a>！
	       <span  class="red exit">退出</span> 
	   <%} else{
	   %>
	   <a href="<%=SystemParam.getSiteRoot() %>/e/login.jsp"  class="red">[登录]</a> 
	   <%} %>
	     <a href="<%=SystemParam.getSiteRoot() %>/e/register.jsp" class="red">[免费注册]</a>
	       
	       
	       </li>
	   
	   <li class="hd_menu_tit" > <a href="<%=SystemParam.getSiteRoot()%>/e/shopcart.jsp">购物车(<b>0</b>)</a> </li>
	   <li class="hd_menu_tit" ><a href="<%=SystemParam.getSiteRoot()%>/admin/login.jsp">系统后台</a></li>
	  
	  </ul>
	</div>
    </div>
  </div>
  <!--样式-->
<!--顶部样式2-->
<div  class="header page_style">
  <div class="logo">
     <div style="font-size: 28px; color:#127bab; font-weight: bold; width:400px; line-height:30px; font-family:tahoma, arial, Microsoft YaHei, Hiragino Sans GB; padding: 35px 10px;" class="fn-left">
                          电脑销售信息管理系统
            
      </div>
  
  </div>
  
  <!--结束图层-->
  <div class="Search">
  
     <form id="searchForm"  action="<%=SystemParam.getSiteRoot() %>/e/searchsp.jsp" method="post" >
           <input   type="hidden" name="actiontype" value="search" />
            <input type="hidden" name="forwardurl" value="/e/searchsp.jsp" />
            <input name="spname" type="text"  value="${spname}" class="text"><input  type="submit" value="搜 索" class="Search_btn">
     </form>
   
	
</div>
<!--可修改图层2-->
  <!--<div class="festival1"><a href="#"><img src="images/logo_sd.png" /></a></div>--><!--结束-->
 <!--购物车样式-->
 <div class="hd_Shopping_list" id="Shopping_list">
   <div class="s_cart"><em></em><a href="<%=SystemParam.getSiteRoot()%>/e/shopcart.jsp">我的购物车</a> <i class="ci-right"></i><i class="ci-count" id="shopping-amount">0</i></div>
  	
 </div>
</div>
<!--菜单导航样式-->
<div id="Menu" class="clearfix">
<div class="Inside_pages">
  <div id="allSortOuterbox">
    <div class="t_menu_img"></div>
    <div class="Category"><a href="#"><em></em>所有产品分类</a></div>
       <!--菜单栏-->
		<div class="hd_allsort_out_box_new">
		 <!--左侧栏目开始-->
		     <%=new SpcategoryBuilder().BuildIndexMenu() %>
		</div>	
   
   
	</div>
	<!--菜单栏-->
	<div class="navigation" >
		<%=new SitenavBuilder().build("") %>		 
	</div>
	
  </div>
</div>
</div>

