<%@page import="com.daowen.uibuilder.ShangpinBuilder"%>
<%@page import="com.daowen.uibuilder.ProductViewHistory"%>
<%@page import="java.util.*"%>
<%@page import="com.daowen.bll.*"%>
<%@page import="com.daowen.entity.*,com.daowen.dal.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <%
  
            String id=request.getParameter("id");
            Shangpin shangpin=null;
            if(id!=null){
            
                 shangpin=(Shangpin)DALBase.load(Shangpin.class,new Integer(id));
                
                if(shangpin!=null)
                   request.setAttribute("shangpin",shangpin);
                
            }
  
   %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统首页</title>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/index.css" type="text/css"></link>

<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" type="text/css"></link>

<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/box.all.css" type="text/css"></link>

<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/leaveword.css" type="text/css"></link>

<script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>

    <script type="text/javascript">
    
            $(function(){
               
                 
            	 $("#btnShoucang").click(function(){
         	    	
       	    	  
       	    	  var temaccountname= $("#scren").val(); 
       	    	  var temshoucangbackurl=$("#hidShoucangbackurl").val();
       	    	  if(temaccountname==""){
                         
                         window.location.href="login.jsp?returnurl="+temshoucangbackurl;
                         return false;
                        
                      }
       	    	  
       	    	   return true;
       	      
       	      
       	      });
            	
                 
            });
    
    
    </script>
    
    
    <%
     
        ProductViewHistory.View(request, response, id);
    
    
    %>
   

    

</head>
<body>
    <input type="hidden" id="commentresurl" value="/e/shangpininfo.jsp?id=<%=id%>">
	
	<jsp:include page="head.jsp"></jsp:include>
	
	<div class="wrap round-block">
	  <div class="line-title">
                   当前位置：<a href="<%=SystemParam.getSiteRoot() %>/e/index.jsp">首页</a> &gt;&gt; 商品信息
      </div>
	
	<input type="hidden" id="reUrl" name="reurl" value="/e/shangpininfo.jsp?id=<%=id%>"/>

	<div class="fn-clear"></div>
	
	
	<div class="show-details">
			<div class="picture-box">
				<img id="imgTupian" src="${requestScope.shangpin.tupian}" />
				<div class="operation">
					<div class="ticket-price">${shangpin.jiage }元</div>
				</div>
			</div>
			<div class="text-box">
				<div class="title">${requestScope.shangpin.name}</div>
				<div class="sub-title">${shangpin.subtitle }</div>
				<div>
					<ul>
						<li><strong>名称:</strong> ${requestScope.shangpin.name}</li>
						<li><strong>商品编号:</strong> ${requestScope.shangpin.spno}
						</li>
						<li><strong>品牌:</strong> ${requestScope.shangpin.pinpai}
						</li>
						<li><strong>价格:</strong>
							<c:if test="${shangpin.dazhe==1 }">
								<span class="dazhe">
								    ${requestScope.shangpin.jiage}元
								</span>
								<span class="normal-price"> ${requestScope.shangpin.hyjia}元</span>
							</c:if>
							<c:if test="${shangpin.dazhe==0 }">
								
								<span class="normal-price"> ${requestScope.shangpin.hyjia}元</span>
							</c:if>
					    </li>
						<li><strong>积分兑换:</strong>   
						    <c:if test="${shangpin.tuihuan==1 }">
						           <%=shangpin.getJiage()*20 %>分
						     </c:if>
						     <c:if test="${shangpin.tuihuan==0 }">
						                      不能积分兑换
						     </c:if>
						  </li>
						
		               <li>
		                <form method="post" action="<%=SystemParam.getSiteRoot()%>/admin/shoucangmanager.do">
                                         <input type="hidden" name="bookid" value="<%=id%>"/>
                                          <input type="hidden" name="bookname" value="${shangpin.name}"/>
                                          <input type="hidden" name="tupian" value="${shangpin.tupian}"/>
                                         <input type="hidden" name="actiontype" value="save"/>
                                         <input type="hidden" id="scren" name="scren" value="${huiyuan.accountname}"/>
                                         <input type="hidden" name="forwardurl" value="/e/shangpininfo.jsp?id=<%=id%>"/>
                                          <input type="hidden" name="errorurl" value="/e/shangpininfo.jsp?id=<%=id%>"/>
                                      
                                 <%if(shangpin.getKucun()>=1){ %>   
	                                 <a id="btnIncart" class="btn btn-default" href="<%=SystemParam.getSiteRoot() %>/admin/dingdanmanager.do?actiontype=shopcart&spid=<%=id%>&forwardurl=/e/shopcart.jsp" > 
	                                     <i class="fa fa-plus"></i>加入购物车
	                                  </a>
                                   <%}else{ %>
                                     <span class="btn btn-default">库存不足</span>
                                   <%} %>
                                   
                                         <button  id="btnShoucang" class="btn btn-default"><i class="fa fa-star"></i>收藏商品</button>
                                    </form>
                                    
                                     ${errormsg}
                          
		               </li>
					</ul>
				</div>
				
			</div>
		</div>
	
	   
	  <%=new ShangpinBuilder().buildViewedProduct(request)%>
	
	   <div class="brief-title">介绍</div>
		    
		    <div class="brief-content">${requestScope.shangpin.jieshao}</div>
	
                
           <jsp:include page="comment.jsp">
              <jsp:param value="shangpin" name="commenttype"/>
           </jsp:include>
		
		</div>
		
	</div>
	
	
	
	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>