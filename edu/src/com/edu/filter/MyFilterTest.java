package com.edu.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/myFilterTest")
public class MyFilterTest extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) 
					throws ServletException, IOException {
		System.out.println("MyFilterTest !!");
		PrintWriter out = resp.getWriter();
		
		out.print("<html><head><title>Test</title></head>");
		out.print("<body>");
		out.print("<h1>have a nice day !!</h1>");
		out.print("</body></html>");
		
		out.close();
	}
}
