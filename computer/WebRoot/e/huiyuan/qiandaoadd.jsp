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
  <title>签到</title>
  <link rel="stylesheet" href="<%=SystemParam.getSiteRoot()%>/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot()%>/e/css/box.all.css" type="text/css"></link>
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
   <script type="text/javascript">
        function initControl(){
	$("#txtQddate").datepicker({
                         dateFormat:'yy-mm-dd'
                      }).datepicker("setDate",new Date());
        }
        $(function ()
        {
            initControl();
            $.metadata.setType("attr","validate");
            $("#qiandaoForm").validate();
        });  
    </script>
</head>
<body>
			<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap">
		<div class="cover-title">
			当前位置：<a href="<%=SystemParam.getSiteRoot()%>/e/index.jsp">首页</a> &gt;&gt; 签到管理
		</div>
	</div>
	<div class="wrap">
		<div class="main">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">
				<form name="qiandaoform" method="post"
					action="<%=SystemParam.getSiteRoot()%>/admin/qiandaomanager.do"
					id="qiandaoForm">
					<table class="grid" cellspacing="1" width="100%">
						<input type="hidden" name="id" value="${id}" />
						<input type="hidden" name="actiontype" value="${actiontype}" />
						<input type="hidden" name="seedid" value="${seedid}" />
						<input type="hidden" name="errorurl"
							value="/e/huiyuan/qiandaoadd.jsp" />
						<input type="hidden" name="forwardurl"
							value="/admin/qiandaomanager.do?actiontype=get&hyname=${huiyuan.accountname}&forwardurl=/e/huiyuan/qiandaomanager.jsp" />
						<input name="hyname"
							validate="{required:true,messages:{required:'请输入会员名'}}"
							value="${huiyuan.accountname}" class="input-txt" type="hidden"
							id="txtHyname" />

						<tr>
							<td colspan="4">${errormsg}</td>
						</tr>
				    	<tr>
							<td colspan="4">
							
							    <%
							        SimpleDateFormat  sdf=new SimpleDateFormat("yyyy-MM-dd");
							        String date= sdf.format(new Date());
							    %>
							   <span style="font-family:'Microsoft Yahei';font-size:18px;font-weight: bold;">
							        <%=date %>
							   </span> 
							</td>
						</tr>
						<tr>
							<td colspan="4">
								
									<button class="btn btn-default">
										<i class="fa fa-check"></i>在线签到 
									</button>
								
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
