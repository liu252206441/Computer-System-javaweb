<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.daowen.bll.*,com.daowen.util.PagerMetal"%>
<%@ page import="com.daowen.entity.*" %>
<%@page import="com.daowen.dal.DALBase"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="org.jfree.chart.JFreeChart"%>
<%@ page import="org.jfree.chart.servlet.ServletUtilities"%>
<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>$Description}统计</title>
    <link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <link href="<%=SystemParam.getSiteRoot() %>/admin/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="<%=SystemParam.getSiteRoot() %>/admin/css/menu.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.9.0.js"></script>
     <link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
        <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
     <link href="<%=SystemParam.getSiteRoot() %>/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <link href="<%=SystemParam.getSiteRoot() %>/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="<%=SystemParam.getSiteRoot() %>/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet"
        type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
	<script type="text/javascript">
	      $(function(){
	    	  $("#txtBegintime").datepicker({
                  dateFormat:'yy-mm-dd'
               });
				if($("#txtBegintime").val()==""){
					$("#txtBegintime").datepicker("setDate",new Date());
				}
				$("#txtEndtime").datepicker({
		dateFormat:'yy-mm-dd'
               });
				if($("#txtEndtime").val()==""){
					$("#txtEndtime").datepicker("setDate",new Date());
				}
	      })
	 </script>
	</head>
	 <body >
			   <div class="search-title">
					<h2>
	 销售统计
                                      </h2>
                <div class="description">
                </div>
              </div>
			 <div style="height:5px;"></div>
				<%
				        SimpleStatistics  simpleStatistics=new SimpleStatistics();
					JFreeChart chart = simpleStatistics.buildColumnChart("商品", "销售金额", "商品销售统计", "select spname,sum(jiage) from dingdanitems group by spno,spname");
					String filename = ServletUtilities.saveChartAsPNG(chart, 1000, 500,
							session);
					String url = request.getContextPath();
					String imageurl = url + "/servlet/DisplayChart?filename="
							+ filename;
				%>
				<img src="<%=imageurl%>" />
	</body>
</html>
