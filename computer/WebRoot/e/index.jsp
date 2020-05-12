

<%@page import="com.daowen.bll.SystemParam"%>
<%@page import="com.daowen.uibuilder.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统首页</title>
<link href="<%=SystemParam.getSiteRoot() %>/e/css/index.css"  rel="stylesheet" type="text/css"/>
<link href="<%=SystemParam.getSiteRoot() %>/e/css/box.all.css"  rel="stylesheet" type="text/css"/>
<script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
<script src="<%=SystemParam.getSiteRoot()%>/e/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="<%=SystemParam.getSiteRoot()%>/e/js/common.js" type="text/javascript"></script>
<style type="text/css">
   .hd_allsort_out_box_new{
      display:block;
   }

</style>

    <script type="text/javascript">
        $(function () {

        	
        	$(".xiao_slideBox,.slideBox").slide({
        		titCell:".hd ul"
        		,mainCell:".bd ul",
        		autoPlay:true,
        		autoPage:true,
        		delayTime:500,
        		interTime:5000
        	});
           
        });
    </script>

</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>
		
	
<div class="Slide_style clear">

   	
   	 <%=FocusgraphicUibuilder.buildBigFocusGraphic() %>
   	
		
 </div>
 <%
      LanmuBuilder lmbuilder=new LanmuBuilder();
 %>
  
 <div class="wrap">
     
	
	
	   <%
	      ShangpinBuilder  shangpinbuilder=new ShangpinBuilder();
	   
	   %>
	   
	       
			  <div class="row-flow">
			      <div class="column" style="width:780px;">
			          
			             <!-- 最新商品信息   -->
	                         <%=shangpinbuilder.buildHotSale()%>
			      </div>
			      <div class="column" style="width:310px;">
			           <%=NoticeUibuilder.build() %>
			      </div>
			  </div>
	 
	   <!-- 推荐商品  -->
	  
         <%=new IndexColumnsBuilder().buildColumns() %>

		
	 
	</div>
	
	
	
  
 <div class="clearfix"></div>
	<jsp:include page="bottom.jsp"></jsp:include>

</body>
</html>