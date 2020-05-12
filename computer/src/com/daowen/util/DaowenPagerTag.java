package com.daowen.util;

import java.io.IOException;
import java.text.MessageFormat;
import java.util.Enumeration;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

/*******************************************************************************
 * 
 * @author daowen
 * 
 * ��ҳ�ؼ�ʵ��ҳ���ҳ����
 * 
 * ��ҳ�ؼ���ҳ��������Ϣ����������ҳԪ���ݰ��� ��ҳ�ߴ硢�ܼ�¼������ǰҳ
 * 
 */
public class DaowenPagerTag extends TagSupport {

	/**
	 * ��ǰ��ҳ����Դ��������
	 */
	private String metalname = "pagermetal";// �������ʵ�������

	/***************************************************************************
	 * ��ǰҳѡ��ҳ��ʽ
	 */
	private String currentpageclass = "current";
	
	/***
	 * �ؼ���ʽ
	 * 
	 */
	private  String  cssclass="page";
	
	
	/**
	 * ��ҳ�ؼ�ID
	 */
	private  String id="pager1";
	
	
	
	private  String attcheform;
	
	
	/***
	 * �¼��Զ�����
	 * **/
	private  String autoeventhandler="true";
	

	@Override
	public int doStartTag() {

		JspWriter out = this.pageContext.getOut();
		
		

		String tags = getRender();

		try {
			out.write(tags);
		} catch (IOException e) {

			e.printStackTrace();
		}

		return this.SKIP_BODY;
	}

