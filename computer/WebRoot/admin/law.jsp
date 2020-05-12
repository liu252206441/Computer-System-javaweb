<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.daowen.bll.SystemParam"%>
<%
      Object o=  request.getSession().getAttribute("users");
      if(o==null)
          response.sendRedirect(SystemParam.getSiteRoot()+"/admin/login.jsp");
%>
