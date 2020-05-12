<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.daowen.bll.*,com.daowen.util.PagerMetal"%>
<%@ page import="com.daowen.entity.*" %>
<%@page import="com.daowen.dal.DALBase"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>后台用户信息</title>
    <script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <link href="<%=SystemParam.getSiteRoot() %>/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="<%=SystemParam.getSiteRoot()%>/webui/combo/combo.js" type="text/javascript"></script>
    <link href="<%=SystemParam.getSiteRoot() %>/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="<%=SystemParam.getSiteRoot() %>/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet"
        type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
     <link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
			$(function() {
			    $("#btnDelete").click(function(){
			        if($(".check:checked").length<1)
			        {
			           top.$.dialog.alert("请选择需要删除的记录");
			           return;
			        } 
			        $(".check:checked").each(function(index,domEle){
			             var id=$(domEle).val();
			             top.$.dialog.confirm("你确定要注销后台用户信息?", function(){
				             window.location.href=encodeURI('<%=SystemParam.getSiteRoot()%>/admin/usersmanager.do?forwardurl=/admin/usersmanager.jsp&actiontype=delete&id='+id);
				         });
			        });
			    });
			    $("#btnCheckAll").click(function(){
			           var ischeck=false;
			           $(".check").each(function(){
			               if($(this).is(":checked"))
			               {
			                  $(this).prop("checked","");
			                  ischeck=false;
			                }
			               else
			               {
			                  $(this).prop("checked","true");
			                  ischeck=true;
			                }
			           });
			           if($(this).text()=="选择记录")
			              $(this).text("取消选择");
			           else
			              $(this).text("选择记录");
			    })
			});
       </script>
	</head>
	 <body >
		<div class="search-title">
			<h2>后台用户管理</h2>
			<div class="description">
				<a  href="<%=SystemParam.getSiteRoot() %>/admin/usersmanager.do?actiontype=load">新建后台用户</a>
			</div>
		</div>
					<!-- 搜索控件开始 -->
		          <div class="search-options">
					  <form id="searchForm"  action="<%=SystemParam.getSiteRoot() %>/admin/usersmanager.do" method="post" >
					   <table  cellspacing="0" width="100%">
					        <tbody>
					          <tr>
					             <td>
					               用户名
                                            <input name="username"  value="${username}" class="input-txt" type="text" id="username"  />
					                  <input type="hidden"   name="actiontype" value="search"/>
					                  <input type="hidden"   name="seedid" value="${seedid}"/>
					                  <input type="hidden"   name="forwardurl" value="/admin/usersmanager.jsp"/>
					                   <div class="ui-button">
							       <button class="ui-button-text">
									  搜索
								   </button>
							   </div>
					             </td>
					          </tr>
					        </tbody>
					   </table>
					   </form>
					</div>
					<!-- 搜索控件结束 -->
	<div class="clear"></div>
	<div class="action-details">
				 <span id="btnCheckAll" class="orange-href">选择</span>
				
				 <span id="btnDelete" class="orange-href" >删除</span>
				
			</div>
	<table id="users" width="100%" border="0" cellspacing="0"
		cellpadding="0" class="ui-record-table">
		<thead>
			<tr>
				<th>选择</th>
				<th><b>用户名</b>
				</th>
				
				<th><b>创建时间</b>
				</th>
				<th><b>邮箱 </b>
				</th>
				<th><b>创建人</b>
				</th>
				<th><b>登陆次数</b>
				</th>
				<th><b>昵称</b>
				</th>
				<th><b>姓名</b>
				</th>
				<th><b>性别 </b>
				</th>
				
				<th><b>电话号码</b>
				</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${listusers== null || fn:length(listusers) == 0}">
				<tr>
					<td colspan="20">没有相关后台用户信息</td>
				</tr>
			</c:if>
			<%	
									if(request.getAttribute("listusers")!=null)
								      {
									  List<Users> listusers=( List<Users>)request.getAttribute("listusers");
								     for(Users  temusers  :  listusers)
								      {
							%>
			<tr>
				<td>&nbsp<input id="chk<%=temusers.getId()%>" class="check"
					name="chk<%=temusers.getId()%>" type="checkbox"
					value='<%=temusers.getId()%>'>
				</td>
				<td><%=temusers.getUsername()%></td>
			
				<td><%=temusers.getCreatetime()%></td>
				<td><%=temusers.getEmail()%></td>
				<td><%=temusers.getCreator()%></td>
				<td><%=temusers.getLogtimes()%></td>
				<td><%=temusers.getNickname()%></td>
				<td><%=temusers.getRealname()%></td>
				<td><%=temusers.getSex()%></td>
				
				<td><%=temusers.getTel()%></td>
				<td>
				   <a class="btn btn-success"
					href="<%=SystemParam.getSiteRoot() %>/admin/usersdetails.jsp?id=<%=temusers.getId()%>"><i
						class="icon-zoom-in icon-white"></i>查看</a></td>
			</tr>
			<%}}%>
		</tbody>
	</table>
	<div class="clear"></div>
	<daowen:pager id="pager1" attcheform="searchForm" />
</body>
</html>
