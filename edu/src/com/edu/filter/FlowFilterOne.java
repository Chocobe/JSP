package com.edu.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class FlowFilterOne implements Filter {
	@Override
	public void init(FilterConfig config) {
		System.out.println("init() 메소드 호출... One");
	}
	
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) 
					throws ServletException, IOException {
		System.out.println("doFilter() 메소드 호출 전 ... One");
		
		chain.doFilter(req, resp);
		
		System.out.println("doFilter() 메소드 호출 후 ... One");
	}
	
	
	@Override
	public void destroy() {
		System.out.println("destroy() 메소드 호출 ... One");
	}
}
