<%@page import="com.daowen.util.HTMLUtil"%>
<%@page import="com.daowen.dal.DALBase"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="com.daowen.entity.*,com.daowen.dal.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.daowen.uibuilder.*,com.daowen.bll.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统公告</title>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/box.all.css" type="text/css"></link>
<script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
</head>

<%

     List<Notice>  noticelist=DALBase.getEntity("notice", " order by pubtime desc");

%>

<body>
	<jsp:include page="head.jsp"></jsp:include>
	
	<div class="fn-clear"></div>
	<div class="row-flow">
		<div class="wrap">
			<div style="width:100%;min-height:600px;" class="column">
				<div class="directory">
		  
		     <div class="directory-title">
		          <div class="introduce">系统公告</div>
     	     </div>
     	     <div class="directory-content">
     	     
     	         <ul>
     	            <% 
     	           SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
     	              for(Iterator it=noticelist.iterator();it.hasNext();){ 
     	              
     	                  Notice temnotice=(Notice)it.next();
     	            
     	            %>
     	                 
     	            <li>
     	               
     	                <div class="text">
     	                    <div class="text-title"><a href="<%=SystemParam.getSiteRoot()%>/e/noticeinfo.jsp?id=<%=temnotice.getId()%>"><%=temnotice.getTitle() %></a></div>
     	                    <div class="subtitle">
     	                                                                发布时间:<span><%=sdf.format(temnotice.getPubtime()) %></span>
     	                                                                 发布人:<span><%=temnotice.getPubren() %></span>  
     	                                                                浏览次数: <span><%=temnotice.getClickcount() %></span>                                     
     	                                                                
     	                    
     	                    </div>
     	                    <div class="text-content">
                                  <%=HTMLUtil.subStringInFilter(temnotice.getDcontent(), 0, 200) %>                                              
                             </div>
     	                </div>
     	            </li>
     	            <%} %>
     	         </ul>
     	        
     	     </div>
		  
		</div>
			</div>
			
		</div>
	</div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
 </body>
</html>
