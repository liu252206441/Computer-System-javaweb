<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.daowen.bll.*"%>
<%@page import="com.daowen.entity.*,com.daowen.dal.*"%>
 <%   
   
      String gcommentbelongid=request.getParameter("id");
      
      String commenttype=request.getParameter("commenttype");
 
 
  %>
  
      <script type="text/javascript">
         
              $(function(){
                
            	  $("[name=dcontent]").keydown(function(){
            		 
            		  var maxLength= $(this).attr("maxlength");
            		  
            		  var hasInputed=$(this).val().length;
            		  
            		  if(hasInputed<maxLength);{
            			  
            			  $("#hasInputedCount").html(hasInputed);
            			  $("#removeCount").html(maxLength-hasInputed);
            			  
            			  
            		  }
            		  
            		  
            	  });
                  $("#btnComment").click(function(){
                      var temaccountname= $("#hidCurrenthy").val();
                      var temreturnurl=$("#commentresurl").val();
                     
                      var temdcontent=$("[name=dcontent]").val();
                      $("#forwardurl").val(temreturnurl);
                     
                      
                      if(temaccountname==""){
                         
                         window.location.href="login.jsp?reurl="+temreturnurl;
                         return false;
                        
                      }
                    
                      if(temdcontent==""){
                          alert("请填写评论内容");
                          return false;
                      }
                      if(temdcontent.length<8){
                       
                           alert("评论内容至少8个字符");
                           return false;
                      }
                     
                  });

              })
        
     </script>
<div class="comment-box">
			<div class="comment-list">
				
				<%=CommentBLL.getComments(commenttype,gcommentbelongid) %>
				
			</div>

			

	</div>
    