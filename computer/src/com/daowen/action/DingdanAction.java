package com.daowen.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.MessageFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.daowen.bll.SystemParam;
import com.daowen.dal.DALBase;
import com.daowen.entity.Attachement;
import com.daowen.entity.Comment;
import com.daowen.entity.Dingdan;
import com.daowen.entity.Dingdanitems;
import com.daowen.entity.Huiyuan;
import com.daowen.entity.Shangpin;
import com.daowen.util.PagerMetal;

public class DingdanAction extends PageActionBase {
	public void onLoad() {
		String actiontype = request.getParameter("actiontype");
		System.out.println("actiontype=" + actiontype);
		if (actiontype == null)
			return;

		if (actiontype.equals("modifyAmount")) {
			modifyAmount();
		}
		if (actiontype.equals("shopcart")) {
			shopcart();
		}
		if (actiontype.equals("clearshopcart")) {
			clearshopcart();
		}
		if (actiontype.equals("removeShangpin")) {
			removeShangpin();
		}
		if (actiontype.equals("payfor"))
			fukuan();
		if (actiontype.equals("fahuo"))
			fahuo();
		if (actiontype.equals("qianshou"))
			qianshou();
		
		if (actiontype.equals("cancel"))
			cancel();

	}
	
	private void cancel() {

		String ddid = request.getParameter("ddid");

		
		String errorurl = request.getParameter("errorurl");

		if (ddid != null) {
			Dingdan dingdan = (Dingdan) DALBase.load("dingdan", "where id="
					+ ddid);

			dingdan.setStatus("已取消");
			DALBase.update(dingdan);

		}
		String forwardurl = request.getParameter("forwardurl");
		if (forwardurl != null)
			try {
				response.sendRedirect(SystemParam.getSiteRoot() + forwardurl);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	}

	private void qianshou() {

		String ddid = request.getParameter("ddid");
		String des = request.getParameter("des");
		String commentren = request.getParameter("commentren");
		String photo = request.getParameter("photo");
		String defen = request.getParameter("defen");
		if (ddid == null)
			return;

		Dingdan dingdan = (Dingdan) DALBase.load("dingdan", "where id=" + ddid);

		dingdan.setStatus("已收货");

		DALBase.update(dingdan);

		List<Dingdanitems> itemlist = (List<Dingdanitems>) DALBase.getEntity(
				"dingdanitems", "where ddno='" + dingdan.getDdno() + "'");
		if (itemlist != null) {
			for (Dingdanitems temitem : itemlist) {
				Comment comment = new Comment();
				comment.setBelongid(String.valueOf(temitem.getSpid()));
				comment.setCommentcontent(des == null ? "" : des);
				comment.setXtype("shangpin");
				comment.setPhoto(photo);
				comment.setCommenttime(new Date());
				comment.setCommentren(commentren);
				if (defen != null)
					comment.setDefen(Integer.parseInt(defen));

				DALBase.save(comment);
			}
		}

		String forwardurl = request.getParameter("forwardurl");
		if (forwardurl != null)
			try {
				response.sendRedirect(SystemParam.getSiteRoot() + forwardurl);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	}

	private void fahuo() {

		String ddid = request.getParameter("ddid");

		String fahuoren = request.getParameter("fahuoren");
		String wltype = request.getParameter("wltype");
		String wlorderno = request.getParameter("wlorderno");

		if (ddid != null) {
			Dingdan dingdan = (Dingdan) DALBase.load("dingdan", "where id="
					+ ddid);

			List<Dingdanitems> itemlist = (List<Dingdanitems>) DALBase.getEntity("dingdanitems", "where ddno='"+dingdan.getDdno()+"'");
	        if(itemlist!=null){
	        	for(Dingdanitems temitem :itemlist){
	        		Shangpin temShangpin=(Shangpin)DALBase.load("shangpin", "where id="+temitem.getSpid());
	        		if(temShangpin!=null)
	        		{
	        			temShangpin.setKucun(temShangpin.getKucun()-temitem.getShuliang());
	        			DALBase.update(temShangpin);
	        		}
	        	}
	        }
			
			dingdan.setStatus("已发货");
			dingdan.setFahuoren(fahuoren);
			dingdan.setWlorderno(wlorderno == null ? "" : wlorderno);
			dingdan.setWltype(wltype == null ? "" : wltype);
			dingdan.setFahuotime(new Date());
			DALBase.update(dingdan);

		}
		String forwardurl = request.getParameter("forwardurl");
		if (forwardurl != null)
			try {
				response.sendRedirect(SystemParam.getSiteRoot() + forwardurl);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	}

	private void fukuan() {

		String ddid = request.getParameter("ddid");

		String accountname = request.getParameter("accountname");
		String paypwd = request.getParameter("paypwd");

		String errorurl = request.getParameter("errorurl");
		if (ddid == null || accountname == null)
			return;

		Huiyuan hy = (Huiyuan) DALBase.load("huiyuan", "where accountname='"
				+ accountname + "'");
		if ((paypwd != null && !paypwd.equals(hy.getPaypwd()))
				|| paypwd == null) {
			request.setAttribute("errormsg",
					"<label class='error'>支付密码不正确请重新输入</label>");
			try {
				request.getRequestDispatcher(errorurl).forward(request,
						response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}
		Dingdan dingdan = (Dingdan) DALBase.load("dingdan", "where id=" + ddid);

		if (hy.getYue() < dingdan.getTotalprice()) {

			request.setAttribute("errormsg",
					"<label class='error'>账户余额不足于支付订单,请充值</label>");
			try {
				request.getRequestDispatcher("/e/huiyuan/fukuan.jsp?id=" + ddid)
						.forward(request, response);

				return;
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}

		if (hy.getJifen() < dingdan.getTotaljifen()) {

			request.setAttribute("errormsg",
					"<label class='error'>账户积分不足于支付订单,请充积分</label>");
			try {
				request.getRequestDispatcher("/e/huiyuan/fukuan.jsp?id=" + ddid)
						.forward(request, response);

				return;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		hy.setYue((float) (hy.getYue() - dingdan.getTotalprice()));
		hy.setJifen(hy.getJifen() - (int) dingdan.getTotaljifen());
		hy.setJifen(hy.getJifen() + (int) dingdan.getTotalprice());
		DALBase.update(hy);
		dingdan.setStatus("已付款");
		DALBase.update(dingdan);
		request.getSession().setAttribute("huiyuan", hy);

		String forwardurl = request.getParameter("forwardurl");
		if (forwardurl != null)
			try {
				response.sendRedirect(SystemParam.getSiteRoot() + forwardurl);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	}

	/*
	 * 修改购物车数量
	 */
	private void modifyAmount() {

		String spid = request.getParameter("spid");
		String shuliang = request.getParameter("shuliang");
		List<Dingdanitems> temlist = (List<Dingdanitems>) request.getSession()
				.getAttribute("cart");
		if (temlist != null) {
			for (Iterator<Dingdanitems> it = temlist.iterator(); it.hasNext();) {

				Dingdanitems ddi = it.next();

				if (ddi.getSpid() == new Integer(spid)) {

					ddi.setShuliang(new Integer(shuliang));

				}

			}
		}
		calcuateTotalfee();
		String forwardurl = request.getParameter("forwardurl");
		if (forwardurl != null)
			try {
				response.sendRedirect(SystemParam.getSiteRoot() + forwardurl);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	}

	private void removeShangpin() {

		String spid = request.getParameter("spid");

		List<Dingdanitems> temlist = (List<Dingdanitems>) request.getSession()
				.getAttribute("cart");
		if (temlist != null) {
			for (Iterator<Dingdanitems> it = temlist.iterator(); it.hasNext();) {

				Dingdanitems ddi = it.next();

				if (ddi.getSpid() == new Integer(spid)) {

					it.remove();
					float totalfee = Float.parseFloat(request.getSession()
							.getAttribute("totalfee").toString());

					totalfee -= ddi.getShuliang() * ddi.getJiage();

					request.getSession().setAttribute("totalfee", totalfee);

				}

			}
		}
		String forwardurl = request.getParameter("forwardurl");
		if (forwardurl != null)
			try {
				response.sendRedirect(SystemParam.getSiteRoot() + forwardurl);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	}

	private void clearshopcart() {

		request.getSession().removeAttribute("cart");
		request.getSession().removeAttribute("totalfee");
		request.getSession().removeAttribute("totaljifen");
		String forwardurl = request.getParameter("forwardurl");
		if (forwardurl != null)
			try {
				response.sendRedirect(SystemParam.getSiteRoot() + forwardurl);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	}

	private void calcuateTotalfee() {
		List<Dingdanitems> cart = (List<Dingdanitems>) request.getSession()
				.getAttribute("cart");
		double totalfee = 0;
		double totaljifen = 0;
		for (Dingdanitems dditem : cart) {

			if (dditem.getTuihuan() != 1)
				totalfee += dditem.getShuliang()
						* new Double(dditem.getJiage());
			else
				totaljifen += dditem.getShuliang() * dditem.getJiage() * 10;

		}
		request.getSession().setAttribute("totalfee", totalfee);
		request.getSession().setAttribute("totaljifen", totaljifen);

	}

	private void shopcart() {

		String forwardurl = request.getParameter("forwardurl");
		// 商品ID
		String spid = request.getParameter("spid");
		// 商品名
		String spname2 = request.getParameter("spname");
		//
		String command = request.getParameter("command");
		// request.setCharacterEncoding("UTF-8");
		double totalfee = 0;
		double totaljifen = 0;
		List<Dingdanitems> cart = (List<Dingdanitems>) request.getSession()
				.getAttribute("cart");

		if (spid != null) {

			if (cart == null) {

				cart = new ArrayList<Dingdanitems>();
				request.getSession().setAttribute("cart", cart);

			}
			Shangpin addshangpin = (Shangpin) DALBase.load("shangpin",
					"where id=" + spid);

			Boolean hasin = false;

			for (Dingdanitems dditem : cart) {
				System.out.println("addshangpin.getId()" + addshangpin.getId());
				System.out.println("dditem.getId()" + dditem.getId());
				if (addshangpin.getId() == dditem.getSpid()) {

					hasin = true;
					if (command != null && command.equals("modifyCount")) {
						String shuliang = request.getParameter("shuliang");
						dditem.setShuliang(new Integer(shuliang));
					} else
						dditem.setShuliang(dditem.getShuliang() + 1);

				}
				if (dditem.getTuihuan() != 1)
					totalfee += dditem.getShuliang() * dditem.getJiage();
				else
					totaljifen += dditem.getShuliang() * dditem.getJiage() * 10;
			}
			if (!hasin) {
				Dingdanitems temitem = new Dingdanitems();
				temitem.setSpname(addshangpin.getName());
				temitem.setSpimage(addshangpin.getTupian());
				temitem.setSpno(addshangpin.getSpno());
				temitem.setSpid(addshangpin.getId());
				temitem.setShuliang(1);
				temitem.setTuihuan(addshangpin.getTuihuan());
				temitem.setJiage(addshangpin.getHyjia());
				temitem.setTuihuan(addshangpin.getTuihuan());
				if (temitem.getTuihuan() != 1)
					totalfee += addshangpin.getHyjia();
				else
					totaljifen += addshangpin.getHyjia() * 10;

				cart.add(temitem);

			}

		}

		request.getSession().setAttribute("totalfee", totalfee);
		request.getSession().setAttribute("totaljifen", totaljifen);

		if (forwardurl != null)
			try {
				response.sendRedirect(SystemParam.getSiteRoot() + forwardurl);
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
		DALBase.delete("dingdan", " where id=" + id);
		binding();
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {

		String shouhuodizhi = request.getParameter("shouhuodizhi");
		String shrtel = request.getParameter("shrtel");
		String shraddress = request.getParameter("shraddress");
		String shrname = request.getParameter("shrname");

		String des = request.getParameter("des");
		String xdren = request.getParameter("xdren");
		String status = request.getParameter("status");

		List<Dingdanitems> listitems = (List<Dingdanitems>) request
				.getSession().getAttribute("cart");

		if (listitems == null) {
			try {
				response.sendRedirect(SystemParam.getSiteRoot()
						+ "/e/shangpinlist.jsp");
			} catch (IOException e) {

				e.printStackTrace();
			}
			return;
		}

		SimpleDateFormat sdfdingdan = new SimpleDateFormat("yyyy-MM-dd");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyymmddHHMMss");

		String timestamp = sdf.format(new Date());

		Dingdan dingdan = new Dingdan();
		dingdan.setDdno("D" + timestamp);

		Double totalprice = 0.0;
		double totaljifen = 0;
		for (Dingdanitems dd : listitems) {

			dd.setDdno(dingdan.getDdno());
			dd.setDes(xdren + "购买" + dd.getSpname());

			if (dd.getTuihuan() != 1)
				totalprice += dd.getJiage() * dd.getShuliang();
			else
				totaljifen = dd.getJiage() * dd.getShuliang() * 10;
			DALBase.save(dd);

			Shangpin shangpin = (Shangpin) DALBase.load("shangpin",
					" where spno='" + dd.getSpno() + "'");
			if (shangpin.getKucun() >= dd.getShuliang()) {
				shangpin.setKucun(shangpin.getKucun() - dd.getShuliang());
				DALBase.update(shangpin);
			}

		}

		dingdan.setTitle("");

		dingdan.setXiadantime(new Date());

		dingdan.setXiadanren(xdren);
		dingdan.setTotalprice(totalprice);
		dingdan.setTotaljifen(totaljifen);

		dingdan.setStatus("待付款");

		dingdan.setFahuotime(new Date());
		// 收货地址
		dingdan.setShouhuodizhi(shouhuodizhi);
		dingdan.setShrtel(shrtel);
		dingdan.setShraddress(shraddress);
		dingdan.setShrname(shrname);

		dingdan.setDes(des);
		DALBase.save(dingdan);

		clearshopcart();
	}

	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Dingdan dingdan = (Dingdan) DALBase
				.load(Dingdan.class, new Integer(id));
		if (dingdan == null)
			return;
		String title = request.getParameter("title");
		String ddno = request.getParameter("ddno");
		String xiadantime = request.getParameter("xiadantime");
		String xiadanren = request.getParameter("xiadanren");
		String totalprice = request.getParameter("totalprice");
		String status = request.getParameter("status");
		String fahuoren = request.getParameter("fahuoren");
		String fahuotime = request.getParameter("fahuotime");
		String shouhuodizhi = request.getParameter("shouhuodizhi");
		String shrtel = request.getParameter("shrtel");
		String shraddress = request.getParameter("shraddress");
		String shrname = request.getParameter("shrname");
		String des = request.getParameter("des");
		SimpleDateFormat sdfdingdan = new SimpleDateFormat("yyyy-MM-dd");
		dingdan.setTitle(title);
		dingdan.setDdno(ddno);
		try {
			dingdan.setXiadantime(sdfdingdan.parse(xiadantime));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		dingdan.setXiadanren(xiadanren);
		dingdan.setTotalprice(totalprice == null ? (double) 0 : new Double(
				totalprice));
		dingdan.setStatus(status);
		dingdan.setFahuoren(fahuoren);
		try {
			dingdan.setFahuotime(sdfdingdan.parse(fahuotime));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		dingdan.setShouhuodizhi(shouhuodizhi);
		dingdan.setShrtel(shrtel);
		dingdan.setShraddress(shraddress);
		dingdan.setShrname(shrname);
		dingdan.setDes(des);
		DALBase.update(dingdan);

		binding();
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
			Dingdan dingdan = (Dingdan) DALBase.load("dingdan", "where id="
					+ id);
			if (dingdan != null) {
				request.setAttribute("dingdan", dingdan);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/dingdanadd.jsp";
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
		String filter = "where 1=1 ";
		String xdren = request.getParameter("xiadanren");
		String isurl = request.getParameter("isurl");
		if (xdren != null) {

			if (isurl != null && isurl.equals("1"))
				try {
					xdren = new String(xdren.getBytes("ISO-8859-1"), "UTF-8");
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			filter += " and xiadanren='" + xdren + "'";
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
		List<Dingdan> listdingdan = DALBase.getPageEnity("dingdan", filter,
				pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("dingdan",
				filter == null ? "" : filter);
		request.setAttribute("listdingdan", listdingdan);
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
			forwardurl = "/admin/dingdanmanager.jsp";
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
