package com.daowen.action;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.daowen.bll.SystemParam;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

//****控制器基类

public abstract class PageActionBase extends ActionSupport{
	
    public HttpServletResponse response;
    
    public HttpServletRequest  request;
    
	public abstract  void save(); 
	
	public abstract  void update(); 
	
	public abstract  void delete(); 
	
	public abstract  void binding(); 
	
	public abstract  void load(); 
	
	
	
	@Override
	public String execute(){
		response = (HttpServletResponse)ActionContext.getContext().get(org.apache.struts2.StrutsStatics.HTTP_RESPONSE);
		
		request = (HttpServletRequest)ActionContext.getContext().get(org.apache.struts2.StrutsStatics.HTTP_REQUEST);
		
		String actiontype = request.getParameter("actiontype");
		if (actiontype == null)
			return null;
		// 如果是获取表单数据
		if (actiontype.equals("get") || actiontype.equals("search")) {
			binding();
		}
		// 加载
		if (actiontype.equals("load")) {
			load();
		}
		if (actiontype.equals("delete")) {
			delete();
		}
		// 保存操作
		if (actiontype.equals("save")) {
			save();
		}
		// 更行操作
		if (actiontype.equals("update")) {
			update();
		}
		onLoad();
		
		return null;
	}
	public void  onLoad(){
		
	}
	
	public void redirect(String url){
		
		
		try {
			response.sendRedirect(SystemParam.getSiteRoot() + url);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void requestDispatch(String url){
		
		try {
			request.getRequestDispatcher(url).forward(request,
					response);
		} catch (ServletException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
	}
	
	public  String join(String join,String[] strAry){
        StringBuffer sb=new StringBuffer();
        for(int i=0;i<strAry.length;i++){
             if(i==(strAry.length-1)){
                 sb.append(strAry[i]);
             }else{
                 sb.append(strAry[i]).append(join);
             }
        }
        
        return new String(sb);
    }
 
	
	
	/***********************************
	 * *********************************
	 * 分发请求参数
	 
	 */
	public  void  dispatchParams(HttpServletRequest request,HttpServletResponse response){
		Enumeration  params=request.getParameterNames();
		while (params.hasMoreElements())
		{
		   String paramname=params.nextElement().toString();
		   String value=request.getParameter(paramname);
		   request.setAttribute(paramname, value);
	   
		   
		}
	}
	
	
	
	
	

	
}
