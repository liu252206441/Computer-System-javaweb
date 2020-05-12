package com.daowen.action;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.filefilter.AndFileFilter;
import org.apache.commons.io.filefilter.FalseFileFilter;
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
import com.daowen.util.SequenceUtil;


public class ShangpinAction extends PageActionBase {
	public void onLoad() {
		String actiontype = request.getParameter("actiontype");
		System.out.println("actiontype=" + actiontype);
		if (actiontype == null)
			return ;
	
		if(actiontype.equals("hasExist")){
			hasExist();
		}
		if(actiontype.equals("shangjia")){
			shangjia();
		}
		if(actiontype.equals("xiajia")){
			xiajia();
		}
		if (actiontype.equals("kucunadd")){
			kucunadd();
		}

	}
	
	public void kucunadd() {
		String forwardurl = request.getParameter("forwardurl");
		String errorurl = request.getParameter("errorurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Shangpin shangpin = (Shangpin) DALBase.load(Shangpin.class,
				new Integer(id));
		if (shangpin == null)
			return;
		String shuliang = request.getParameter("shuliang");
		String danwei = request.getParameter("danwei");
		
        if(shuliang!=null){
		   shangpin.setKucun(shangpin.getKucun()+Integer.parseInt(shuliang));
		   shangpin.setDanwei(danwei);
        }
		
		DALBase.update(shangpin);
		if (forwardurl == null) {
			forwardurl = "/admin/shangpinmanager.do?actiontype=get";
		}
		try {
			response.sendRedirect(SystemParam.getSiteRoot() + forwardurl);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	
	private  void  shangjia(){
		
		 String[] ids=request.getParameterValues("spids");
		  if (ids == null)
				return;
		  String spliter=",";
		  DALBase.executeUpdate(" update shangpin set state=1 where id in("+join(spliter,ids)+")");
		  
		   try {
			response.getWriter().write(new Integer(ids.length));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private  void  xiajia(){
		
		 String[] ids=request.getParameterValues("spids");
		  if (ids == null)
				return;
		  String spliter=",";
		  String SQL=" update shangpin set state=2 where id in("+join(spliter,ids)+")";
		  System.out.println("sql="+SQL);
		  DALBase.executeUpdate(SQL);
		  
		   try {
			response.getWriter().write(new Integer(ids.length));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	 

	private void hasExist() {
		String spno=request.getParameter("spno");
		String strres="true";
		if(DALBase.isExist("shangpin", "where spno='"+spno.trim()+"'")){
			strres="false";
		}else {
			
            strres="true";
		}
		try {
			System.out.println("商品编号存在性="+strres);
			response.getWriter().write(strres);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String id = request.getParameter("id");
		DALBase.delete("shangpin", " where id=" + id);
		binding();
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		String errorurl=request.getParameter("errorurl");
		String name = request.getParameter("name");
		String subtitle = request.getParameter("subtitle");
		String pinpai=request.getParameter("pinpai");
		String jiage = request.getParameter("jiage");
		String dazhe = request.getParameter("dazhe");
		String tuijian = request.getParameter("tuijian");
		String zuixin = request.getParameter("zuixin");
		String hot=request.getParameter("hot");
		String sptype = request.getParameter("sptype");
		String sptypeid = request.getParameter("sptypeid");
		String tupian = request.getParameter("tupian");
		String jieshao = request.getParameter("jieshao");
		String hyjia = request.getParameter("hyjia");
    	String pubren = request.getParameter("pubren");
		SimpleDateFormat sdfshangpin = new SimpleDateFormat("yyyy-MM-dd");
		Shangpin shangpin = new Shangpin();
		shangpin.setName(name == null ? "" : name);
		shangpin.setSpno(SequenceUtil.buildSequence("SP"));
		shangpin.setJiage(jiage == null ? (double) 0 : new Double(jiage));
		shangpin.setDazhe(dazhe == null ? 0 : new Integer(dazhe));
		shangpin.setTuijian(tuijian == null ? 0 : new Integer(tuijian));
		shangpin.setZuixin(zuixin == null ? 0 :new Integer( zuixin));
		shangpin.setHot(hot==null?0:new Integer(hot));
		shangpin.setSptype(sptype == null ? "" : sptype);
		shangpin.setSptypeid(sptypeid == null ? 0 : new Integer(sptypeid));
		shangpin.setTupian(tupian == null ? "" : tupian);
		shangpin.setJieshao(jieshao == null ? "" : jieshao);
		shangpin.setHyjia(hyjia == null ? 0 : new Integer(hyjia));
		shangpin.setSubtitle(subtitle==null?"":subtitle);
		shangpin.setPinpai(pinpai==null?"":pinpai);
		shangpin.setState(1);
		shangpin.setPubtime(new Date());
		shangpin.setPubren(pubren == null ? "" : pubren);
		DALBase.save(shangpin);
		if (forwardurl == null) {
			forwardurl = "/admin/shangpinmanager.do?actiontype=get";
		}
		try {
			response.sendRedirect(SystemParam.getSiteRoot() + forwardurl+"&sptypeid="+sptypeid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
	public void update() {
		String forwardurl = request.getParameter("forwardurl");
		String errorurl=request.getParameter("errorurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Shangpin shangpin = (Shangpin) DALBase.load(Shangpin.class,
				new Integer(id));
		if (shangpin == null)
			return;
		String name = request.getParameter("name");
		String pinpai = request.getParameter("pinpai");
		String subtitle = request.getParameter("subtitle");
		String jiage = request.getParameter("jiage");
		String dazhe = request.getParameter("dazhe");
		String tuijian = request.getParameter("tuijian");
		String zuixin = request.getParameter("zuixin");
		String hot=request.getParameter("hot");
		String sptype = request.getParameter("sptype");
		String sptypeid = request.getParameter("sptypeid");
		String tupian = request.getParameter("tupian");
		String jieshao = request.getParameter("jieshao");
		String hyjia = request.getParameter("hyjia");
		String pubren = request.getParameter("pubren");
		shangpin.setName(name);
		shangpin.setJiage(jiage == null ? (double) 0 : new Double(jiage));
		shangpin.setDazhe(dazhe == null ? 0 : new Integer(dazhe));
		shangpin.setTuijian(tuijian == null ? 0 : new Integer(tuijian));
		shangpin.setZuixin(zuixin==null?0:new Integer( zuixin));
		shangpin.setHot(hot==null?0:new Integer(hot));
		shangpin.setSptype(sptype);
		shangpin.setSptypeid(sptypeid == null ? 0 : new Integer(sptypeid));
		shangpin.setTupian(tupian);
		shangpin.setJieshao(jieshao);
		shangpin.setHyjia(hyjia == null ? 0 : new Double(hyjia));
		shangpin.setPubtime(new Date() );
		shangpin.setSubtitle(subtitle==null?"":subtitle);
		shangpin.setPinpai(pinpai==null?"":pinpai);
		shangpin.setPubren(pubren);
		DALBase.update(shangpin);
		
		if (forwardurl == null) {
			forwardurl = "/admin/shangpinmanager.do?actiontype=get";
		}
		try {
			response.sendRedirect(SystemParam.getSiteRoot() + forwardurl+"&sptypeid="+sptypeid);
		} catch (Exception e) {
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
		dispatchParams(request, response);
		if (id != null) {
			Shangpin shangpin = (Shangpin) DALBase.load("shangpin", "where id="
					+ id);
			if (shangpin != null) {
				request.setAttribute("shangpin", shangpin);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		List<Object> sptype_datasource = DALBase.getEntity("Spcategory", "where isleaf=1 order by id asc");
		request.setAttribute("sptype_datasource", sptype_datasource);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/shangpinadd.jsp";
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

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void binding() {
		
		List<Object> sptype_datasource = DALBase.getEntity("Spcategory", "where isleaf=1");
		if(sptype_datasource!=null){
			Spcategory spcategory=new  Spcategory();
			spcategory.setId(-1);
			spcategory.setMingcheng("全部");
			spcategory.setIsleaf(1);
			sptype_datasource.add(spcategory);
		}
		request.setAttribute("sptype_datasource", sptype_datasource);
		String filter = "where 1=1 ";
		String spname = request.getParameter("name");
		if (spname != null)
			filter += "  and name like '%" +spname + "%'  ";
		
		String  sptype=request.getParameter("sptype");
		String  sptypeid=request.getParameter("sptypeid");
		System.out.println("sptypeid="+sptypeid);
		if(sptypeid!=null){
			if(!sptypeid.equals("-1"))
			   filter += "  and sptypeid=" +sptypeid ;
		}else
		if(sptypeid==null&&sptype_datasource.size()>0){
			
			filter+="  and sptypeid=" +((Spcategory)sptype_datasource.get(0)).getId() ;
		}
		int pageindex = 1;
		int pagesize = 10;
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
		List<Shangpin> listshangpin = DALBase.getPageEnity("shangpin", filter,
				pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("shangpin",
				filter == null ? "" : filter);
		request.setAttribute("listshangpin", listshangpin);
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
			forwardurl = "/admin/shangpinmanager.jsp";
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
