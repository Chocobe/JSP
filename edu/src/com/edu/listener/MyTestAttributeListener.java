package com.edu.listener;

import javax.servlet.ServletRequestAttributeEvent;
import javax.servlet.ServletRequestAttributeListener;

public class MyTestAttributeListener implements ServletRequestAttributeListener {
	public MyTestAttributeListener() {
		System.out.println("ServlerRequestAttributeListener 객체 생성");
	}
	
	
	@Override
	public void attributeAdded(ServletRequestAttributeEvent e) {
		System.out.println("추가됨");
	}
	
	@Override
	public void attributeRemoved(ServletRequestAttributeEvent e) {
		System.out.println("삭제됨");
	}
	
	@Override
	public void attributeReplaced(ServletRequestAttributeEvent e) {
		System.out.println("대체됨");
	}
}
