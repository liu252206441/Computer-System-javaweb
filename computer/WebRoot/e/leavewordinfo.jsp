<%@page import="com.daowen.bll.*"%>
<%@page import="com.daowen.entity.*,com.daowen.dal.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统首页</title>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/index.css" type="text/css"></link>

<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/box.all.css" type="text/css"></link>

<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/leaveword.css" type="text/css"></link>
<script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/editor/lang/zh_CN.js"></script>
<script  type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validate.min.js"></script>
  <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.metadata.js" ></script>
  <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/messages_cn.js" ></script>
     <script type="text/javascript">
         
              $(function(){
                
            	  editor = KindEditor.create('textarea[name="dcontent"]', {
			            uploadJson : '../plusin/upload_json.jsp',
				        fileManagerJson : '../plusin/file_manager_json.jsp',
			            resizeType: 1,
				        allowFileManager: true
				  });
          	  
                  $("#btnLeaveword").click(function(){
                	  
                      var temaccountname= $("#hidCurrenthy").val();
                      var temgotourl=$("#reUrl").val();
                      editor.sync(); 
                      var temtitle=$("txtTitle").val();
                      var temdcontent=$("#txtDcontent").val();
                      if(temaccountname==""||temaccountname==""){
                          
                    	  window.location.href="login.jsp?gotourl="+temgotourl;
                          return false;
                        
                      }
                      
                      if(temtitle==""){
                       
                         alert("请输入留言标题");
                         return false;
                      }
                      if(temdcontent==""){
                          alert("请填写留言内容");
                          return false;
                      }
                      if(temdcontent.length<8){
                       
                           alert("留言内容至少8个字符");
                           return false;
                      }
                      
                      
                  });

              });
        
     </script>


</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>

	


	<div class="fn-clear"></div>
   
	<div class="wrap round-block" >
		<div class="ask-list" style="min-height: 600px;background-color:#fff;">
			<div class="title">
			       留言信息
			</div>
		
			<%=LeavewordBLL.getLeaveword() %>
			
		</div>
		
		  <div class="round-block" >
			 
			   <form id="leavewordForm" method="post"
					action="<%=SystemParam.getSiteRoot()%>/admin/leavewordmanager.do">
					
				    <input type="hidden" id="reUrl" name="reurl" value="/e/leavewordinfo.jsp"/>
					<input type="hidden" name="actiontype" value="save"/>
					<input type="hidden" id="hidCurrenthy" name="currenthy" value="${huiyuan.accountname}"/>
					<input type="hidden" id="hidPhoto" name="photo" value="${huiyuan.touxiang}"/>
					
			       <div >
			          
					  
			           <textarea  name="dcontent"  id="txtDcontent"  placeholder="在线留言"  style="width:100%;height:200px; "></textarea>
			         
			       </div>
			       <div >
			          
			           
			           <button id="btnLeaveword" class="btn btn-default"><i class="fa fa-check"></i>在线讨论</button>
			       </div>
			   </form>
			  
			</div>
			

	</div>
    </div>
	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>
    


</body>
</html>