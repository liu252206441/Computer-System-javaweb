package com.daowen.bll;

import java.text.MessageFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import com.daowen.entity.Leaveword;
import com.daowen.dal.DALBase;

public class LeavewordBLL {
	
	public static String getLeaveword(){
		
		StringBuffer sb=new StringBuffer();
		sb.append("<ul >");
		List list=DALBase.getEntity("leaveword", "");
		
		for(Iterator<Leaveword> it=list.iterator();it.hasNext();)
		{
		         Leaveword c=it.next();
		         sb.append("<li class=\"item\">");
		         sb.append(MessageFormat.format("<img class=\"avatar\" src=\"{0}\" />",c.getPhoto()));
		        
		         sb.append("<div class='body'>");
		         sb.append("<div class=\"head\"></div>");
		         sb.append("<div class=\"content\">");
		         sb.append(MessageFormat.format("<span class=\"user-info\">{0}</span>",c.getLwren()));
		         String times="";
		         //System.out.println("new Date().getTime()="+new Date().getTime());
		         //System.out.println("c.getPubtime.getTime()="+c.getPubtime().getTime());
		         long day=(long)(new Date().getTime()- c.getPubtime().getTime())/(60 * 60 * 1000*24);
		         long hour=(long)(new Date().getTime()- c.getPubtime().getTime())/(60 * 60 * 1000);
		         long minuter=(long)(new Date().getTime()- c.getPubtime().getTime())/(60 * 1000);
		         long seconds=(new Date().getTime()- c.getPubtime().getTime())/1000;
		         //System.out.println("hour="+hour+"minuter="+minuter+"seconds="+seconds);
		         if(day>0)
		        	 times=day+"天前";
		         else
		         if(hour>0)
		        	 times=hour+"小时前";
		         else
		        	 if(minuter>0)
		        	   times=minuter+"分钟前";
		        	 else
		        		 times=seconds+"秒前";
		         sb.append(MessageFormat.format("<span class=\"pubtime\">{0}</span>",times));
		         sb.append("<div class='data-info'>");
		         sb.append(c.getDcontent());
		         //end data-info
		         sb.append("</div>");
		         //
		         if(c.getStatus()==1)
		         {
			         sb.append("<div class=\"reply\">");
			         sb.append("<div class=\"data\">");
			         sb.append(MessageFormat.format("<div class=\"item\">回复内容{0}</div>", c.getReplycontent()));
			         sb.append(MessageFormat.format("<span>回复时间{0}</span>", c.getReplytime().toLocaleString()));
			         sb.append(MessageFormat.format("<span>回复人:{0}</span>", c.getReplyren()));
			         sb.append("</div>");
			         sb.append("</div>");
		         }
		         
		         sb.append("<div class=\"footer\"></div>");
		         //end content
		         sb.append("</div>");
		        
		         //end body
		         sb.append("</div>");
		        
		         
		         sb.append("</li>");
		        
		
		}
		sb.append("</ul>");
		
		return sb.toString();
		
		
		
	}
	

}
