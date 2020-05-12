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


public class HuiyuanAction extends PageActionBase {
	
	
	public void onLoad() {
		String actiontype = request.getParameter("actiontype");
		System.out.println("actiontype=" + actiontype);
		

		if (actiontype.equals("login")) {
			login();
		}
		if (actiontype.equals("exit")) {
			exit();
		}
		if (actiontype.equals("modifyPw")) {
			modifyPw();
		}
		if (actiontype.equals("modifyPaypw")) {
			modifyPaypw();
		}
		if (actiontype.equals("chongzhi")) {
			chongzhi();
		}
		if (actiontype.equals("forgetPw")) {
			forgetPw();
		}
		if(actiontype.equals("resetPw")){
			resetPw();
		}
		if (actiontype.equals("chongjifen")){
			chongjifen();
		 
		}
		
	}
	
	private void modifyPaypw() {

		String paypwd=request.getParameter("paypwd");
		String errorurl=request.getParameter("errorurl");
		String  forwardurl=request.getParameter("forwardurl");
		String repassword1=request.getParameter("repassword1");
		String repassword2=request.getParameter("repassword2");
		String id = request.getParameter("id");
		if (id == null||id=="")
			return;
		Huiyuan huiyuan = (Huiyuan) DALBase.load(Huiyuan.class, new Integer(id));
		if(huiyuan!=null)
		{
			if(!huiyuan.getPaypwd().equals(paypwd)){
				request.setAttribute("errormsg",
						"<label class='error'>原始支付密码不正确</label>");
				
				try {
					request.getRequestDispatcher(errorurl).forward(request, response);
				} catch (ServletException e) {
					
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return ;
			}
			huiyuan.setPaypwd(repassword1);
			DALBase.update(huiyuan);
			request.getSession().setAttribute("huiyuan", huiyuan);
			try {
				response.sendRedirect(SystemParam.getSiteRoot()+forwardurl);
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		}
		

	}

	private void chongjifen() {
		String jine = request.getParameter("jine");
		String forwardurl = request.getParameter("forwardurl");

		String id = request.getParameter("id");
		if (id == null || id == "")
			return;
		int njine=Integer.parseInt(jine);
		Huiyuan huiyuan = (Huiyuan) DALBase.load(Huiyuan.class, new Integer(id));
		if (huiyuan != null) {
			if(huiyuan.getYue()<njine){
	    		
	    		request.setAttribute("errormsg", "<label class='error'>账户余额不足于支付订单,请充值</label>");
	    		try {
					request.getRequestDispatcher("/e/huiyuan/chongjifen.jsp").forward(request, response);
					
					return;
				} catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	    		
	    	}
			
			huiyuan.setYue(huiyuan.getYue() - Float.parseFloat(jine));
			huiyuan.setJifen(huiyuan.getJifen()+Integer.parseInt(jine)*20);
			DALBase.update(huiyuan);
			request.getSession().setAttribute("huiyuan", huiyuan);
			try {
				if (forwardurl != null)
					response.sendRedirect(SystemParam.getSiteRoot()
							+ forwardurl);
			} catch (IOException e) {

				e.printStackTrace();
			}
		}

	}
    private void resetPw() {
		
    	
    	String accountname=request.getParameter("accountname");
    	String seqtitle=request.getParameter("sectitle");
    	String seqanswer=request.getParameter("secanswer");
    	String password=request.getParameter("password");
		String forwardurl = request.getParameter("forwardurl");
		String errorurl = request.getParameter("errorurl");
		if(!DALBase.isExist("secquestion", MessageFormat.format("where title=''{0}'' and answer=''{1}''", seqtitle,seqanswer))){
			try {
				dispatchParams(request, response);
				List<Object> secquestion_datasource = DALBase.getEntity("secquestion",
						"where accountname='"+accountname+"'");
				request.setAttribute("accountname", accountname);
				request.setAttribute("secquestion_datasource", secquestion_datasource);
				request.setAttribute("errormsg",
						"<label class='error'>回答问题不正确</label>");
				request.getRequestDispatcher(errorurl).forward(request,
						response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return;
			
		}
		Huiyuan huiyuan = (Huiyuan) DALBase.load("huiyuan","where accountname='"+accountname+"'");
		if(huiyuan!=null)
		{
			huiyuan.setPassword(password);
			DALBase.update(huiyuan);
			request.getSession().setAttribute("huiyuan", huiyuan);
			try {
				response.sendRedirect(SystemParam.getSiteRoot()+forwardurl);
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		}
    	
		
	}
	private void forgetPw() {

		
		String accountname=request.getParameter("accountname");
		String forwardurl = request.getParameter("forwardurl");
		String errorurl = request.getParameter("errorurl");
		if(!DALBase.isExist("huiyuan", "where accountname='"+accountname+"'")){
			try {
				request.setAttribute("errormsg",
						"<label class='error'>不存在的账号</label>");
				request.getRequestDispatcher(errorurl).forward(request,
						response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return;
			
		}
		List<Object> secquestion_datasource = DALBase.getEntity("secquestion",
				"where accountname='"+accountname+"'");
		request.setAttribute("accountname", accountname);
		request.setAttribute("secquestion_datasource", secquestion_datasource);
		if (forwardurl == null) {
			forwardurl = "/admin/secquestionmanager.jsp";
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
 
	private void chongzhi() {
		String jine = request.getParameter("jine");
		String forwardurl = request.getParameter("forwardurl");

		String id = request.getParameter("id");
		if (id == null || id == "")
			return;
		Huiyuan huiyuan = (Huiyuan) DALBase
				.load(Huiyuan.class, new Integer(id));
		if (huiyuan != null) {
			huiyuan.setYue(huiyuan.getYue() + Float.parseFloat(jine));
			DALBase.update(huiyuan);
			request.getSession().setAttribute("huiyuan", huiyuan);
			try {
				if (forwardurl != null)
					response.sendRedirect(SystemParam.getSiteRoot()
							+ forwardurl);
			} catch (IOException e) {

				e.printStackTrace();
			}
		}

	}

	private void modifyPw() {

		String password=request.getParameter("password");
		String errorurl=request.getParameter("errorurl");
		String  forwardurl=request.getParameter("forwardurl");
		String repassword1=request.getParameter("repassword1");
		String repassword2=request.getParameter("repassword2");
		String id = request.getParameter("id");
		if (id == null||id=="")
			return;
		Huiyuan huiyuan = (Huiyuan) DALBase.load(Huiyuan.class, new Integer(id));
		if(huiyuan!=null)
		{
			if(!huiyuan.getPassword().equals(password)){
				request.setAttribute("errormsg",
						"<label class='error'>原始密码不正确</label>");
				dispatchParams(request, response);
				try {
					request.getRequestDispatcher(errorurl).forward(request, response);
				} catch (ServletException e) {
					
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return ;
			}
			huiyuan.setPassword(repassword1);
			DALBase.update(huiyuan);
			request.getSession().setAttribute("huiyuan", huiyuan);
			try {
				response.sendRedirect(SystemParam.getSiteRoot()+forwardurl);
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		}
		

	}
	
	

	private void exit() {

		if (request.getSession().getAttribute("huiyuan") != null) {

			System.out.println("系统退出");
			request.getSession().removeAttribute("huiyuan");

		}
		

	}

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String id = request.getParameter("id");
		DALBase.delete("huiyuan", " where id=" + id);
		binding();
	}

	private void login() {

		String usertype = request.getParameter("usertype");

		if (usertype != null && usertype.equals("0")) {
			huiyuanLogin();
		}
		
		
		
		

	}

	private void huiyuanLogin() {

		String accountname = request.getParameter("accountname");
		String password = request.getParameter("password");

		String filter = MessageFormat.format(
				"where accountname=''{0}'' and password=''{1}''", accountname,
				password);

		Huiyuan huiyuan = (Huiyuan) DALBase.load("huiyuan", filter);
		String errorurl=request.getParameter("errorurl");
		String gotourl=request.getParameter("gotourl");

		if (huiyuan != null && huiyuan.getPassword().equals(password)) {

			try {

				huiyuan.setLogtimes(huiyuan.getLogtimes() + 1);
				DALBase.update(huiyuan);
				request.getSession().setAttribute("huiyuan", huiyuan);
				if (gotourl != null)
					response.sendRedirect(SystemParam.getSiteRoot()
							+ gotourl);

				else {

					response.sendRedirect(SystemParam.getSiteRoot() + "/e/huiyuan/accountinfo.jsp");
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {

			dispatchParams(request, response);
			request.setAttribute("errormsg", "<label class='error'>系统账户和密码不匹配</label>");
			try {

				request.getRequestDispatcher(errorurl).forward(request, response);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}
	
	

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String accountname = request.getParameter("accountname");
		String password = request.getParameter("password");
		String paypwd=request.getParameter("paypwd");
		String name = request.getParameter("name");
        String idcardno=request.getParameter("idcardno");
		String email = request.getParameter("email");
		String  mobile=request.getParameter("mobile");
		String  address=request.getParameter("address");
		String  touxiang=request.getParameter("touxiang");
		String  sex=request.getParameter("sex");
		String  zhiye=request.getParameter("zhiye");
		String  aihao=request.getParameter("aihao");
        String  des=request.getParameter("des");
		if (DALBase.isExist("huiyuan", "where accountname='" + accountname
				+ "'")) {
			try {
				request.setAttribute("errormsg",
						"<label class='error'>用户名已经存在</label>");
				dispatchParams(request, response);
				request.getRequestDispatcher("/e/register.jsp").forward(
						request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}

		Huiyuan huiyuan = new Huiyuan();
		huiyuan.setAccountname(accountname == null ? "" : accountname);
		huiyuan.setPassword(password == null ? "" : password);
		huiyuan.setPaypwd(paypwd==null?"":paypwd);
		if(mobile!=null)
		   huiyuan.setMobile(mobile); 
		if(address!=null)
		   huiyuan.setAddress(address);
		if(sex!=null)
			huiyuan.setSex(sex);
		else
			huiyuan.setSex("男");
		
		huiyuan.setNickname(accountname);
        huiyuan.setName(name);
		huiyuan.setRegdate(new Date());
        huiyuan.setIdcardno(idcardno==null?"":idcardno);
		huiyuan.setLogtimes(0);
		
		if(touxiang!=null)
			huiyuan.setTouxiang(touxiang);
		else
		    huiyuan.setTouxiang(SystemParam.getSiteRoot()
				+ "/upload/nopic.jpg");
		huiyuan.setEmail(email == null ? "" : email);
		huiyuan.setJibie("初级");
		huiyuan.setZhiye(zhiye);
		huiyuan.setAihao(aihao);
		huiyuan.setStatus(1);
		huiyuan.setYue(0);
		huiyuan.setJifen(0);
		huiyuan.setXtype("普通会员");
		huiyuan.setDes(des==null?"":des);
		DALBase.save(huiyuan);
		String forwardurl=request.getParameter("forwardurl");
		if (forwardurl == null) {
			forwardurl = "/admin/huiyuanmanager.do?actiontype=get";
		}
		try {
			response.sendRedirect(SystemParam.getSiteRoot() + forwardurl);
		} catch (Exception e) {
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
		Huiyuan huiyuan = (Huiyuan) DALBase
				.load(Huiyuan.class, new Integer(id));
		if (huiyuan == null)
			return;
		String accountname = request.getParameter("accountname");
		
		String nickname = request.getParameter("nickname");
		String forwardurl = request.getParameter("forwardurl");
	
		String touxiang = request.getParameter("touxiang");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String sex = request.getParameter("sex");
		String address = request.getParameter("address");
		String jibie = request.getParameter("jibie");
		String name = request.getParameter("name");
		String zhiye = request.getParameter("zhiye");
		String aihao = request.getParameter("aihao");
		SimpleDateFormat sdfhuiyuan = new SimpleDateFormat("yyyy-MM-dd");
		huiyuan.setAccountname(accountname);
		huiyuan.setNickname(nickname);
		huiyuan.setTouxiang(touxiang);
		huiyuan.setEmail(email);
		huiyuan.setMobile(mobile);
		huiyuan.setSex(sex);
		huiyuan.setAddress(address);
		huiyuan.setJibie(jibie);
		huiyuan.setName(name);
		huiyuan.setZhiye(zhiye);
		huiyuan.setAihao(aihao);
		DALBase.update(huiyuan);
		request.getSession().setAttribute("huiyuan", huiyuan);
		try {
		   if(forwardurl!=null)
			  response.sendRedirect(SystemParam.getSiteRoot()+forwardurl);
		   else
			  response.sendRedirect(SystemParam.getSiteRoot()+"/e/huiyuan/modifyinfores.jsp");
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
			Huiyuan huiyuan = (Huiyuan) DALBase.load("huiyuan", "where id="+ id);
			if (huiyuan != null) {
				String objectname=request.getParameter("objectname");
				System.err.println("objectname="+objectname);
				if(objectname==null)
				   request.setAttribute("huiyuan", huiyuan);
				else
					request.setAttribute(objectname, huiyuan);
			}
			actiontype = "update";
		}
		request.setAttribute("id", id);
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
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
		String filter = "";
		//
		int pageindex = 1;
		int pagesize = 10;
		// 获取当前分页

		String accountname = request.getParameter("accountname");

		if (accountname != null)
			filter = "  where accountname like '%" + accountname + "%'  ";

		String currentpageindex = request.getParameter("currentpageindex");
		// 当前页面尺寸
		String currentpagesize = request.getParameter("pagesize");
		// 设置当前页
		if (currentpageindex != null)
			pageindex = new Integer(currentpageindex);
		// 设置当前页尺寸
		if (currentpagesize != null)
			pagesize = new Integer(currentpagesize);
		List<Huiyuan> listhuiyuan = DALBase.getPageEnity("huiyuan", filter,
				pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("huiyuan",
				filter == null ? "" : filter);
		request.setAttribute("listhuiyuan", listhuiyuan);
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
			forwardurl = "/admin/huiyuanmanager.jsp";
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
