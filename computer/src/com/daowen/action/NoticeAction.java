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

/**************************
 * 
 * 
 * 
 */
public class NoticeAction extends PageActionBase {
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
		DALBase.delete("notice", " where id=" + id);
		binding();
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String title = request.getParameter("title");
		String  forwardurl=request.getParameter("forwardurl");
		String pubren = request.getParameter("pubren");
		String pubtime = request.getParameter("pubtime");
		
		String dcontent = request.getParameter("dcontent");
		SimpleDateFormat sdfnotice = new SimpleDateFormat("yyyy-MM-dd");
		Notice notice = new Notice();
		notice.setTitle(title == null ? "" : title);
		notice.setPubren(pubren == null ? "" : pubren);
		if (pubtime != null) {
			try {
				notice.setPubtime(sdfnotice.parse(pubtime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			notice.setPubtime(new Date());
		}
		notice.setClickcount(0);
		notice.setDcontent(dcontent == null ? "" : dcontent);
		DALBase.save(notice);
		if(forwardurl==null)
			forwardurl="/admin/noticemanager.do?actiontype=get";
		try {
			response.sendRedirect(SystemParam.getSiteRoot()+forwardurl);
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
		String  forwardurl=request.getParameter("forwardurl");
		if (id == null)
			return;
		Notice notice = (Notice) DALBase.load(Notice.class, new Integer(id));
		if (notice == null)
			return;
		String title = request.getParameter("title");
		String pubren = request.getParameter("pubren");
		String pubtime = request.getParameter("pubtime");
		String dcontent = request.getParameter("dcontent");
		SimpleDateFormat sdfnotice = new SimpleDateFormat("yyyy-MM-dd");
		notice.setTitle(title);
		notice.setPubren(pubren);
		
	    notice.setPubtime(new Date());
		
		notice.setDcontent(dcontent);
		DALBase.update(notice);
		if(forwardurl==null)
			forwardurl="/admin/noticemanager.do?actiontype=get";
		try {
			response.sendRedirect(SystemParam.getSiteRoot()+forwardurl);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/******************************************************
	 *********************** 加载内部支持*********************
	 *******************************************************/
	public void load() {
		//
		String id = request.getParameter("id");
		String actiontype = "save";
		if (id != null) {
			Notice notice = (Notice) DALBase.load("notice", "where id=" + id);
			if (notice != null) {
				request.setAttribute("notice", notice);
			}
			actiontype = "update";
		}
		request.setAttribute("id", id);
		request.setAttribute("actiontype", actiontype);
		try {
			request.getRequestDispatcher("noticeadd.jsp").forward(request,
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
		String filter = "";
		//
		int pageindex = 1;
		int pagesize = 10;
		
		String title = request.getParameter("title");
		if (title != null)
			filter = "  where title like '%" + title + "%'  ";
		//
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
		List<Notice> listnotice = DALBase.getPageEnity("notice", filter,
				pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("notice", filter == null ? ""
				: filter);
		request.setAttribute("listnotice", listnotice);
		PagerMetal pm = new PagerMetal(recordscount);
		// 设置尺寸
		pm.setPagesize(pagesize);
		// 设置当前显示页
		pm.setCurpageindex(pageindex);
		// 设置分页信息
		request.setAttribute("pagermetal", pm);
		// 分发请求参数
		dispatchParams(request, response);
		
		
		try {
			request.getRequestDispatcher("/admin/noticemanager.jsp").forward(
					request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
