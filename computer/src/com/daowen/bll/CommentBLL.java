package com.daowen.bll;

import java.text.MessageFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;


import com.daowen.entity.Comment;
import com.daowen.dal.DALBase;

public class CommentBLL {
	
	public static String getComments(String type,String belongid){
		
		StringBuffer sb=new StringBuffer();
		sb.append("<h4>评论信息</h4>");
		sb.append("<ul>");
		List list=DALBase.getEntity("comment", MessageFormat.format(" where xtype=''{0}'' and belongid=''{1}''",type,belongid));
		
		for(Iterator<Comment> it=list.iterator();it.hasNext();)
		{
		         Comment c=it.next();
		         sb.append("<li>");
		         sb.append("<div class='comment-item'>");
		         sb.append("<div class=\"comment-user\">");
		         sb.append("<div class='pic fn-left'>");
		         sb.append(MessageFormat.format("<img width=\"48\" height=\"48\" src=\"{0}\" />",c.getPhoto()));

		         sb.append("</div>");
		         sb.append("<div style='width:80px;' class=\"fn-left\">");
		         String times="";
		         int hour=(int)(new Date().getTime()- c.getCommenttime().getTime())/(60 * 60 * 1000);
		         long minuter=(int)(new Date().getTime()- c.getCommenttime().getTime())/(60 * 1000);
		         long seconds=(new Date().getTime()- c.getCommenttime().getTime())/1000;
		         if(hour>0)
		        	 times=hour+"小时前";
		         else
		        	 if(minuter>0)
		        	   times=minuter+"分钟前";
		        	 else
		        		 times=seconds+"秒前";
		         
		         sb.append(MessageFormat.format("<div>{0}</div>", times));
    	         sb.append(MessageFormat.format("<div>{0}</div>", c.getCommentren()));
		         sb.append("</div>");
		         //comment-user
		         sb.append("</div>");
		         sb.append("<div class='item-content'>");
		         sb.append("用户"+c.getCommentren()+"评价");
		         for(int i=0;i<c.getDefen();i++)
		            sb.append("<i class='fa fa-asterisk'></i>");
		         sb.append(c.getCommentcontent());
		         sb.append("</div>");
        
		         //comment-item
		         sb.append("</div>");
		         sb.append("</li>");
		        
		
		}
		sb.append("</ul>");
		
		return sb.toString();
		
		
		
	}
	

}
