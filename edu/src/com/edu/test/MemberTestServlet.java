package com.edu.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member")
public class MemberTestServlet extends HttpServlet {
	String str;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
					throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		int number = 0;
		str = req.getParameter("msg");
		
		out.print("<html><head><title>MultiThread Test</title></head>");
		out.print("<body><h2>처리 결과(멤버변수)</h2>");
		
		while(number++ < 10) {
			out.print(str + " : " + number + "<br />");
			out.flush();
			System.out.println(str + " : " + number);
			
			try {
				Thread.sleep(1000);
				
			} catch(Exception e) {
				System.out.println(e);
			}
		}
		
		out.println("<h2>Done : " + str + " !!</h2>");
		out.print("</body></html>");
		
		out.close();
	}
}
