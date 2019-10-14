package com.edu.listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class TestSessionListener implements HttpSessionListener {
	public TestSessionListener() {
		System.out.println("TestSessionListener 객체 생성");
	}
	
	
	@Override
	public void sessionCreated(HttpSessionEvent e) {
		System.out.println("세션 객체 생성");
	}
	
	
	@Override
	public void sessionDestroyed(HttpSessionEvent e) {
		System.out.println("세션 객체 소멸");
	}
}
