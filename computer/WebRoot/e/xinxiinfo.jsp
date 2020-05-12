<%@page import="java.text.MessageFormat"%>
<%@page import="com.daowen.bll.*"%>
<%@page import="com.daowen.entity.*,com.daowen.dal.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <%
  
            String id=request.getParameter("id");
             Xinxi xinxi=null;
            if(id!=null){
            
                xinxi=(Xinxi)DALBase.load(Xinxi.class,new Integer(id));
                
                if(xinxi!=null){
                    xinxi.setClickcount(xinxi.getClickcount()+1);
                    DALBase.update(xinxi);
                	request.setAttribute("xinxi",xinxi);
                }
                
            }
           
  
   %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统首页</title>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/index.css" type="text/css"></link>

<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/register.css" type="text/css"></link>

<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/leaveword.css" type="text/css"></link>


<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/box.all.css" type="text/css"></link>

    <script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.5.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
    
            $(function(){
               
                 $("#btnAgree").click(function(){
		                  
		                  var temaccountname= $("#hidCurrenthy").val();
		                  var temreurl=$("#reUrl").val();
		                  if(temaccountname==""){
		                          
	                         window.location.href="login.jsp?reurl="+temreurl;
	                         return;
	                        
	                      }
	                     
	                      $.ajax({
		                     
		                        url:encodeURI('<%=SystemParam.getSiteRoot()%>/admin/xinximanager.do?actiontype=agree&id=${xinxi.id}'),
					            method:'get',
					            
					            success:function(data){
					               
					            	 $("#btnAgree [name=count]").html(data);
					            },
					            error:function(xmhttprequest,status,excetpion){
					                alert("系统错误，错误编码"+status);
					            }
		                  });
	                      
                  });
                  
                   $("#btnAgainst").click(function(){
		                  
		                  var temaccountname= $("#hidCurrenthy").val();
		                  var temreurl=$("#reUrl").val();
		                  if(temaccountname==""){
		                          
	                         window.location.href="login.jsp?reurl="+temreurl;
	                         return;
	                        
	                      }
	                     
	                      $.ajax({
		                     
		                        url:encodeURI('<%=SystemParam.getSiteRoot()%>/admin/xinximanager.do?actiontype=against&id=${xinxi.id}'),
					            method:'get',
					            
					            success:function(data){
					            	$("#btnAgainst [name=count]").html(data);
					            },
					            error:function(xmhttprequest,status,excetpion){
					                alert("系统错误，错误编码"+status);
					            }
		                  })
	                      
                  })
                 
            })
    
    
    </script>
    
    
    
   

    

</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>
	
	<div class="wrap round-block">
	  <div class="line-title">
                   当前位置：<a href="<%=SystemParam.getSiteRoot() %>/e/index.jsp">首页</a> &gt;&gt; <a>系统信息</a>
      </div>
	
		<input type="hidden" id="commentresurl" value="/e/xinxiinfo.jsp?id=<%=id%>">
	<input type="hidden" id="reUrl" name="reurl" value="/e/xinxiinfo.jsp?id=<%=id%>"/>

	<div class="fn-clear"></div>
	
	
		<div style="width:100%" class="fn-left">
		 
		   <div class="info">
                    <h1>
                           ${xinxi.title}
                    </h1>
                    <h5>
                                                         来源: ${xinxi.pubren}
                                                        浏览:<span id="count">2次</span>
                                                         发布时间：<fmt:formatDate value="${xinxi.pubtime}" pattern="yyyy-MM-dd hh:mm:ss"/>
                    </h5>
                    <div class="news-content">
                        <p>
                            ${xinxi.dcontent}  
                        </p>
                       
                    </div>
                    
                    <div class="album-action">
					   <span id="btnAgree" class="btn btn-default"><i class="fa fa-thumbs-up"></i> 赞<span name="count">${xinxi.agreecount}</span></span>
					   
					   <span id="btnAgainst" class="btn btn-default"><i class="fa fa-thumbs-down"></i> 踩<span name="count">${xinxi.againstcount}</span></span>
					    
                    
                      </div>  
                </div>
               
               
		
		</div>
		

	</div>
	
	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>