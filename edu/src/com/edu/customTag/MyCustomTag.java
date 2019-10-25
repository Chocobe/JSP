package com.edu.customTag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class MyCustomTag extends TagSupport {
	private String color;
	
	
	public void setColor(String color) {
		this.color = color;
	}
	public String getColor() {
		return color;
	}
	
	
	@Override
	public int doStartTag() throws JspException {
		System.out.println("시작태그를 만났습니다");
		System.out.println("color속성값 : " + color);
		return TagSupport.EVAL_BODY_INCLUDE;
	}
	
	
	@Override
	public int doAfterBody() throws JspException {
		System.out.println("body 처리가 끝났습니다");
		return TagSupport.SKIP_BODY;
	}
	
	
	@Override
	public int doEndTag() throws JspException {
		System.out.println("끝태그를 만났습니다");
		return TagSupport.EVAL_PAGE;
	}
}
