<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<%@ page import="com.daowen.bll.*"%>
<%@ page import="com.daowen.entity.*" %>
<%@page import="com.daowen.dal.DALBase"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>后台用户</title>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="<%=SystemParam.getSiteRoot() %>/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script  type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validateex.js" ></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/messages_cn.js" ></script>
    <link href="<%=SystemParam.getSiteRoot() %>/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery-form/jquery.form.js"></script>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
    <script src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
     <link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript">
        function initControl(){
	$("#txtCreatetime").datepicker({
                         dateFormat:'yy-mm-dd'
                      }).datepicker("setDate",new Date());
                   //开始绑定
                    //结束绑定
			           $('#btnulXiangpian').uploadify({  
			                'formData': { 'folder': '<%=SystemParam.getSiteRoot()%>/Upload' },  
			                'buttonText': '选择图片',  
			                'buttonClass': 'browser',  
			                'removeCompleted': true,  
			                'swf': '<%=SystemParam.getSiteRoot()%>/uploadifyv3.1/uploadify.swf', 
			                'fileTypeExts':"*.jpg;*.gif;*.png;",
			                'auto':true, 
			                'removeTimeout':0,
			                'debug': false,  
			                'height': 15,  
			                'width':90,  
			                'uploader': '<%=SystemParam.getSiteRoot()%>/admin/uploadmanager.do',
			                 'fileSizelimit':'2048KB',
			                 'queueSizelimit':'5',
			                 'onUploadSuccess':function(file, data, response){
			                     $("#filelist").show();
			                     $("#imgXiangpian").attr("src","<%=SystemParam.getSiteRoot()%>/upload/temp/"+file.name);
                                 $("#hidXiangpian").val("<%=SystemParam.getSiteRoot()%>/upload/temp/"+file.name);
			                  }
			             }); 
			          var imgxiangpiansrc="${requestScope.users.xiangpian}";
				       if(imgxiangpiansrc==""){
				         var url="<%=SystemParam.getSiteRoot()%>/upload/nopic.jpg";
				         $("#imgXiangpian").attr("src",url);
				         $("#hidXiangpian").val(url);
				       }else
				       {
				          $("#imgXiangpian").attr("src",imgxiangpiansrc);
				          $("#hidXiangpian").val(imgxiangpiansrc); 
				       }
        }
        $(function ()
        {
            initControl();
            $.metadata.setType("attr","validate");
            $("#usersForm").validate();
        });  
    </script>
</head>
<body>
		 <div class="search-title">
<h2>
	                      新建后台用户
	                </h2>
	                <div class="description">
	                </div>
              </div>
				    <form name="usersform"  method="post" action="<%=SystemParam.getSiteRoot()%>/admin/usersmanager.do"  id="usersForm">
				        <table class="grid" cellspacing="1" width="100%">
						        <input type="hidden" name="id" value="${id}" />
						        <input type="hidden" name="actiontype" value="${actiontype}" />
						         <input type="hidden" name="seedid" value="${seedid}" />
						         <input type="hidden" name="errorurl" value="/admin/usersadd.jsp" />
						        <input type="hidden" name="forwardurl" value="/admin/usersmanager.do?actiontype=get&forwardurl=/admin/usersmanager.jsp" />
						        <tr>
								  <td colspan="4">
								      ${errormsg}
								  </td>
								</tr>
											   <tr>
											   <td align="right" >用户名:</td>
											   <td>
												   <input name="username" placeholder="用户名" validate="{required:true,messages:{required:'请输入用户名'}}" value="${requestScope.users.username}" class="input-txt" type="text" id="txtUsername"  />
												</td>
											   </tr>
											   <tr>
											   <td align="right" >密码 :</td>
											   <td>
												   <input name="password" placeholder="密码 " validate="{required:true,messages:{required:'请输入密码 '}}" value="${requestScope.users.password}" class="input-txt" type="text" id="txtPassword"  />
												</td>
											   </tr>
											   <tr>
											   <td align="right" >创建时间:</td>
											   <td>
												   <input name="createtime" value="${requestScope.users.createtime}" type="text" id="txtCreatetime" class="input-txt" validate="{required:true}" />
												</td>
											   </tr>
											   <tr>
											   <td align="right" >邮箱 :</td>
											   <td>
												   <input name="email" placeholder="邮箱 " validate="{required:true,messages:{required:'请输入邮箱 '}}" value="${requestScope.users.email}" class="input-txt" type="text" id="txtEmail"  />
												</td>
											   </tr>
											   <tr>
											   <td align="right" >创建人:</td>
											   <td>
												   <input name="creator" placeholder="创建人" validate="{required:true,messages:{required:'请输入创建人'}}" value="${requestScope.users.creator}" class="input-txt" type="text" id="txtCreator"  />
												</td>
											   </tr>
											   <tr>
											   <td align="right" >登陆次数:</td>
											   <td>
												   <input name="logtimes" placeholder="登陆次数" validate="{required:true,messages:{required:'请输入登陆次数'}}" value="${requestScope.users.logtimes}" class="input-txt" type="text" id="txtLogtimes"  />
												</td>
											   </tr>
											   <tr>
											   <td align="right" >昵称:</td>
											   <td>
												   <input name="nickname" placeholder="昵称" validate="{required:true,messages:{required:'请输入昵称'}}" value="${requestScope.users.nickname}" class="input-txt" type="text" id="txtNickname"  />
												</td>
											   </tr>
											   <tr>
											   <td align="right" >姓名:</td>
											   <td>
												   <input name="realname" placeholder="姓名" validate="{required:true,messages:{required:'请输入姓名'}}" value="${requestScope.users.realname}" class="input-txt" type="text" id="txtRealname"  />
												</td>
											   </tr>
											   <tr>
												        <td align="right" >性别 :</td>
												        <td>
												        <select   name="sex" id="ddlSex" ltype="select" >
<option value="男">男</option>
										                          <option value="女">女</option>
														 </select>
														</td>
											   </tr>
											   <tr>
											    <td align="right" >备注:</td>
											   <td>
												    <img id="imgXiangpian" width="200px" height="200px"  src="${requestScope.users.xiangpian}"/>
												    	<div>
													        <input type="file" name="upload" id="btnulXiangpian" />
													    </div>
													 <input type="hidden" id="hidXiangpian" name="xiangpian" value="${requestScope.users.xiangpian}" />
												</td>
											   </tr>
											   <tr>
											   <td align="right" >电话号码:</td>
											   <td>
												   <input name="tel" placeholder="电话号码" validate="{required:true,messages:{required:'请输入电话号码'}}" value="${requestScope.users.tel}" class="input-txt" type="text" id="txtTel"  />
												</td>
											   </tr>
						   <tr>
						       <td colspan="4">
						                <div class="ui-button">
											<button class="ui-button-text"><i class="icon-ok icon-white"></i>提交</button>
									     </div>
						       </td>
						   </tr>
				        </table>
		</form>
</body>
</html>
