package com.edu.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter(filterName = "timer", urlPatterns = "/thirdTest")
public class FlowFilterThree implements Filter {
	@Override
	public void init(FilterConfig config) {	}
	
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) 
					throws ServletException, IOException {
		long startTime = System.currentTimeMillis();
		
		chain.doFilter(req, resp);
		
		long endTime = System.currentTimeMillis();
		long executeTime = endTime - startTime;
		
		System.out.println("수행 시간 : " + executeTime + " ms");
	}
	
	
	@Override
	public void destroy() { }
}
