package com.daowen.uibuilder;

import java.text.MessageFormat;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;

import com.daowen.entity.*;
import com.daowen.uibuilder.UibuilderBase;

import com.daowen.dal.DALBase;


public class ShangpinBuilder extends UibuilderBase {

	
	
	
	public ShangpinBuilder(){
		
		super("shangpin", "box", "name", "tupian");
		
		
	}
	public ShangpinBuilder(String cssclassname){
		
		super("shangpin", cssclassname, "name", "tupian");
		
	}
	/**
	 * ͼƬ
	 * @param spcid
	 * @param maxcount
	 * @return
	 */
	public String buildImageShangpin(int spcid,int maxcount)
	{
		StringBuilder sb=new StringBuilder();
		Spcategory spcategory =(Spcategory)DALBase.load("spcategory", "where id="+spcid);
		if(spcategory==null)
			return "";
		
		List<Shangpin> shangpinlist=null;
		if(maxcount!=-1)
			 shangpinlist=findBySpcateid(spcid,maxcount);
		else 
			 shangpinlist=findBySpcateid(spcid);
		//�ȵ���Ʒ��Ϣ
		sb.append(buildImageLanmu(shangpinlist, spcategory.getMingcheng()));
		
		
		return sb.toString();
		
	}
	
	public String buildTextShangpin(int spcid,int maxcount)
	{
		StringBuilder sb=new StringBuilder();
		Spcategory spcategory =(Spcategory)DALBase.load("spcategory", "where id="+spcid);
		if(spcategory==null)
			return "";
		
		List<Shangpin> shangpinlist=null;
		if(maxcount!=-1)
			 shangpinlist=findBySpcateid(spcid,maxcount);
		else 
			 shangpinlist=findBySpcateid(spcid);
		//�ȵ���Ʒ��Ϣ
		sb.append(buildTextLanmu(shangpinlist, spcategory.getMingcheng()));
		
		
		return sb.toString();
		
	}
	
	
	public String  buildHotSale(){
		
		StringBuilder sb=new StringBuilder();
		
		List<Shangpin> shangpinlist=getHotSales();
		
		//�ȵ���Ʒ��Ϣ
		sb.append(buildImageLanmu(shangpinlist, "商品列表"));
		
		
		return sb.toString();
		
	}
	 
	//�Ƽ���Ʒ
     public String  buildRecomment(){
		
		StringBuilder sb=new StringBuilder();
		
		List<Shangpin> shangpinlist=getRecomment();
		
		//�ȵ���Ʒ��Ϣ
		sb.append(buildImageLanmu(shangpinlist, "商品列表"));
    	return sb.toString();
	}
     
     //������Ʒ 
     public String  buildLastest(){
		
		StringBuilder sb=new StringBuilder();
		
		List<Shangpin> shangpinlist=getNewest();
		
		//�õ�������Ʒ��Ϣ 
		sb.append(buildImageLanmu(shangpinlist, "商品列表"));
    	return sb.toString();
	} 
	
     public String  buildViewedProduct(HttpServletRequest request){
 		
 		StringBuilder sb=new StringBuilder();
 		//��ȡ��ʷ���
 		List<String> ids=ProductViewHistory.HistoryView(request);
 		String temids="";
 		int i=0;
 		for(String id : ids){
 			temids+=id;
 			if(i<ids.size()-1){
 				temids+=",";
 			}
 			i++;
 		
 		}
 		if(ids!=null&&ids.size()>0){
 		  List<Shangpin> shangpinlist=DALBase.getEntity("shangpin", " where id in ("+temids+")");
 		
 		
 		  sb.append(buildImageLanmu(shangpinlist, "商品列表"));
 		}
     	return sb.toString();
 	} 
	
    public String search(String spname,String classname){
		
	   StringBuffer sb=new StringBuffer();
	    int i=0;
	    
	    sb.append(MessageFormat.format("<dd class=\"{0}\">",classname));
	    sb.append("\r\n");
		  
		List<Shangpin> listxinxi=findBySpname(spname);
		for(Iterator<Shangpin> iterator = listxinxi.iterator();iterator.hasNext();){
		
		 Shangpin shangpin=iterator.next();
		  
		 
		  sb.append(" <div class=\"picturebox\">");
		  sb.append("\r\n");
		  
		  sb.append(MessageFormat.format("<a href=\"shangpininfo.jsp?id={0}\">",shangpin.getId()));
		  sb.append(MessageFormat.format("<img src=\"{0}\"/> ",shangpin.getTupian()));
		  sb.append("</a>");
		  sb.append("\r\n");
		  sb.append(MessageFormat.format("<span><a href=\"shangpininfo.jsp?id={0}\">{1}</a></span>",shangpin.getId(),shangpin.getName()));
		  
		  sb.append("</div>");
		  
		 
		  i++;
		}
		 sb.append("</dd>");
		 sb.append("\r\n");
		 return sb.toString();
		
		
	}
	
    private List<Shangpin> findBySpname(String spname) {
	
        List<Shangpin> list=DALBase.runNativeSQL(MessageFormat.format("select * from  shangpin where name like ''%{0}%'' ",spname),Shangpin.class);
		
		return list;
    
    }

	

	private  List<Shangpin> findBySpcateid(int spcid){
		
		List<Shangpin> list=DALBase.runNativeSQL(MessageFormat.format("select * from  shangpin where sptypeid={0} or sptypeid in (select id from spcategory where parentid={0}) ",spcid),Shangpin.class);
		
		return list;
	}
	
   private  List<Shangpin> getHotSales(){
		
		List<Shangpin> list=DALBase.getTopList("shangpin"," where hot=1 order by id desc ",10);
		
		return list;
	}
   
    private  List<Shangpin> getRecomment(){
		
		List<Shangpin> list=DALBase.getEntity("shangpin"," where tuijian=1 ");
		
		return list;
	}
    
    private  List<Shangpin> getNewest(){
		
		List<Shangpin> list=DALBase.getTopList("shangpin"," order by pubtime desc ",10);
		
		return list;
	}
    
        
   
	
    private  List<Shangpin> findBySpcateid(int spcid,int topcount){
		
		List<Shangpin> list=DALBase.runNativeSQL(MessageFormat.format("select  * from  shangpin where sptypeid={0} order by pubtime desc  limit {1} ",spcid,topcount),Shangpin.class);
		
		return list;
	}
    
    
	
	
	
}
