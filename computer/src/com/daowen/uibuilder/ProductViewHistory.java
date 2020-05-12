package com.daowen.uibuilder;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductViewHistory {

	
	private  static String  cookieprefix="shangpin_browser";
	
	 public static List HistoryView(HttpServletRequest request) {
    	 
   	      Cookie [] viewedshangpins=request.getCookies(); 
 	        List ids=new ArrayList<String>();
	        if(viewedshangpins!=null&&viewedshangpins.length>0){
	        	
	        	for(Cookie c : viewedshangpins){
	        		
	        		if(c.getName().startsWith(cookieprefix)){
	        			ids.add(c.getValue());
	        			
	        		}
	        	}
	        	
	        }
	        
	        return ids;
	 }
	 
	 
	 public static void View(HttpServletRequest request,HttpServletResponse response,String spid){
		 
		 Cookie[] cookies=  request.getCookies();
		    
	        List<Cookie> cookielist=new ArrayList<Cookie>();
	        
	        Cookie temcookie=null;
	        
	        if(cookies!=null&&cookies.length>0){
	        	
	        	for(Cookie cookie : cookies){
	        		
	        		String cookiename=cookie.getName();
	        		if(cookiename.startsWith(cookieprefix)){
	        			cookielist.add(cookie);
	        		}
	        		
	        		if(cookie.getValue().equals(spid)){
	        			temcookie=cookie;
	        		}
	        		
	        	}
	         }
	        
	         if(cookielist.size()>20&&temcookie==null){
	        	 temcookie=cookielist.get(0);
	        	 
	         }
	         if(temcookie!=null)
	         {
	        	 temcookie.setMaxAge(0);
	        	 response.addCookie(temcookie);
	         }
	        
	         Cookie cookieadd=new Cookie(cookieprefix+spid,spid);
	         response.addCookie(cookieadd);
	 }
	
	
}
