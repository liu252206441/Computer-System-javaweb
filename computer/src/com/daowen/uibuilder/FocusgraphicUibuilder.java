package com.daowen.uibuilder;

import java.text.MessageFormat;
import java.util.Iterator;
import java.util.List;

import com.daowen.dal.DALBase;
import com.daowen.entity.Jiaodiantu;
import com.daowen.entity.Notice;

public class FocusgraphicUibuilder {

	
	
	public static String buildBigFocusGraphic()
	{
		StringBuffer sb = new StringBuffer();
		
		StringBuffer titleCell=new StringBuffer();
		StringBuffer contentCell=new StringBuffer();
		sb.append("<div class=\"slideBox\">");
        int i=0;
		List<Jiaodiantu> list = DALBase.getTopList("jiaodiantu", "", 10);
		titleCell.append("<div class=\"hd\"><ul class=\"smallUl\">\r\n");
		contentCell.append("<div class=\"bd\"><ul>\r\n");
		for (Iterator<Jiaodiantu> it = list.iterator(); it.hasNext();) {
			Jiaodiantu n = it.next();
			if(i==0){
			   titleCell.append(MessageFormat.format("<li class=\"on\">{0}</li>\r\n",i++));
			   contentCell.append(MessageFormat.format(
						"<li style=\"display: list-item;\"><a href=\"{0}\" target=\"_blank\"><div style=\"background:url({1}) no-repeat; background-position:center; width:100%; height:545px; background-size:100% 100%\"></div></a></li>",
						n.getHref(), n.getTupian()));
			}
			else 
			{
				titleCell.append(MessageFormat.format("<li >{0}</li>\r\n",i++));
			
				contentCell.append(MessageFormat.format(
					"<li style=\"display: none;\"><a href=\"{0}\" target=\"_blank\"><div style=\"background:url({1}) no-repeat; background-position:center; width:100%; height:545px; background-size:100% 100%\"></div></a></li>",
					n.getHref(), n.getTupian()));
			}
			
		}
		titleCell.append("</ul></div>");
		contentCell.append("</ul></div>");
		sb.append(titleCell);
		sb.append(contentCell);
		sb.append(" <a class=\"prev\" href=\"javascript:void(0)\"><em class=\"left_arrow\"></em></a>");
		sb.append(" <a class=\"next\" href=\"javascript:void(0)\"><em class=\"right_arrow\"></em></a>");
		sb.append("\r\n");
		sb.append("</div>");
		sb.append("\r\n");
		sb.append("</div>");
		
		return sb.toString();
	}
}
