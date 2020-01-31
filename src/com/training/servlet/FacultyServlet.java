package com.training.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.training.dao.FacultyImpl;
import com.training.dao.FacultyIntf;
import com.training.pojo.AluminiPojo;
import com.training.pojo.BranchSubject;
import com.training.pojo.FacultyPojo;
import com.training.pojo.LevelPojo;
import com.training.pojo.QuestionAnswer;
import com.training.pojo.ResultPojo;

/**
 * Servlet implementation class FacultyServlet
 */
public class FacultyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FacultyServlet() {
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
		String action=request.getParameter("action");
		System.out.println("action is"+action);
		HttpSession session=request.getSession(); 
		PrintWriter out = response.getWriter();
			
			if(action!=null && action.equals("addFaculty"))
			{
				FacultyPojo fp=new FacultyPojo();
				
				
				String branch=request.getParameter("branch");
				String subject=request.getParameter("subject");
				String quetion=request.getParameter("quetion");
				String options[] = request.getParameterValues("option[]");
				String correct_answer = request.getParameter("correct_answer");
				String level=request.getParameter("level");
				
				
                System.out.println("branch"+branch);
				System.out.println("subject"+subject);
				System.out.println("quetion"+quetion);
				System.out.println("options"+options.length);
				System.out.println("correct_answer"+correct_answer);
				
				fp.setBranch(branch);
				fp.setSubject(subject);
				fp.setQuetion(quetion);
				fp.setCorrect_answer(Integer.parseInt(correct_answer));
				fp.setLevel(level);
				
				
				
				String option[][]={options};
				System.out.println("option"+options.toString());
				FacultyIntf intf=new FacultyImpl();
				
				
			    boolean x=intf.addQuestion(fp, option);
				
				if(x)
				{
					request.setAttribute("message", "Question inserted Successfully!!!!");
			        RequestDispatcher rd=request.getRequestDispatcher("Faculty.jsp");
			        rd.include(request, response);
				}
				else
				{
					response.sendRedirect("Faculty.jsp");
				}
			}
			
			else if(action!=null && action.equalsIgnoreCase("getAllAluminiRecord"))
			{
				
				System.out.println("inside get");
				
				String year = request.getParameter("year");
				System.out.println("year is"+year);
				
				FacultyIntf intf=new FacultyImpl();
				List<AluminiPojo> student=new ArrayList<AluminiPojo>();
				student =intf.getAllAluminiRecords(year);
				System.out.println("size:"+student.size());
				
				
				/*Gson gson = new Gson();
				gson.toJson(student);
				*/
				if(student.size()>0)
				{
				new Gson().toJson(student, response.getWriter());
				}
				else
				{
					out.write("empty");
				}
				
				}
			
			else if(action!=null && action.equalsIgnoreCase("addsubject"))
			{
				System.out.println("inside addsubject");
				
				String subject = request.getParameter("subject");
				System.out.println("sub" + subject);
				String branch = request.getParameter("branch");
				double marks = Double.parseDouble(request.getParameter("marks"));
				System.out.println("branch" + branch);
				FacultyIntf intf=new FacultyImpl();
				boolean res = intf.checkSubject(branch, subject);
				int facultyId =(Integer) session.getAttribute("facultyid");
				
				if(!res)
				{
				intf.addSubject(branch,subject,marks,facultyId);
				
				out.write("Subject added!!!");
				}
				
				else
				{
					out.write("Subject is alreday added!!!");
				}
				
				
			}
			
			
			else if(action!=null && action.equalsIgnoreCase("addBranch"))
			{
				String branch = request.getParameter("branch");
				String facultyemail =(String)session.getAttribute("facultyEmail");
				
				
				FacultyIntf facultyIntf= new FacultyImpl();
				
				boolean b =facultyIntf.getBranch(facultyemail, branch);
				if(b)
				{
					out.write("Branch already added");
				}
				else
				{
						
				boolean b1 =facultyIntf.addBranch(facultyemail, branch);
				     if(b1)
				     {
				    	out.print("branch added successfully"); 
				     }
				}
				
			}
			
			else if(action!=null && action.equalsIgnoreCase("getBranch"))
			{
				String facultyemail =(String)session.getAttribute("facultyEmail");
				FacultyIntf facultyIntf= new FacultyImpl();
				List<String> list = new ArrayList<String>();
				list = facultyIntf.branchList(facultyemail);
				System.out.println("listttttt"+list.toString());
				new Gson().toJson(list, response.getWriter());
				
			}
			
