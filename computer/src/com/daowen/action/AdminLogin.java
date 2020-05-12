package com.daowen.action;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import com.daowen.bll.SystemParam;
import com.daowen.dal.DALBase;
import com.daowen.entity.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AdminLogin extends ActionSupport {

	public String execute() {
		
		HttpServletResponse response = (HttpServletResponse)ActionContext.getContext().get(org.apache.struts2.StrutsStatics.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest)ActionContext.getContext().get(org.apache.struts2.StrutsStatics.HTTP_REQUEST);
		String actiontype = request.getParameter("actiontype");
		System.out.println("actiontype=" + actiontype);

		// ��¼
		if (actiontype.equals("login")) {
			login(request, response);
		}

		return null;
	}

	private void login(HttpServletRequest request, HttpServletResponse response) {

		String usertype = request.getParameter("usertype");

		String validcode = (String) request.getSession().getAttribute(
				"validcode");

		String inputvalidcode = request.getParameter("validcode");

		if (validcode != null && !validcode.equals(inputvalidcode)) {

			
			request.setAttribute("errmsg",
					"<img src=\"images/error.gif\"/>错误");

			// �ַ��������
			dispatchParams(request, response);
			try {
				request.getRequestDispatcher("/admin/login.jsp").forward(
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

		System.out.println("=" + validcode);

		if (usertype != null && usertype.equals("0")) {
			adminLogin(request, response);

		}

		
		

	}

	private void adminLogin(HttpServletRequest request,
			HttpServletResponse response) {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String usertype = request.getParameter("usertype");

		String action = request.getParameter("action");

		Users u = (Users) DALBase.load("users", " where username='" + username
				+ "' and password='" + password + "'");

		if (u != null) {

			HttpSession session = request.getSession();
			u.setLogtimes(u.getLogtimes() + 1);
			DALBase.update(u);
			session.setAttribute("users", u);

			try {
				response.sendRedirect(SystemParam.getSiteRoot()
						+ "/admin/index.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else {

			// �ַ�
			dispatchParams(request, response);
			request.setAttribute("errmsg",
					"<img src=\"images/error.gif\"/>错误");

			System.out.println("ϵͳ�û���¼ʧ��");
			try {
				request.getRequestDispatcher("/admin/login.jsp").forward(
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
	
  

	public void dispatchParams(HttpServletRequest request,
			HttpServletResponse response) {
		Enumeration params = request.getParameterNames();
		while (params.hasMoreElements()) {
			String paramname = params.nextElement().toString();
			String value = request.getParameter(paramname);
			request.setAttribute(paramname, value);

		}
	}

}
