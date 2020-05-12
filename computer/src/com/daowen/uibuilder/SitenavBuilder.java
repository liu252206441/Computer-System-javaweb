package com.daowen.uibuilder;

import java.text.MessageFormat;
import java.util.List;

import com.daowen.bll.SystemParam;
import com.daowen.dal.DALBase;
import com.daowen.entity.Sitenav;

public class SitenavBuilder {

	public String build(String  classname){
		
		StringBuilder sb=new StringBuilder();
		
		sb.append(MessageFormat.format("<ul class=\"{0}\">",classname));
		
		List<Sitenav> list=DALBase.getEntity("sitenav", " order by sindex asc");
		int i=0;
		for(Sitenav sn : list){
			String current="";
			if(i==0){
				current="current";
				
			}
			sb.append("<li>");
			if(sn.getHref().split("\\?").length>1)
				sb.append(MessageFormat.format(" <a   id=\"{0}\" class=\"{3}\" href=\"{1}{2}&headid={0}\">{4}</a>",sn.getId(),SystemParam.getSiteRoot(),sn.getHref(),current,sn.getTitle()));
			else {
				System.out.println("current="+current);
				sb.append(MessageFormat.format(" <a  id=\"{0}\" class=\"{3}\"  href=\"{1}{2}?headid={0}\">{4}</a>",sn.getId(),SystemParam.getSiteRoot(),sn.getHref(),current,sn.getTitle()));
			}
			
			sb.append("</li>");
			i++;
		}
		
		sb.append(" </ul>");
		
		
		return sb.toString();
		
	}
	
	
}