	private String getRender() {
		// ��ȡ��ҳ����
		Object pm = pageContext.getRequest().getAttribute(getMetalname());

		if (pm == null)
			return "û�а󶨷�ҳ����Դ";
		
		
		PagerMetal pager = (PagerMetal) pm;

		StringBuffer sb = new StringBuffer();
		// ��ҳ��ʼ
		sb.append(MessageFormat.format("<div class=\"{0}\">\r\n",this.getCssclass()));
		
		
		
		// ��ҳ��ҳ����ʼ
		sb.append("<div class=\"page_num\">\r\n");

		// ��ȡ��ҳ���ܼ�¼��
		sb.append(MessageFormat.format("总数:\r\n", pager.getTotalcount(),
				pager.getTotalPages(),pager.getPagesize()));
		// ��ҳ��ҳ������
		sb.append("</div>");

		// ��ҳ������ʼ
		sb.append("<div class=\"manu\">\r\n");

		for (int i = 0; i < pager.getTotalPages(); i++) {
			if ((i + 1) == pager.getCurpageindex())
				sb.append(MessageFormat.format("<a class=\"{1} daowenpager-pagebutton\" pageindex=\"{0}\" >{0}</a>\r\n", i+1,
						getCurrentpageclass()));
			else
				sb.append(MessageFormat.format("<a pageindex=\"{0}\" class=\"daowenpager-pagebutton\">{0}</a>\r\n", i + 1));
		}
		//sb.append("<input type=\"hidden\" id=\"currentpageindex\" name=\"currentpageindex\"/>\r\n");
		
		sb.append("<input id=\"daowenpager_txtgopage\" type=\"text\" style=\"width: 30px\" value=\"1\">\r\n");
		
		sb.append("<a  class=\"next daowenpager-btngopage\" href=\"#\" >所有商品</a>\r\n");

		// ��ҳ��������
		sb.append("</div>\r\n");
		
		//��ȡ�������
		sb.append(this.getRequestParams());
		
		

		// ��ҳ����
		sb.append("</div>\r\n");
		
	    String auto=getAutoeventhandler();
	    
	    if(auto.equals("true")){
	    	//�¼�����
	    	sb.append(eventHandler());
	    }
		

		return sb.toString();
	}
	
	
	private String eventHandler(){
		
		
		StringBuffer sb=new StringBuffer();
		
		/****
		 *  ��ҳ�ؼ��ύ�ű�
		 * 
		 * ****/
		sb.append("<script type=\"text/javascript\">\r\n");
		sb.append("       $(function(){\r\n");
		
		sb.append(MessageFormat.format("            var attcheFormId=\"{0}\";\r\n  ",getAttcheform()));
		//���帽��form
		sb.append("            var   attcheForm;  \r\n");
		sb.append("            if(  attcheFormId !=\"null\"){\r\n");
		sb.append("                  attcheForm=$(\"#\"+attcheFormId);\r\n");
		sb.append("            }else");
		//���û�а󶨸���form ����õ�ǰ�����form
		sb.append("            attcheForm=$(this).closest(\"form\");\r\n");
		
		
		//ҳ�������ύ��ʼ
		
		sb.append("            $(\".daowenpager-pagebutton\").click(function(){\r\n");
		
	
		sb.append("               if(attcheForm.find(\"[name=currentpageindex]:hidden\").size()<=0)\r\n");
		
		sb.append("                 {\r\n");
				
		//���ҳ����
		sb.append("                   attcheForm.append('<input type=\"hidden\" name=\"currentpageindex\"  value=\"'+$(this).attr(\"pageindex\")+'\"/>');\r\n");
		
		sb.append("                 }\r\n");
		//���������ֱ�Ӹ���ҳ��ֵ
		sb.append("               else       ");
		
		sb.append("                   attcheForm.find(\"[name=currentpageindex]:hidden\").val( $(this).attr(\"pageindex\"));\r\n");
		//�ύ����
		sb.append("               attcheForm[0].submit();\r\n");
		
		sb.append("            })\r\n");
		//ҳ���ύ����
	
		
		//ҳ����ת
		sb.append("            $(\".daowenpager-btngopage\").click(function(){\r\n");

		
		sb.append("               if(attcheForm.find(\"[name=currentpageindex]:hidden\").size()<=0)\r\n");
		
		sb.append("                 {\r\n");
				
		//���ҳ����
		sb.append("                   attcheForm.append('<input type=\"hidden\" name=\"currentpageindex\"  value=\"'+$(\"#daowenpager_txtgopage\").val()+'\"/>');\r\n");
		
		sb.append("                 }\r\n");
		//���������ֱ�Ӹ���ҳ��ֵ
		sb.append("               else       ");
		
		sb.append("                   attcheForm.find(\"[name=currentpageindex]:hidden\").val( $(\"#daowenpager_txtgopage\").val());\r\n");
		sb.append("                   attcheForm.submit()\r\n");	
		//��ת����
		sb.append("            })\r\n");
		
		//
		sb.append("       })     \r\n");
		sb.append("</script>\r\n");
		//�ű��ύ����
		
		return sb.toString();
		
		
	}

	/***
	 * ���������
	 * @return
	 */
	private  String getRequestParams(){
		
		
		StringBuffer sb=new StringBuffer();
		
		Enumeration  params=pageContext.getRequest().getParameterNames();
		while (params.hasMoreElements())
		{
		   String paramname=params.nextElement().toString();
		   String value=this.pageContext.getRequest().getParameter(paramname);
		   
		   sb.append(MessageFormat.format("<input type=\"hidden\" name=\"{0}\" value=\"{1}\"/>", paramname,value));  
		   
		   
		}
		return sb.toString();
		
		
		
	}
	
	@Override
	public int doAfterBody() {

		return this.EVAL_PAGE;
	}

	public String getCurrentpageclass() {
		return currentpageclass;
	}

	public void setCurrentpageclass(String currentpageclass) {
		this.currentpageclass = currentpageclass;
	}

	public void setMetalname(String metalname) {
		this.metalname = metalname;
	}

	public String getMetalname() {
		return metalname;
	}

	public String getCssclass() {
		return cssclass;
	}

	public void setCssclass(String cssclass) {
		this.cssclass = cssclass;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAutoeventhandler() {
		return autoeventhandler;
	}

	public void setAutoeventhandler(String autoeventhandler) {
		this.autoeventhandler = autoeventhandler;
	}

	public String getAttcheform() {
		return attcheform;
	}

	public void setAttcheform(String attcheform) {
		this.attcheform = attcheform;
	}

}
