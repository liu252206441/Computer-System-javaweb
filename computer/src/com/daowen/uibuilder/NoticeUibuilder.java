package com.daowen.uibuilder;

import java.text.MessageFormat;
import java.util.Iterator;
import java.util.List;

import com.daowen.dal.DALBase;
import com.daowen.entity.Notice;

public class NoticeUibuilder {

	
	public static String build(int count,String des){
		return build(count,"box", des);
	}
	public static String build(){
		return build(10, "box","公告信息");
		
	}
	
	public static String build(int count,String cssclass,String des) {
		StringBuffer sb = new StringBuffer();

		List<Notice> list = DALBase.getTopList("notice", "", count);
		sb.append(MessageFormat.format("<div class=\"{0}\">",cssclass));
		sb.append(MessageFormat.format("<div class=\"title\"><strong>{0}</strong></div>",des));
		sb.append("<div class=\"content\">");
		sb.append("<ul>");
		sb.append("\r\n");
		for (Iterator<Notice> it = list.iterator(); it.hasNext();) {
			Notice n = it.next();
			sb.append(MessageFormat.format(
					"<li ><a href=''noticeinfo.jsp?id={0}''>{1}</a></li>",
					n.getId(), n.getTitle()));
			sb.append("\r\n");
		}
		sb.append("\r\n");
		sb.append("</ul>");
		sb.append("</div>");//end content
		sb.append("</div>");//end box
		return sb.toString();

	}
}
