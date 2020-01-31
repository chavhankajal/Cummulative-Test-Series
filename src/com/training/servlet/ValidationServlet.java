package com.training.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.training.dao.RegistrationImpl;
import com.training.dao.RegistrationIntf;

/**
 * Servlet implementation class ValidationServlet
 */
public class ValidationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out  = response.getWriter();
		String email = request.getParameter("email");
		System.out.println("email"+email);
		String role= request.getParameter("role");
		System.out.println("role"+role);
		RegistrationIntf intf = new RegistrationImpl();
		boolean res1;
	if(role.equals("student"))
	{
		System.out.println("hiii");
		res1 = intf.checkStudentEmail(email);
		System.out.println("result"+res1);
		if(res1)
		{
			out.write("success");
		}
	}
	if(role.equals("faculty"))
	{
		//boolean res = intf.checkAdminEmail(email);
		
		boolean res2 = intf.checkFacultyEmail(email);
		
		if(res2)
		{
			out.write("success");
		}
	}
	
	if(role.equals("tpo"))
	{
		
		boolean res3 = intf.checkTPOEmail(email);
		if(res3)
		{
			out.write("success");	
	}
	}
	
	if(role.equals("alumini"))
	{
		boolean res4 = intf.checkAluminiEmail(email);
		if(res4)
		{
			out.write("success");	
	}
	}
	
	
		/*out.print(res);
		out.print(res1);
		out.print(res2);
		out.print(res3);
		out.print(res4);*/
	}

}
