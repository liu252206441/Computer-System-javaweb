package com.daowen.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Hashtable;

import org.apache.commons.validator.Constant;

public class SequenceUtil {

	
	private static Hashtable<String ,Integer> ht=null;
	
	static {
		ht=new Hashtable<String, Integer>();
	}
	
	private  static final int  MAXSIZE=10000;
	public static  String buildSequence(String prefix){
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyymmddHHMMss");
		String timestamp = sdf.format(new Date());
		if(ht.get(timestamp)!=null){
			int sequcence = (int)ht.get(timestamp);
            if (sequcence >MAXSIZE || sequcence < 1)
                ht.put(timestamp,1);
            ht.put(timestamp, (int)ht.get(timestamp)+1);
		}else {
			ht.clear();
			ht.put(timestamp, 1);
		}
		String index=ht.get(timestamp).toString();
		index=padLeft(index, 5, "0");
		return  prefix+timestamp+index;
		
	}
	
	
	
	/**
	* ÓÒ²¹Î»£¬×ó¶ÔÆë 
	* 
	* @param oriStr
	*            Ô­×Ö·û´® 
	* @param len
	*            Ä¿±ê×Ö·û´®³¤¶È 
	* @param alexin
	*            ²¹Î»×Ö·û 
	* @return Ä¿±ê×Ö·û´® 
	*/
	public static String padRight(String oriStr, int len, String alexin) {
		String str = "";
		int strlen = oriStr.length();
		if (strlen < len) {
			for (int i = 0; i < len - strlen; i++) {
				str = str + alexin;
			}
		}
		str = str + oriStr;
		return str;
	}

	/**
	* ×ó²¹Î»£¬ÓÒ¶ÔÆë
	* 
	* @param oriStr
	*            Ô­×Ö·û´®
	* @param len
	*            Ä¿±ê×Ö·û´®³¤¶È
	* @param alexin
	*            ²¹Î»×Ö·û
	* @return Ä¿±ê×Ö·û´®
	*/
	public static String padLeft(String oriStr, int len, String alexin) {
		String str = "";
		int strlen = oriStr.length();
		if (strlen < len) {
			for (int i = 0; i < len - strlen; i++) {
				str = str + alexin;
			}
		}
		str = str+oriStr ;
		return str;
	}
	
	
	
}
	
	
	

