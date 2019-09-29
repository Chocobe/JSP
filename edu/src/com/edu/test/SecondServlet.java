package com.edu.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SecondServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
					throws ServletException, IOException {
		System.out.println("SecondsServlet !");
		PrintWriter out = resp.getWriter();
		out.print(
				"<!DOCTYPE html>" +
				"<html lang=\"ko\">" +
				"<head>" +
				"<title>Test</title>" +
				"</head>" +
				"<body>" +
				"<h1>have a nice day !!</h1>" +
				"</body>" +
				"</html>");
		out.close();
	}
}
