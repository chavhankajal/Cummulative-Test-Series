package com.training.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.training.dao.AdminImpl;
import com.training.dao.AdminIntf;
import com.training.dao.FacultyImpl;
import com.training.dao.FacultyIntf;
import com.training.pojo.AluminiPojo;
import com.training.pojo.DocumentsPojo;
import com.training.pojo.StudentPojo;

/**
 * Servlet implementation class AdminServlet
 */
public class AdminServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() 
    {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		String action=request.getParameter("action");
		AdminIntf intf=new AdminImpl();
		
		if(action !=null && action.equalsIgnoreCase("getname"))
		{
			StudentPojo sp =new StudentPojo();
			
			List<StudentPojo> student =new ArrayList<StudentPojo>();
			student = intf.getStudentName();		
			new Gson().toJson(student, response.getWriter());
			
			
		}
		
		
		
		else if(action!=null && action.equalsIgnoreCase("getAllStudentsRecord"))
		{
			
			System.out.println("inside get");
			HttpSession session=request.getSession();
			StudentPojo sp = new StudentPojo();
			String name = request.getParameter("name");  //when u want to fetch data from jsp
			System.out.println("name is"+name);
			
			session.setAttribute("name", name); //stores into session
			
			sp =intf.getAllStudentsRecords(name);
			int id = sp.getId();
			System.out.println("id is"+id);
			String status = "verified";
			List<DocumentsPojo> dp=new ArrayList<DocumentsPojo>();
			dp  =intf.getPath(id, status);
			
			
			System.out.println("size:"+dp.size());
			
			if(dp.size()>0)
			{
			new Gson().toJson(dp, response.getWriter());
			
			}
			else
			{
				PrintWriter out = response.getWriter();
						out.write("empty");
			}
			
			
	}
		
		else if(action!=null && action.equalsIgnoreCase("getdocpath"))
		{
			int id = Integer.parseInt(request.getParameter("id"));
			System.out.println("id is:"+id);
			
			DocumentsPojo dp = new DocumentsPojo();
			dp = intf.getdocpath(id);
			new Gson().toJson(dp, response.getWriter());
		}
		
		
		else if(action!=null && action.equalsIgnoreCase("verification"))
		{
			System.out.println("verification");
			String id = request.getParameter("id");
			System.out.println("idddddddddd"+id);
			int sid = Integer.parseInt(id);
			System.out.println("id"+sid);
			
			String status = "verified";
			
			intf.updateStatus(sid, status);
			
			
			
			
			
			
			
		}
	}
}