			else if(action!=null && action.equalsIgnoreCase("fetchFacultySubject"))
			{
				String branch =request.getParameter("branch");
				int facultyId =(Integer) session.getAttribute("facultyid");
				FacultyIntf facultyIntf= new FacultyImpl();
				List<String> list = new ArrayList<String>();
				list = facultyIntf.fetchSubject(branch,facultyId);
				new Gson().toJson(list,response.getWriter());
				
			}
			
			else if(action!=null && action.equalsIgnoreCase("fetchSubjectMarks"))
					{
				String branch =request.getParameter("branch");
				String subject=request.getParameter("subject");
				FacultyIntf facultyIntf= new FacultyImpl();
				int marks =facultyIntf.fetchSubjectMarks(branch,subject);
				
				out.print(marks);
					}
			
			else if(action!=null && action.equalsIgnoreCase("editSubjectMarks"))
					{
				String branch =request.getParameter("branch");
				String subject=request.getParameter("subject");
				int marks = Integer.parseInt(request.getParameter("marks"));
				FacultyIntf facultyIntf= new FacultyImpl();
				boolean b=facultyIntf.editSubjectMarks(branch,subject,marks);
				out.print("Marks Updated");
				
					}
			
			else if(action!=null && action.equalsIgnoreCase("fetchSubject"))
			{
				System.out.println("inside fetch subject");
				
				String branch = request.getParameter("br");
				System.out.println("branch"+branch);
				List<BranchSubject> list = new ArrayList<BranchSubject>();
				FacultyIntf intf = new FacultyImpl();
				list = intf.fetchSubject(branch);
               new Gson().toJson(list, response.getWriter());
			}

			else if(action!=null && action.equalsIgnoreCase("Fetchlevel"))
			{
				List<LevelPojo> list = new ArrayList<LevelPojo>();
				FacultyIntf intf = new FacultyImpl();
				list = intf.fetchLevel();
				System.out.println("list is"+list.toString());
				new Gson().toJson(list, response.getWriter());
			}
			
			
			else if(action!=null && action.equalsIgnoreCase("getMarkList"))
					{
				     String branch =request.getParameter("branch");
				     String subject =request.getParameter("subject");
				     List<ResultPojo> list = new ArrayList<ResultPojo>();
				     FacultyIntf intf = new FacultyImpl();
				     list = intf.getMarkList(branch, subject);
				     new Gson().toJson(list,response.getWriter());
					}
				/*FacultyIntf inf=new FacultyImpl();
				
				//boolean res = inf.addFacultyDetails(fp);
						
					
					//System.out.println("res"+res);
					
					String msg = "Successfully added!!!!";
					PrintWriter out = response.getWriter();
					out.write(msg);*/
			
			
			else if(action!=null && action.equalsIgnoreCase("facultyedit"))
					{
				String fname = request.getParameter("fname");
				String femail = request.getParameter("femail");
				int facultyid = (Integer) session.getAttribute("facultyid");
				FacultyIntf intf = new FacultyImpl();
				boolean b = intf.editfaculty(facultyid, femail, fname);
				if(b)
				{
					out.print("   Successfully edited");
					session.setAttribute("fname", fname);
					session.setAttribute("femail", femail);
					
				}
				else
				{
					out.print("Can't be edited");
				}
				
					}
			
			
			else if(action!=null && action.equalsIgnoreCase("studentedit"))
			{
		String fname = request.getParameter("fname");
		String femail = request.getParameter("femail");
		int studentid = (Integer) session.getAttribute("id");
		FacultyIntf intf = new FacultyImpl();
		boolean b = intf.editstudent(studentid, femail, fname);
		if(b)
		{
			out.print("   Successfully edited");
			session.setAttribute("sname", fname);
			session.setAttribute("semail", femail);
			
		}
		else
		{
			out.print("Can't be edited");
		}
		
			}
			
			else if(action!=null && action.equalsIgnoreCase("getQuestionList"))
			{
				System.out.println("get Questions list");
				String branch = request.getParameter("br");
				String sub  = request.getParameter("sub");
				System.out.println(branch + sub);
				FacultyPojo f = new FacultyPojo();
				  FacultyIntf intf = new FacultyImpl();
				List<QuestionAnswer> list = new ArrayList<QuestionAnswer>();
				list = intf.getQuestion(branch, sub);
				
				
				
				System.out.println("lissttt"+list.size());
				new Gson().toJson(list, response.getWriter());
				
				
			}
	}

}
