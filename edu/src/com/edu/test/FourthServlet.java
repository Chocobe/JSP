package com.edu.test;

import javax.servlet.ServletConfig;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;

public class FourthServlet extends HttpServlet {
	@Override
	public void init(ServletConfig config) {
		System.out.println("init() 메소드 실행됨!");
	}
	
	@Override
	public void service(ServletRequest arg0, ServletResponse arg1) {
		System.out.println("service() 메소드 실행됨!");
	}
}
