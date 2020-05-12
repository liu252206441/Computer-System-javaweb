package com.daowen.uibuilder;

import java.text.MessageFormat;
import java.util.Iterator;
import java.util.List;
import com.daowen.entity.*;

import com.daowen.dal.DALBase;


public class LanmuBuilder extends UibuilderBase {

	
	public LanmuBuilder(String lanmuclassname){
		super("xinxi", lanmuclassname, "title", "tupian2");
	}
	public LanmuBuilder(){
	  this("box");
	}
	
	/***
	 * 
	 * @param lanmuid ��Ŀ���
	 * 
	 * @return  ������Ŀ��Ϣ
	 */
	public String buildTextLanmu(int lanmuid){
		
		StringBuffer sb=new StringBuffer();
		Lanmu lm=(Lanmu)DALBase.load("lanmu", "where id="+lanmuid);
		if(lm==null)
			return "";
		List<Xinxi> listxinxi=findXinxiByLanmu(lanmuid);
		
	    sb.append(buildTextLanmu(listxinxi, lm.getTitle()));
		
		return sb.toString();
		
	}
	/***
	 * 
	 * @param lanmuid ��Ŀ���
	 * 
	 * @return  ������Ŀ��Ϣ
	 */
	public String buildImageLanmu(int lanmuid){
		
		StringBuffer sb=new StringBuffer();
		Lanmu lm=(Lanmu)DALBase.load("lanmu", "where id="+lanmuid);
		if(lm==null)
			return "";
		List<Xinxi> listxinxi=findXinxiByLanmu(lanmuid);
		//
		System.out.println("总数="+listxinxi.size());
	    sb.append(buildImageLanmu(listxinxi, lm.getTitle()));
	
		
		return sb.toString();
		
	}

	/**
	 * 
	 * @param classname
	 * @return��ȡ�Ƽ���Ѷ��Ϣ�ı�����
	 */
	public String buildRecomment(String lanmudes){
		
		StringBuffer sb=new StringBuffer();
		
		List<Xinxi> listxinxi=DALBase.getTopList("xinxi", "where tuijian=1 order by pubtime desc",10);
		
		
	    sb.append(buildTextLanmu(listxinxi, lanmudes));
	
		
		return sb.toString();
	
		
	}
	
	/**
	 * 
	 * @param classname
	 * @return��ȡ�Ƽ���Ѷ��Ϣ�ı�����
	 */
	public String buildNewest(String lanmudes){
		
		StringBuffer sb=new StringBuffer();

		
		List<Xinxi> listxinxi=DALBase.getTopList("xinxi", "where zuixin=1 order by pubtime desc",10);

	    sb.append(buildTextLanmu(listxinxi, lanmudes));
        return sb.toString();
	}
	
	public  List<Xinxi> findXinxiByLanmu(int lanmuid){
		
		List<Xinxi> list=DALBase.runNativeSQL(MessageFormat.format("select * from  xinxi where lanmuid in (select id from lanmu where parentid={0}) or lanmuid={0} order by pubtime desc",lanmuid),Xinxi.class);
		
		return list;
	}
	
    public  List<Xinxi> findXinxiByLanmu(int lanmuid,int topcount){
		
		List<Xinxi> list=DALBase.runNativeSQL(MessageFormat.format("select  * from  xinxi where lanmuid in (select id from lanmu where parentid={0}) or lanmuid={0} order by pubtime desc  limit {1} ",lanmuid,topcount),Xinxi.class);
		
		return list;
	}
    
    
	
	
	
}
