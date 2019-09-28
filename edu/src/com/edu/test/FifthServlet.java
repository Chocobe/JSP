package com.edu.test;

import javax.servlet.ServletConfig;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;

public class FifthServlet extends HttpServlet {
	@Override
	public void init(ServletConfig config) {
		System.out.println("init() 메서드 실행!!");
	}
	
	@Override
	public void service(ServletRequest req, ServletResponse resp) {
		System.out.println("service() 메소드 실행!!");
	}
}
