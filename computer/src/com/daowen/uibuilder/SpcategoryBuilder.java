package com.daowen.uibuilder;

import java.text.MessageFormat;
import java.util.Iterator;
import java.util.List;

import com.daowen.bll.SystemParam;
import com.daowen.dal.DALBase;
import com.daowen.entity.Shangpin;
import com.daowen.entity.Spcategory;

public class SpcategoryBuilder {

	
	
public String BuildNavMenu(){
		
		StringBuffer sb=new StringBuffer();
		List<Spcategory> parentlist=DALBase.getEntity("spcategory", "where isleaf=0 ");
		
		for(Iterator<Spcategory> iterator = parentlist.iterator();iterator.hasNext();){
		   
			Spcategory spc=iterator.next();
			sb.append("<dl>");
			//商品根类
			sb.append(MessageFormat.format("<dt>{0}</dt>",spc.getMingcheng()));
			sb.append("<dd>");
			
			List<Spcategory> listchild=DALBase.getEntity("spcategory", "where parentid="+spc.getId());
			
			for(Spcategory temchildspc : listchild){
			  sb.append(MessageFormat.format("<a href=''{0}/e/shangpinlist.jsp?spcid={1}''>{2}</a>",SystemParam.getSiteRoot(),temchildspc.getId(),temchildspc.getMingcheng()));
			
			}
			
			sb.append("</dd>");
			
			//
			sb.append("</dl>");
			
			
		}
		
        List<Spcategory> rootleaf=DALBase.getEntity("spcategory", "where isleaf=1 and parentid=0 ");
        sb.append("<ul>");
		for(Iterator<Spcategory> iterator = rootleaf.iterator();iterator.hasNext();){
		   
			Spcategory spc=iterator.next();
			
			//商品根类
			sb.append(MessageFormat.format("<li><a href=''{0}/e/shangpinlist.jsp?spcid={1}''>{2}</a></li>",SystemParam.getSiteRoot(), spc.getId(), spc.getMingcheng()));
	
			
			
		}
		sb.append("</ul>");
		
		return sb.toString();
		
		
		
	}
	public String BuildIndexMenu(){
		
		StringBuffer sb=new StringBuffer();
		List<Spcategory> parentlist=DALBase.getTopList("spcategory", "where isleaf=0 ",5);
		sb.append("<ul class=\"Menu_list\">	");
		for(Iterator<Spcategory> iterator = parentlist.iterator();iterator.hasNext();){
		   
			Spcategory spc=iterator.next();
			sb.append("<li class=\"name on\">	");
			//商品根类
			sb.append(MessageFormat.format("<div class=\"Menu_name\"><a href=\"{0}/e/shangpinlist.jsp?spcid={1}\">{2}</a> <span>&lt;</span></div>",SystemParam.getSiteRoot(),spc.getId(),spc.getMingcheng()));
			
			
			List<Spcategory> listchild=DALBase.getEntity("spcategory", "where parentid="+spc.getId());
			sb.append("<div class=\"link_name\">");
			int i=0;
			for(Spcategory temchildspc : listchild){
			  //if(i%4==0)
				 // sb.append("<p>");
			  sb.append(MessageFormat.format("<a href=''{0}/e/shangpinlist.jsp?spcid={1}''>{2}</a>",SystemParam.getSiteRoot(),temchildspc.getId(),temchildspc.getMingcheng()));
			 // if(++i%4==0)
				//  sb.append("</p>");
			}
			sb.append("</div>");
			sb.append("</li>");
			
			
		}
		    
        sb.append("<ul>");
		
		
		return sb.toString();
		
		
		
	}
	
	
}
