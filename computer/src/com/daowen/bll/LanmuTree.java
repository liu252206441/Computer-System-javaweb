package com.daowen.bll;

import com.daowen.dal.DALBase;
import com.daowen.entity.Lanmu;


public class LanmuTree extends RecursionTree<Lanmu> {

	public LanmuTree(){
	
		setTextfieldname("title");
		
	}
	
	 public void toNonLeaf(String id){
		   
		    Lanmu m=(Lanmu)DALBase.load("lanmu", "where id="+id);
		    if(m!=null)
		    {
			    m.setIsleaf(0);
			    DALBase.update(m);
		    }
	  }
	
	
	
}
