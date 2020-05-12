package com.daowen.action;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.SQLQuery;
import org.hibernate.Query;
import org.springframework.stereotype.Controller;

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


public class LeavewordAction extends PageActionBase {
	
	@Override
	public void onLoad() {
		String actiontype = request.getParameter("actiontype");
		System.out.println("actiontype=" + actiontype);
		if (actiontype == null)
			return;
		if (actiontype.equals("reply")) {
			reply();
		}
		
	}

	private void reply() {
		
		String id=request.getParameter("id");
		String replyren=request.getParameter("replyren");
		if (id == null)
			return;
		Leaveword leaveword = (Leaveword) DALBase.load(Leaveword.class,new Integer(id));
		if (leaveword == null)
			return;
		
		String replycontent=request.getParameter("replycontent");
		leaveword.setReplycontent(replycontent);
		leaveword.setReplytime(new Date());
		leaveword.setReplyren(replyren);
		leaveword.setStatus(1);
		DALBase.update(leaveword);
		String forwardurl=request.getParameter("forwardurl");
		if (forwardurl == null) {
			forwardurl = "/admin/leavewordmanager.jsp";
		}
		try {
			response.sendRedirect(SystemParam.getSiteRoot() + forwardurl);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String id = request.getParameter("id");
		DALBase.delete("leaveword", " where id=" + id);
		binding();
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String title = request.getParameter("title");
		String lwren = request.getParameter("currenthy");
		String replyren = request.getParameter("replyren");
		String dcontent = request.getParameter("dcontent");
		String replycontent = request.getParameter("replycontent");
		String photo=request.getParameter("photo");
		Leaveword leaveword = new Leaveword();
		leaveword.setTitle(title == null ? "" : title);
		leaveword.setLwren(lwren == null ? "" : lwren);
		
		leaveword.setPubtime(new Date());
		
		leaveword.setReplyren(replyren == null ? "" : replyren);
		
		leaveword.setReplytime(new Date());
		leaveword.setPhoto(photo);
		leaveword.setStatus(0);
		leaveword.setDcontent(dcontent == null ? "" : dcontent);
		leaveword.setReplycontent(replycontent == null ? "" : replycontent);
		DALBase.save(leaveword);
		
		try {
			response.sendRedirect("../e/leavewordinfo.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	
	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		String id = request.getParameter("id");
		if (id == null)
			return;
		Leaveword leaveword = (Leaveword) DALBase.load(Leaveword.class,
				new Integer(id));
		if (leaveword == null)
			return;
		String title = request.getParameter("title");
		String lwren = request.getParameter("lwren");
		String pubtime = request.getParameter("pubtime");
		String replyren = request.getParameter("replyren");
		String replytime = request.getParameter("replytime");
		String status = request.getParameter("status");
		String dcontent = request.getParameter("dcontent");
		String replycontent = request.getParameter("replycontent");
		SimpleDateFormat sdfleaveword = new SimpleDateFormat("yyyy-MM-dd");
		leaveword.setTitle(title);
		leaveword.setLwren(lwren);
		try {
			leaveword.setPubtime(sdfleaveword.parse(pubtime));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		leaveword.setReplyren(replyren);
		try {
			leaveword.setReplytime(sdfleaveword.parse(replytime));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		leaveword.setStatus(new Integer(status));
		leaveword.setDcontent(dcontent);
		leaveword.setReplycontent(replycontent);
		DALBase.update(leaveword);
		
		binding();
	}

	/******************************************************
	 *********************** 加载内部支持*********************
	 *******************************************************/
	public void load() {
		//
		String id = request.getParameter("id");
		String actiontype = "save";
		if (id != null) {
			Leaveword leaveword = (Leaveword) DALBase.load("leaveword",
					"where id=" + id);
			if (leaveword != null) {
				request.setAttribute("leaveword", leaveword);
			}
			actiontype = "update";
		}
		request.setAttribute("id", id);
		request.setAttribute("actiontype", actiontype);
		try {
			request.getRequestDispatcher("leavewordadd.jsp").forward(request,
					response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void binding() {
		String filter = "where 1=1 ";
		
		//
		int pageindex = 1;
		int pagesize = 10;
		
		String title=request.getParameter("title");
		String  lwren=request.getParameter("lwren");
		if(title!=null)
			filter+="  and title like '%" + title + "%'  ";
		
		if(lwren!=null)
			filter+="  and lwren ='" +lwren + "'  ";
		
		
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
		List<Leaveword> listleaveword = DALBase.getPageEnity("leaveword",
				filter, pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("leaveword",
				filter == null ? "" : filter);
		request.setAttribute("listleaveword", listleaveword);
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
			forwardurl = "/admin/leavewordmanager.jsp";
		}
		try {
			request.getRequestDispatcher(forwardurl).forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
