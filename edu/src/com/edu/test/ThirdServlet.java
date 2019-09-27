package com.edu.test;

import javax.servlet.ServletConfig;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet("/hello2")
public class ThirdServlet extends HttpServlet {
	@Override
	public void init(ServletConfig config) {
		System.out.println("init() 실행!");
	}
	
	@Override
	public void service(ServletRequest arg0, ServletResponse arg1) {
		System.out.println("service() 실행!");
	}
}
