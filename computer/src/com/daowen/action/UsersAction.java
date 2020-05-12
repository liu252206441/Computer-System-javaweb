package com.daowen.action;

import java.io.IOException;
import java.text.MessageFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.daowen.bll.SystemParam;
import com.daowen.dal.DALBase;
import com.daowen.entity.Attachement;


import com.daowen.entity.Users;
import com.daowen.util.PagerMetal;

/*******************************************************************************
 * 
 * 
 * 
 */
public class UsersAction extends PageActionBase {
	public void  onLoad() {
		String actiontype = request.getParameter("actiontype");
		System.out.println("actiontype=" + actiontype);
		if (actiontype == null)
			return ;
		if (actiontype.equals("modifyPw"))
			modifyPw();
		
		
		
	}
	
	private void modifyPw() {
		String password1 = request.getParameter("password1");
		String repassword1 = request.getParameter("repassword1");
		String repassword2 = request.getParameter("repassword2");
		String forwardurl = request.getParameter("forwardurl");
		String errorpageurl = request.getParameter("errorpageurl");
		String id = request.getParameter("id");
		if (id == null || id == "")
			return;
		Users users = (Users) DALBase.load(Users.class, new Integer(id));
		if (users != null) {
			if (!users.getPassword().equals(password1)) {
				try {
					request.setAttribute("errormsg",
							"<label class='error'>原始密码不正确，不能修改</label>");
					request.getRequestDispatcher(errorpageurl).forward(request,
							response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				users.setPassword(repassword1);
				DALBase.update(users);
				request.getSession().setAttribute("users", users);
				try {
					if (forwardurl != null)
						response.sendRedirect(SystemParam.getSiteRoot()
								+ forwardurl);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}


	/***************************************************************************
	 * *****************信息注销监听支持*****************************
	 **************************************************************************/
	public void delete() {
		String id = request.getParameter("id");
		DALBase.delete("users", " where id=" + id);
		binding();
	}

	/***************************************************************************
	 * ***************保存动作监听支持******************************
	 **************************************************************************/
	public void save() {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String rolename = request.getParameter("rolename");
		String creator = request.getParameter("creator");
		String createtime = request.getParameter("createtime");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");

		String realname = request.getParameter("realname");
		String nickname = request.getParameter("nickname");
		String sex = request.getParameter("sex");
		String xiangpian = request.getParameter("xiangpian");
		SimpleDateFormat sdfusers = new SimpleDateFormat("yyyy-MM-dd");
		Users users = new Users();
		users.setUsername(username == null ? "" : username);
		users.setPassword(password == null ? "" : password);
		
		users.setCreator(creator == null ? "" : creator);
		
	    users.setCreatetime(new Date());
		
		users.setEmail(email == null ? "" : email);
		users.setTel(tel == null ? "" : tel);
		users.setLogtimes(0);
		users.setRealname(realname == null ? "" : realname);
		users.setNickname(nickname == null ? "" : nickname);
		users.setSex(sex == null ? "" : sex);
		users.setXiangpian(xiangpian == null ? "" : xiangpian);
		DALBase.save(users);
		// 保存附件
	
		// 绑定数据
		binding();
	}

	
	/***************************************************************************
	 * **********************更新内部支持*********************
	 **************************************************************************/
	public void update() {
		String id = request.getParameter("id");
		if (id == null)
			return;
		Users users = (Users) DALBase.load(Users.class, new Integer(id));
		if (users == null)
			return;
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String rolename = request.getParameter("rolename");
		String creator = request.getParameter("creator");
		String createtime = request.getParameter("createtime");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String logtimes = request.getParameter("logtimes");
		String realname = request.getParameter("realname");
		String nickname = request.getParameter("nickname");
		String sex = request.getParameter("sex");
		String xiangpian = request.getParameter("xiangpian");
		SimpleDateFormat sdfusers = new SimpleDateFormat("yyyy-MM-dd");
		users.setUsername(username);
		
		users.setCreator(creator);
		
		users.setEmail(email);
		users.setTel(tel);
		
		users.setRealname(realname);
		users.setNickname(nickname);
		users.setSex(sex);
		users.setXiangpian(xiangpian);
		DALBase.update(users);
		
		binding();
	}

	/***************************************************************************
	 * **********************加载内部支持*********************
	 **************************************************************************/
	public void load() {
		//
		String id = request.getParameter("id");
		String actiontype = "save";
		if (id != null) {
			Users users = (Users) DALBase.load("users", "where id=" + id);
			if (users != null) {
				request.setAttribute("users", users);
			}
			actiontype = "update";
		}
		request.setAttribute("id", id);
		request.setAttribute("actiontype", actiontype);
		
		try {
			request.getRequestDispatcher("usersadd.jsp").forward(request,
					response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/***************************************************************************
	 * **********************数据绑定内部支持*********************
	 **************************************************************************/
	public void binding() {
		String filter = "";
		String username = request.getParameter("username");
		if (username != null)
			filter = "  where username like '%" + username + "%'  ";
		//
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
		List<Users> listusers = DALBase.getPageEnity("users", filter,
				pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("users", filter == null ? ""
				: filter);
		request.setAttribute("listusers", listusers);
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
			request.getRequestDispatcher("/admin/usersmanager.jsp").forward(
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
