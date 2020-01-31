package com.training.servlet;

import java.io.IOException;
import java.io.PrintWriter;













import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.training.dao.AdminImpl;
import com.training.dao.AdminIntf;
import com.training.dao.FacultyImpl;
import com.training.dao.FacultyIntf;
import com.training.dao.RegistrationImpl;
import com.training.dao.RegistrationIntf;
import com.training.dao.StudentImpl;
import com.training.dao.StudentIntf;
import com.training.pojo.Registration;
import com.training.utility.EmailUtility;

/**
 * Servlet implementation class StudentServlet
 */
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String action=request.getParameter("action");
		System.out.println("action is"+action);
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession(); 
			
			if(action.equals("Registration"))
			{
				Registration r=new Registration();
				String role = request.getParameter("role");
				String name=request.getParameter("name");
				String email=request.getParameter("email");
				String password=request.getParameter("password");
				String cnfpass = request.getParameter("cnfpass");
				
                System.out.println("role"+role);
				System.out.println("ppp"+name);
				System.out.println("pooja"+email);
				System.out.println("poooojaaaa"+password);
				System.out.println("poooojaaaa"+cnfpass);
				RegistrationIntf inf=new RegistrationImpl();
			
				r.setRole(role);
				r.setName(name);
				r.setEmail(email);
				r.setPassword(password);
				r.setConfirmpass(cnfpass);
				
				
				if(role.equals("student"))
				{
				
				String branch = request.getParameter("select");
				String pemail = request.getParameter("pemail");
				r.setBranch(branch);
				r.setParents_email(pemail);
				System.out.println("b"+branch);
					boolean res = inf.signup(r);
					System.out.println("res"+res);
					
					String msg = "Successfully Registered!!!!";
				
					out.write(msg);
					
				}
				
				else if(role.equals("alumini"))
				{
					boolean res = inf.addAlumini(r);
					System.out.println("res"+res);
					
					String msg = "Successfully Registered!!!!";
					
					out.write(msg);
				}
				
				else if(role.equals("faculty"))
				{
					boolean res = inf.addFaculty(r);
					System.out.println("res"+res);
					
					String msg = "Successfully Registered!!!!";
					
					out.write(msg);
				}
				
				/*else if(role.equals("admin"))
				{
					boolean res = inf.addAdmin(r);
					System.out.println("res"+res);
					
					String msg = "Successfully Registered!!!!";
					
					out.write(msg);
				}*/
				
				else if(role.equals("tpo"))
				{
					boolean res = inf.addTpo(r);
					System.out.println("res"+res);
					
					String msg = "Successfully Registered!!!!";
					
					out.write(msg);
				}
				
			}
			else if(action!=null && action.equalsIgnoreCase("Login"))
			{
				System.out.println("inside login");
				Registration reg = new Registration();
				String email = request.getParameter("email");
				String password = request.getParameter("password");
				String role = request.getParameter("role");
				
				reg.setEmail(email);
				reg.setPassword(password);
				reg.setRole(role);
				System.out.println("pooja"+email);
				System.out.println("poooojaaaa"+password);
				RegistrationIntf intf = new RegistrationImpl();
				
				if(role.equals("student"))
				{
				
				
					int id = intf.Login(role, email, password);
					System.out.println("res"+id);
					session.setAttribute("id", id);
					StudentIntf inf = new StudentImpl();
					String name = inf.getName(id);
					System.out.println("name is"+name);
					session.setAttribute("sname", name);
					session.setAttribute("semail", email);
					
					if(id>0)
					{
						// branch = intf.getBranch(id);
						//session.setAttribute("branch", branch);
						
						//boolean result = intf.checkResume(id);
						/*if(result)
						{
						out.write("notFirst");
						}
						else
						{*/
					String msg = "Successfully Login!!!!";
					
					out.write(msg);
						
					}
					else
					{
						out.write("err");
					}
					
				}
				
				
				
				else if(role.equals("faculty"))
				{
					int id = intf.FacultyLogin(role, email, password);
					//System.out.println("res"+res);
					
					if(id>0)
					{
					String msg = "Successfully Login!!!!";
					session.setAttribute("facultyid", id);
					session.setAttribute("facultyEmail", email);
					FacultyIntf inf = new FacultyImpl();
					String name = inf.getName(id);
					session.setAttribute("fname", name);
					session.setAttribute("femail", email);
					
					out.write(msg);
					}
					else
					{
						out.write("err");
					}
				}
				
				/*else if(role.equals("admin"))
				{
					boolean res = intf.AdminLogin(role, email, password);
					System.out.println("res"+res);
					if(res)
					{
					String msg = "Successfully Login!!!!";
					
					out.write(msg);
					}
					else
					{
						out.write("err");
					}
				}*/
				
				
				else
				{
					role="admin";
					int  id = intf.AdminLogin(role, email, password);
					System.out.println("res"+id);
					session.setAttribute("aid", id);
					AdminIntf inf = new AdminImpl();
					String name = inf.getName(id);
					session.setAttribute("aname", name);
					if(id>0)
					{
					String msg = "Successfully Login!!!!";
					
					out.write(msg);
					}
					else
					{
						out.write("err");
					}
				}
				
				
			}
			
			
			else if(action!=null && action.equalsIgnoreCase("Submit"))
			{
				System.out.println("inside forgot");
				String email = request.getParameter("email");
				System.out.println("email"+email);
				
				RegistrationIntf inf=new RegistrationImpl();
				String password = inf.checkemail(email);
				
				if(password.equalsIgnoreCase("no"))
				{
					response.sendRedirect("forgot.jsp");
				}
				
				else
				{
					EmailUtility.sendEmail(email, "Password Details",  password);
					response.sendRedirect("Login.jsp");
					
				}
				
			}
				
	}
	
}

	


