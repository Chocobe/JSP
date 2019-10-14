package com.edu.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

//@WebListener
public class TestServletContextListener implements ServletContextListener {
	public TestServletContextListener() {
		System.out.println("ServletContextListener 객체 생성");
	}
	
	@Override
	public void contextInitialized(ServletContextEvent e) {
		System.out.println("ServletContext 객체 초기화");
	}
	
	
	@Override
	public void contextDestroyed(ServletContextEvent e) {
		System.out.println("ServletContext 객체 소멸");
	}
}
