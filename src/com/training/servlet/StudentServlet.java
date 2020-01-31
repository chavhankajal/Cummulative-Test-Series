package com.training.servlet;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;









import com.google.gson.Gson;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.training.dao.StudentImpl;
import com.training.dao.StudentIntf;
import com.training.pojo.AnswerStatusPojo;
import com.training.pojo.BranchSubject;
import com.training.pojo.FacultyPojo;
import com.training.pojo.NotesPojo;
import com.training.pojo.OptionPojo;
import com.training.pojo.StudentEducationPojo;
import com.training.pojo.StudentPersonalPojo;
import com.training.pojo.StudentProjectDetails;
import com.training.pojo.SubjectMarksPojo;
import com.training.utility.EmailUtility;

/**
 * Servlet implementation class StudentServlet
 */
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StudentServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        HttpSession session = request.getSession();
		String action = request.getParameter("action");
		System.out.println("action is:" + action);
		if(session.getAttribute("id")==null)
		{
			response.sendRedirect("login.jsp");
		}
		int id = (Integer)session.getAttribute("id");
		System.out.println("id"+id);

		StudentIntf intf = new StudentImpl();
		PrintWriter out = response.getWriter();
		
		
		if (action != null && action.equalsIgnoreCase("saveData")) {
			System.out.println("inside savedata");

			// Personal data

			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String phn = request.getParameter("phone");
			String add = request.getParameter("add");
			String obj = request.getParameter("obj");
			String gender = request.getParameter("gender");
			String dob = request.getParameter("dob");
			String father_name = request.getParameter("father_name");
			String hobby = request.getParameter("hobby");
			String lang = request.getParameter("lang");
			String place = request.getParameter("place");

			StudentPersonalPojo pj = new StudentPersonalPojo();

			pj.setName(name);
			pj.setEmail(email);
			pj.setPhone(phn);
			pj.setAddress(add);
			pj.setObjective(obj);
			pj.setGender(gender);
			pj.setDob(dob);
			pj.setFather_name(father_name);
			pj.setHobby(hobby);
			pj.setLanguages(lang);
			pj.setPlace(place);

			
			boolean res = intf.addPersonal(pj, id);
			System.out.println("result is" + res);
			try {
				response.setContentType("application/pdf");
				Document document = new Document();
                
				String path = "c:\\pdf\\" + name +".pdf";
				System.out.println("path is:" + path);
				OutputStream file = new FileOutputStream(new File(path));

				intf.updatePath(path, id); // static

				PdfWriter.getInstance(document, file);

				document.open();
				document.add(new Paragraph(name));
				document.add(new Paragraph(email));
				document.add(new Paragraph(phn));
				document.add(new Paragraph(add));
				document.add(new Paragraph(obj));

				document.add(Chunk.NEWLINE); // blank line
				document.add(Chunk.NEWLINE);

				// Font font = new Font(Font.FontFamily.HELVETICA, Font.BOLD);
				Paragraph p = new Paragraph("Educational Details");
				p.setAlignment(Element.ALIGN_LEFT);
				document.add(p);
				document.add(Chunk.NEWLINE);
				PdfPTable table = new PdfPTable(4);// columns
				PdfPTable table1 = new PdfPTable(3);// column for t2
				// PdfPCell cell = new PdfPCell (new Phrase
				// ("Educational Details"));
				// cell.setColspan(4);
				// table.addCell(cell);
				// PdfPCell cell1 = new PdfPCell (new Phrase
				// ("Projects Details"));

				table.addCell("Qualification");
				table.addCell("Year");
				table.addCell("University");
				table.addCell("Percentage");

				// cell1.setColspan(3);
				// table1.addCell(cell1);

				table1.addCell("Project Name");
				table1.addCell("Project Language");
				table1.addCell("Project Description");
				// educational data

				String qual[] = request.getParameterValues("qual[]");
				String year[] = request.getParameterValues("year[]");
				String uni[] = request.getParameterValues("uni[]");
				String per[] = request.getParameterValues("per[]");
				String count[] = request.getParameterValues("prof[]");

				System.out.println("qual" + qual.length);
				for (int i = 0; i < count.length; i++) {
					StudentEducationPojo sp = new StudentEducationPojo();
					sp.setQual(qual[i]);
					sp.setYear(year[i]);
					sp.setUniversity(uni[i]);
					sp.setPerc(Double.parseDouble(per[i]));
					sp.setProfile_id(Integer.parseInt(count[i]));

					intf.addEducation(sp, id);

					table.addCell(qual[i]);
					table.addCell(year[i]);
					table.addCell(uni[i]);
					table.addCell(per[i]);

					// System.out.println("qu"+qu);
				}
				document.add(table);
				document.add(Chunk.NEWLINE); // blank line
				document.add(Chunk.NEWLINE);

				Paragraph p1 = new Paragraph("Projects Details");
				p1.setAlignment(Element.ALIGN_LEFT);
				document.add(p1);
				document.add(Chunk.NEWLINE);
				// Project details

				String pname[] = request.getParameterValues("pname[]");
				String plang[] = request.getParameterValues("plang[]");
				String pdesc[] = request.getParameterValues("pdesc[]");
				String profile[] = request.getParameterValues("pprof[]");

				for (int i = 0; i < profile.length; i++) {
					StudentProjectDetails sp = new StudentProjectDetails();

					sp.setProject_name(pname[i]);
					sp.setProject_lang(plang[i]);
					sp.setProject_desc(pdesc[i]);
					sp.setProfile_id(Integer.parseInt(profile[i]));

					intf.addProject(sp, id);

					// PdfPCell cell1 = new PdfPCell (new Paragraph
					// ("Project Details"));

					table1.addCell(pname[i]);
					table1.addCell(plang[i]);
					table1.addCell(pdesc[i]);

				}

				document.add(table1);

				document.add(Chunk.NEWLINE);
				document.add(Chunk.NEWLINE);

				Paragraph pers = new Paragraph("Personal Details");
				// pers.setFont(Font.BOLD);
				pers.setAlignment(Element.ALIGN_LEFT);
				document.add(pers);
				document.add(Chunk.NEWLINE);

				document.add(new Paragraph(dob));
				document.add(new Paragraph(gender));
				document.add(new Paragraph(father_name));
				document.add(new Paragraph(hobby));
				document.add(new Paragraph(lang));
				document.add(new Paragraph(place));

				document.close();
				System.out.println("Pdf created successfully..");
				
				out = response.getWriter();
				out.write("Resume save successfully to "+path);

			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		
		else if(action!=null && action.equalsIgnoreCase("getStudentname"))
		{
			
			String name = intf.getName(id);
			session.setAttribute("sname", name);
			out.write(name);
			
		}
		
		else if(action!=null && action.equalsIgnoreCase("getpdf"))
		{
			 ServletOutputStream stream = null;
			 BufferedInputStream buf = null;
			System.out.println("inside getpdf");
			String path = intf.getPdfPath(id);
			System.out.println("path is"+path);
			
		    File file = new File(path);
		    System.out.println(file.getAbsolutePath().substring(file.getAbsolutePath().lastIndexOf("\\")+1));
		  String filename = file.getAbsolutePath().substring(file.getAbsolutePath().lastIndexOf("\\")+1);
		    try
		    {

		    response.setContentType("application/pdf");
		   
		    response.setHeader("Content-Disposition", "inline; filename="+filename);
		    response.setContentLength((int) file.length());
		    buf = new BufferedInputStream(new FileInputStream(file));
		    int readBytes = 0;
		    while ((readBytes = buf.read()) != -1)
                out.write(readBytes);
			System.out.println("pooja");
		    
		    } catch (IOException ioe) {
		        ioe.printStackTrace(System.out);
		
			
		}
		}
		
		else if(action!=null && action.equalsIgnoreCase("getvideos"))
		{
			System.out.println("view video");
			
			String type=request.getParameter("type");
			
			
			List<NotesPojo> list = new ArrayList<NotesPojo>(); 
			
			list = intf.viewNotes(type);
			
			new Gson().toJson(list, response.getWriter());
			
			
		}
		
		else if(action!=null && action.equalsIgnoreCase("getEmail"))
		{
			System.out.println("inside getemail");
			String email = request.getParameter("email");
			System.out.println("email is:"+email);
			
			boolean res = intf.checkEmail(id, email);
			System.out.println("res"+res);
			if(!res)
			{
				out.write("error");
			}
		}
		
		else if(action!=null && action.equalsIgnoreCase("getname"))
		{
			System.out.println("inside getname");
			
			String name = request.getParameter("name");
			System.out.println("name "+name);
			boolean res = intf.getDocName(id, name);
			
			if(res)
			{
				out.write("true");
			}
			
		}
		
		
		else if(action!=null && action.equals("starttest"))
		{
			System.out.println("inside starttest");
			int stud_id =(Integer)session.getAttribute("id");
			String subject = request.getParameter("sub");
			session.setAttribute("subject", subject);
			System.out.println("subject"+subject);
			/*String branch = intf.getBranch(id);*/
			List<FacultyPojo> list = new ArrayList<FacultyPojo>();
		
			
			String type="VE";
			int marks =(Integer) session.getAttribute("marks");
			list = intf.getQuestionList(subject,marks);
			System.out.println("list"+list.size());
			
			intf.insertTemp(list,stud_id);
			FacultyPojo fp = new FacultyPojo();
			String question=null;
			long queid=0;
			
			
			StudentIntf studentIntf = new StudentImpl();
			fp=studentIntf.getquestionidFirst(stud_id);
			
			
			
			
			int q_id=fp.getQuestion_id();
			/*intf.deleteTemp(q_id);*/
			System.out.println("id"+q_id);
			
			
			String status = "attempted";
			
			
			String que =fp.getQuetion();
			
			
			System.out.println("que"+que);
			
			//passing pojo to gson
			
			Gson gson = new Gson();
			String jsonStudents = gson.toJson(fp);
			response.setContentType("application/json");
			out.print(jsonStudents);
			
			
				
			
		
			
			
			
			
			
		}
		
		else if(action!=null && action.equalsIgnoreCase("nextquestion"))
		{
			
			System.out.println("inside next");
			List<FacultyPojo> list = new ArrayList<FacultyPojo>();
			int marks =(Integer) session.getAttribute("marks");
			int stud_id =(Integer)session.getAttribute("id");
			FacultyPojo fp = new FacultyPojo();
			int i =Integer.parseInt(request.getParameter("questioncount"));
			if(i<=marks)
			{
			System.out.println("marksllllllllllllllllllllll "+i);
				List<FacultyPojo> list1 = new ArrayList<FacultyPojo>();
				StudentIntf studentIntf = new StudentImpl();
				fp=studentIntf.getquestionid(i,stud_id);
				
			int qid = fp.getQuestion_id();
			System.out.println("pooja"+id);
			
           String que =fp.getQuetion();
			System.out.println("que"+que);
		//	intf.deleteTemp(qid);
			Gson gson = new Gson();
			String jsonStudents = gson.toJson(fp);
			response.setContentType("application/json");
			out.print(jsonStudents);
			
			}
			else
			{
				out.print("result");
			}
			
			
			
			//	out.write("result");
			
			
			
		}
		
		
		else if(action!=null && action.equalsIgnoreCase("getanswer"))
		{
			
			System.out.println("inside answer");
			if(request.getParameter("qid")!=null && request.getParameter("qid")!="")
			{
			int qid = Integer.parseInt(request.getParameter("qid"));
			System.out.println("id"+qid);
			List<OptionPojo> oplist = new ArrayList<OptionPojo>();
			oplist =intf.getOption(qid);
			Collections.shuffle(oplist);
			
			new Gson().toJson(oplist, response.getWriter());
			}
			
			
			
		}
		
		else if(action!=null && action.equalsIgnoreCase("checkanswer"))
		{
			System.out.println("inside checkanswer");
			
			
			int stud_id =(Integer)session.getAttribute("id");
			int qid = Integer.parseInt(request.getParameter("qid"));
			int correct = Integer.parseInt(request.getParameter("correct"));
			int opid = Integer.parseInt(request.getParameter("opid"));
			String status = request.getParameter("status");
			String ans_status ="";
		
			
			int ans = intf.getAnswer(opid);
			int marks=0;
			if(ans==correct)
			{
				System.out.println("true");
				ans_status = "right";
				
				marks= marks+1;
				//intf.addMarks(id, marks);
				intf.updateDifficultyLevel(qid);
				intf.addAnsStatus(stud_id, qid, ans_status, marks);
				/*List<AnswerStatusPojo> list = new ArrayList<AnswerStatusPojo>(); 
				list = intf.getQuestionid(id);*/
				
				List<AnswerStatusPojo> list = new ArrayList<AnswerStatusPojo>(); 
				
				
				
			}
			else
			{
				//intf.addMarks(id, marks);
				ans_status = "wrong";
				intf.addAnsStatus(stud_id, qid, ans_status, marks);
			}
			
			}
		
		else if(action!=null && action.equalsIgnoreCase("GetResult"))
		{
			int stud_id =(Integer)session.getAttribute("id");
			
			
			String subject = (String)session.getAttribute("subject");
			System.out.println("inside getresult");
			List<Integer> list = new ArrayList<Integer>();
			int marks =0;
			list = intf.getTotalMarks(stud_id);
			System.out.println("k"+list.size());
			
			for(int i =0; i<list.size(); i++)
			{
				System.out.println("m"+list.get(i));
				marks = marks + list.get(i);
				System.out.println("marks"+marks);
				
			}
			System.out.println("final"+marks);
			
			//intf.addFinalMarks(id, marks);
			
			int totalimarks =(Integer) session.getAttribute("marks");
			//int totalmarks = intf.getFinalResult(id);
			intf.finalTruncate(stud_id);
			StudentIntf studentIntf = new StudentImpl();
			String studname  =studentIntf.getName(stud_id);
			
			String branch =studentIntf.getBranch(stud_id);
			
			String email = studentIntf.getParentsEmail(stud_id);
			
			studentIntf.addMarks(stud_id, studname, branch, subject, totalimarks);
			
			EmailUtility emailUtility = new EmailUtility();
			emailUtility.sendEmail(email, "Your child scored "+marks+" for subject "+subject+" out of "+totalimarks);
			
			
			//System.out.println("totalmarks"+totalmarks);
			out.write("You scored "+marks+" in subject "+subject+" out of "+totalimarks);
			
			
			
			
			List<SubjectMarksPojo> sublist = new ArrayList<SubjectMarksPojo>();
			sublist = intf.getsubjectMarks(id);
			for(int i =0; i<sublist.size(); i++)
			{
				
			}
			
			
			
		}
			
		else if(action!=null && action.equalsIgnoreCase("checkfirsttest"))
		{
			System.out.println("check test");
			
			boolean res = intf.checkStudentTest(id);
			System.out.println("rs"+res);
			if(!res)
			{
				//response.sendRedirect("test.jsp");
				response.sendRedirect("instruction.jsp");
			}
			else
			{
				response.sendRedirect("err_test.jsp");
			}
			
		}
		
		else if(action!=null && action.equalsIgnoreCase("getSubject"))
		{
			int sid = (Integer)session.getAttribute("id");
			System.out.println("studentid"+sid);
			
			String branch = intf.getBranch(sid);
			System.out.println("branch"+branch);
			List<BranchSubject> list = new ArrayList<BranchSubject>();
			list = intf.getSubjectList(branch);
			System.out.println("listttttttt"+list.toString());
			
			
			new Gson().toJson(list, response.getWriter());
		}
		
		else if(action!=null && action.equalsIgnoreCase("getMarks"))
		{

			StudentIntf studentIntf = new StudentImpl();
			String subject =(String)session.getAttribute("subject");
			System.out.println("subjectpppppppp "+subject);
			
			double marks1 = studentIntf.getMarks(subject);
			int marks=(int) Math.round(marks1);
			session.setAttribute("marks", marks);
			out.print(marks);
		}
		
		else if(action!=null && action.equalsIgnoreCase("setSubject"))
		{
			String subject = request.getParameter("subject");
			session.setAttribute("subject", subject);
		}
		else if(action!=null && action.equalsIgnoreCase("getFlag"))
		{
			System.out.println("inside getflag");
			int stud_id =(Integer)session.getAttribute("id");
			List<Integer> list = new ArrayList<Integer>();
			list = intf.fetchFlag(stud_id);
			System.out.println("listtttttttttt"+list.toString());
			new Gson().toJson(list, response.getWriter());
			
		}
		
		else if(action!=null && action.equalsIgnoreCase("FetchFlagQuestion"))
		{
			int tempid = Integer.parseInt(request.getParameter("id"));
			
			System.out.println("tempid"+tempid);
			FacultyPojo fp = new FacultyPojo();
			int stud_id =(Integer)session.getAttribute("id");
			 fp = intf.getquestionid(tempid,stud_id);
			 Gson gson = new Gson();
				String jsonStudents = gson.toJson(fp);
				response.setContentType("application/json");
				out.print(jsonStudents);
			
			
		}
		
		
		}
		
		
	

}
