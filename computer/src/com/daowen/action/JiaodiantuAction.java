package com.daowen.action;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.SQLQuery;
import org.hibernate.Query;

import com.daowen.dal.*;
import com.daowen.bll.*;
import com.daowen.entity.*;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.text.MessageFormat;

import com.daowen.util.PagerMetal;


public class JiaodiantuAction extends PageActionBase {
	@Override
	public void onLoad() {
		String actiontype = request.getParameter("actiontype");
		System.out.println("actiontype=" + actiontype);
		if (actiontype == null)
			return;

	}

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String id = request.getParameter("id");
		DALBase.delete("jiaodiantu", " where id=" + id);
		binding();
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String title = request.getParameter("title");
		String tupian = request.getParameter("tupian");
		String href = request.getParameter("href");
		String xtype = request.getParameter("xtype");
		String pindex = request.getParameter("pindex");
		SimpleDateFormat sdfjiaodiantu = new SimpleDateFormat("yyyy-MM-dd");
		Jiaodiantu jiaodiantu = new Jiaodiantu();
		jiaodiantu.setTitle(title == null ? "" : title);
		jiaodiantu.setTupian(tupian == null ? "" : tupian);
		jiaodiantu.setHref(href == null ? "" : href);
		jiaodiantu.setXtype(xtype == null ? "" : xtype);
		jiaodiantu.setPindex(new Integer(pindex));
		DALBase.save(jiaodiantu);
		String forwardurl = request.getParameter("forwardurl");
		if (forwardurl == null) {
			forwardurl = "/admin/jiaodiantumanager.do?actiontype=get";
		}
		redirect(forwardurl);
	}

	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		String id = request.getParameter("id");
		if (id == null)
			return;
		Jiaodiantu jiaodiantu = (Jiaodiantu) DALBase.load(Jiaodiantu.class,
				new Integer(id));
		if (jiaodiantu == null)
			return;
		String title = request.getParameter("title");
		String tupian = request.getParameter("tupian");
		String href = request.getParameter("href");
		String xtype = request.getParameter("xtype");
		String pindex = request.getParameter("pindex");
		SimpleDateFormat sdfjiaodiantu = new SimpleDateFormat("yyyy-MM-dd");
		jiaodiantu.setTitle(title);
		jiaodiantu.setTupian(tupian);
		jiaodiantu.setHref(href);
		jiaodiantu.setXtype(xtype);
		jiaodiantu.setPindex(new Integer(pindex));
		DALBase.update(jiaodiantu);
		String forwardurl = request.getParameter("forwardurl");
		if (forwardurl == null) {
			forwardurl = "/admin/jiaodiantumanager.do?actiontype=get";
		}
		redirect(forwardurl);
	}

	/******************************************************
	 *********************** 加载内部支持*********************
	 *******************************************************/
	public void load() {
		//
		String id = request.getParameter("id");
		dispatchParams(request, response);
		String actiontype = "save";
		if (id != null) {
			Jiaodiantu jiaodiantu = (Jiaodiantu) DALBase.load("jiaodiantu",
					"where id=" + id);
			if (jiaodiantu != null) {
				request.setAttribute("jiaodiantu", jiaodiantu);
			}
			actiontype = "update";
		}
		request.setAttribute("id", id);
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/jiaodiantuadd.jsp";
		}
	    requestDispatch(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void binding() {
		String filter = "";
		//
		int pageindex = 1;
		int pagesize = 10;

		String title = request.getParameter("title");

		if (title != null)
			filter = "  where title like '%" + title + "%'  ";
		// 获取当前分页
		String currentpageindex = request.getParameter("currentpageindex");
		// 当前页面尺寸
		String currentpagesize = request.getParameter("pagesize");
		// 设置当前页
		if (currentpageindex != null)
			pageindex = new Integer(currentpageindex);
		// 设置当前页尺寸
		if (currentpagesize != null)
			pagesize = new Integer(currentpagesize);
		List<Jiaodiantu> listjiaodiantu = DALBase.getPageEnity("jiaodiantu",
				filter, pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("jiaodiantu",
				filter == null ? "" : filter);
		request.setAttribute("listjiaodiantu", listjiaodiantu);
		PagerMetal pm = new PagerMetal(recordscount);
		// 设置尺寸
		pm.setPagesize(pagesize);
		// 设置当前显示页
		pm.setCurpageindex(pageindex);
		// 设置分页信息
		request.setAttribute("pagermetal", pm);
		// 分发请求参数
		dispatchParams(request, response);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/jiaodiantumanager.jsp";
		}
	    requestDispatch(forwardurl);
	}
}
