<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.daowen.bll.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统首页</title>


   <link href="<%=SystemParam.getSiteRoot() %>/webui/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=SystemParam.getSiteRoot() %>/webui/bootstrap/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
   <script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
  
    <link href="<%=SystemParam.getSiteRoot() %>/admin/css/layout.css" rel="stylesheet" type="text/css" />
     <link
	href="<%=SystemParam.getSiteRoot()%>/webui/artDialog/skins/default.css"
	rel="stylesheet" type="text/css" />
   <script
	src="<%=SystemParam.getSiteRoot()%>/webui/artDialog/jquery.artDialog.source.js"
	type="text/javascript"></script>
   <script
	src="<%=SystemParam.getSiteRoot()%>/webui/artDialog/iframeTools.source.js"
	type="text/javascript"></script>
</head>
<body>
  <jsp:include page="header.jsp"></jsp:include>

  <jsp:include  page="menu.jsp"></jsp:include>
   <div class="right">
          
          <iframe   name="main"   width="100%" height="100%"  style="overflow:auto"  src="<%=SystemParam.getSiteRoot() %>/admin/accountinfo.jsp"  frameborder="0"></iframe>
     
    </div>
    
    <script src="<%=SystemParam.getSiteRoot()%>/webui/bootstrap/js/bootstrap.min.js"></script>
    

</body>
</html>
