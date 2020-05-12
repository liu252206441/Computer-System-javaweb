package com.daowen.uibuilder;

import java.util.List;

import com.daowen.dal.DALBase;
import com.daowen.entity.Indexcolumns;

public class IndexColumnsBuilder {

	
	public String buildColumns(){
		
		int columncontentsize=10;
		StringBuffer sb=new StringBuffer();
		ShangpinBuilder  shangpinbuilder=new ShangpinBuilder();
		List<Indexcolumns>  list=DALBase.getEntity("indexcolumns", "");
		for (Indexcolumns indexcolumns : list) {
			sb.append(shangpinbuilder.buildImageShangpin(indexcolumns.getColid(), columncontentsize));
			sb.append("\r\n");
			
		}
		return sb.toString();
		
		
	}
	
	
}
