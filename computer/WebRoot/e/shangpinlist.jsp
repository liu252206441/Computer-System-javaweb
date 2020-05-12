

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.daowen.uibuilder.*" %>
<%@ page import="com.daowen.dal.*" %>
<%@page import="com.daowen.bll.*,java.util.*,java.text.*,com.daowen.entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统首页</title>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/index.css" type="text/css"></link>
<link href="<%=SystemParam.getSiteRoot() %>/e/css/box.all.css"  rel="stylesheet" type="text/css"/>

<script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {

        });
    </script>

</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>
	
  
	<div class="fn-clear"></div>
	<div class="wrap" style="min-height:600px;overflow:hidden;margin-top:20px;">
       <div style="width:200px;float:left;overflow:hidden">
        <div class="catebox">
            <div class="title">商品类别</div>
            <div class="content">
                <%=new SpcategoryBuilder().BuildNavMenu() %>
            </div>
            
        </div>
        
        <%
              List<Shangpin> hotsaledlist=DALBase.getTopList("shangpin"," where hot=1 order by id desc ",5);
		
        %>
        <div class="catebox">
             <div class="title">今日热销</div>
              <div class="content">
              <ul>
              
                <%if(hotsaledlist!=null)
                	{
                	  for(Shangpin temshangpin : hotsaledlist)
                	    { %>
                	
                <li>
                 <a href="<%=SystemParam.getSiteRoot() %>/e/shangpininfo.jsp?id=<%=temshangpin.getId() %>" target="self">
				     <img src="<%=temshangpin.getTupian() %>" width="120" height="120">
				 </a>
				<div class="name">
				<p><%=temshangpin.getName() %></p>
				<div class="price"><em>￥ <b><%=temshangpin.getHyjia() %></b></em></div>
				</div>
				</li>
				<%}} %>
                 </ul> 
              </div>
        
        </div>
        
        
        
        
        </div>
        <div  style="float: right;width:915px;">
          
          <%
		   String strspcid=request.getParameter("spcid");
		   int  spcid=1;
		   if(strspcid!=null)
		   {
		     spcid= Integer.parseInt(strspcid);
		   }
		%>
		
		<%ShangpinBuilder  shangpinbuilder=new ShangpinBuilder(); %>
        <%=shangpinbuilder.buildImageShangpin(spcid, -1) %>
		
			
        
        </div>
			
	</div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>