package com.training.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.training.pojo.AluminiPojo;
import com.training.pojo.BranchSubject;
import com.training.pojo.FacultyPojo;
import com.training.pojo.LevelPojo;
import com.training.pojo.QuestionAnswer;
import com.training.pojo.ResultPojo;
import com.training.utility.MyConnection;


public class FacultyImpl implements FacultyIntf
{

	

	
	public boolean addQuestion(FacultyPojo facultyPojo, String[][] options) 
	{
		// TODO Auto-generated method stub
        Connection conn=null;
		
		try {
			conn=MyConnection.getConnection();
			PreparedStatement ps=conn.prepareStatement("insert into question_table(branch,subject,quetion,correct_answer,level_id) values(?,?,?,?,?)");
			
			ps.setString(1, facultyPojo.getBranch());
			ps.setString(2, facultyPojo.getSubject());
			ps.setString(3, facultyPojo.getQuetion());
			ps.setInt(4, facultyPojo.getCorrect_answer());
			ps.setString(5, facultyPojo.getLevel());
			
			int i=ps.executeUpdate();
			
			if(i>0)
			{
				long questionId=0;
				PreparedStatement ps5=conn.prepareStatement("select quetion_id from question_table order by quetion_id desc limit 1");
				
				ResultSet rs=ps5.executeQuery();
				while (rs.next()) {
					
					questionId=rs.getLong("quetion_id");
				}
				
				PreparedStatement ps1=conn.prepareStatement("insert into options_table(quetion_id,options,question_alphabets) values(?,?,?)");
				int k=0;
				
				FacultyPojo optionsPojo=new FacultyPojo();
				
				if(options[0]!=null)
				{
					int z=1;
					for(int x=0;x<options[0].length;x++)
					{   
						
						ps1.setLong(1, questionId);
						ps1.setString(2,options[k][x]);
						ps1.setInt(3, z);
								
						System.out.println("QuestionId::::::::" +questionId);
						ps1.executeUpdate();
						k=0;
						z++;
						
					}
				}
			}
			return true;
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return false;
	}

	public List<AluminiPojo> getAllAluminiRecords(String year) {

		Connection conn=null;
		
		try {
			
			System.out.println("year is"+year);
			conn=MyConnection.getConnection();
			PreparedStatement ps=conn.prepareStatement("select * from Alumini_Details where passout_year=?");
			
			ps.setString(1, year);
			
			ResultSet rs=ps.executeQuery();
			List<AluminiPojo> studentList=new ArrayList<AluminiPojo>();

			while(rs.next())
			{
				AluminiPojo aluminiPojo=new AluminiPojo();
				
				aluminiPojo.setId(rs.getInt("id"));
				aluminiPojo.setStudent_name(rs.getString("student_name"));
				aluminiPojo.setCompany_org(rs.getString("company_org"));
				aluminiPojo.setDesignation(rs.getString("designation"));
				aluminiPojo.setHr_name(rs.getString("hr_name"));
				aluminiPojo.setPassout_year(rs.getString("passout_year"));
				aluminiPojo.setEmail(rs.getString("email"));
				aluminiPojo.setSalary_package(rs.getString("salary_package"));
				aluminiPojo.setOffer_letter_path(rs.getString("offer_letter_path"));
				
				//System.out.println("pooja"+rs.getString("email"));
				
				studentList.add(aluminiPojo);
			}
			return studentList;
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return null;
	}


public String getPath(int id) {
	try
	{
	Connection conn=MyConnection.getConnection();
	PreparedStatement ps = conn.prepareStatement("select offer_letter_path from alumini_details where id=?");
	ps.setInt(1, id);
	ResultSet rs = ps.executeQuery();
	while(rs.next())
	{
		String path = rs.getString("offer_letter_path");
		System.out.println("path is:"+path);
		return path;
	}
	}
	
	catch(SQLException e)
	{
		e.printStackTrace();
	}
	return null;
}

public boolean addSubject(String branch, String subject,Double marks,int facultyId) {
	try
	{
	Connection conn = MyConnection.getConnection();
	
	PreparedStatement ps = conn.prepareStatement("insert into subject_table (branch_name, subject_name,total_marks,facultyId) values(?,?,?,?)");
	ps.setString(1, branch);
	ps.setString(2, subject);
	ps.setDouble(3, marks);
	ps.setInt(4, facultyId);
	ps.executeUpdate();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return false;
}

public boolean checkSubject(String branch, String subject) {
	try
	{
	Connection conn = MyConnection.getConnection();
	PreparedStatement ps = conn.prepareStatement("select * from subject_table where branch_name=? and subject_name=?");
	
	ps.setString(1, branch);
	ps.setString(2, subject);
	
	ResultSet rs = ps.executeQuery();
	while(rs.next())
	{
		return true;
	}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return false;
	


	}

public List<BranchSubject> fetchSubject(String branch) {
	try
	{
		List<BranchSubject> list = new ArrayList<BranchSubject>();
	Connection conn = MyConnection.getConnection();
	PreparedStatement ps = conn.prepareStatement("select * from subject_table where branch_name=?");
	ps.setString(1, branch);
	
	ResultSet rs = ps.executeQuery();
	while(rs.next())
	{
		BranchSubject br = new BranchSubject();
		br.setId(rs.getInt("id"));
		br.setSubject_name(rs.getString("subject_name"));
		
	list.add(br);
	
	}
	return list;
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return null;
	}

public String getName(int id) {
	try
	{
Connection conn = MyConnection.getConnection();
PreparedStatement ps = conn.prepareStatement("select name from faculty_registration where id=?");
ps.setInt(1, id);
ResultSet rs = ps.executeQuery();
while(rs.next())
{
	String name = rs.getString("name");
	return name;
}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return null;
}

public boolean addBranch(String email, String branch) {
	Connection conn;
	try {
		conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("insert into branch(branch,facultyEmail)values(?,?)");
		ps.setString(1, branch);
		ps.setString(2, email);
		int i=ps.executeUpdate();
		if(i>0)
		{
			return true;
		}
		else
		{
			return false;
		}
		
		
		
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return false;
}
	
	public boolean getBranch(String email, String branch) {
		Connection conn;
		try {
			conn = MyConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement("select * from branch where branch=? and facultyEmail=?");
			ps.setString(1, branch);
			ps.setString(2, email);
			ResultSet resultSet = ps.executeQuery();
			if(resultSet.next())
			{
				return true;
			}
			else
			{
				return false;
			}
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	return false;
}
	
	public List branchList(String emailId) {
		Connection conn;
		
		try {
			conn = MyConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement("select branch from branch where facultyEmail =?");
			ps.setString(1, emailId);
			ResultSet rs=ps.executeQuery();
			List<String> list =new ArrayList<String>();
			while(rs.next())
			{
			String branch = rs.getString("branch");
			list.add(branch);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	public List<LevelPojo> fetchLevel() {
		Connection conn=null;
		
		List<LevelPojo> list = new ArrayList<LevelPojo>();
		try
		{
			conn= MyConnection.getConnection();
			PreparedStatement ps =conn.prepareStatement("select * from tbl_difficulty_level");
		
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			LevelPojo lp = new LevelPojo();
			lp.setId(rs.getInt("id"));
			lp.setLevel(rs.getString("level"));
			list.add(lp);
		}
		conn.close();
		return list;
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return null;
	}

	public int getLevelID(String level) {
		Connection conn = null;
		
		try
		{
		conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("select id from tbl_difficulty_level");
		ResultSet rs = ps.executeQuery();
	   while(rs.next())
	   {
		int id = rs.getInt("id");
		return id;
		}
	   conn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return 0;
	}

	public List fetchSubject(String branch, int facultyId) {
		Connection conn = null;
		try
		{
		conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("select subject_name from subject_table where branch_name =? and facultyId=?");
		ps.setString(1, branch);
		ps.setInt(2, facultyId);
		ResultSet rs =ps.executeQuery();
		List<String> subjectList = new ArrayList<String>();
		
		while(rs.next())
		{
			subjectList.add(rs.getString("subject_name"));
		}
		return subjectList;
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	public int fetchSubjectMarks(String branch, String subject) {
		Connection conn = null;
		try
		{
		conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("select total_marks from subject_table where branch_name=? and subject_name=?");
		ps.setString(1, branch);
		ps.setString(2, subject);
		ResultSet rs =ps.executeQuery();
		int marks=0;
		while(rs.next())
		{
			marks =rs.getInt("total_marks");
		}
		return marks;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return 0;
	}

	public boolean editSubjectMarks(String branch, String subject, int marks) {
		Connection conn = null;
		try
		{
		conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("update subject_table set total_marks=? where branch_name=? and subject_name=?");
		ps.setInt(1, marks);
		ps.setString(2, branch);
		ps.setString(3, subject);
		ps.executeUpdate();
		
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}

	public List<ResultPojo> getMarkList(String branch, String subject) {
		Connection conn = null;
		try
		{
		conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("select * from result_table where stud_branch=? and stud_subject=?");
		ps.setString(1, branch);
		ps.setString(2, subject);
		ResultSet rs =ps.executeQuery();
		List<ResultPojo> list = new ArrayList<ResultPojo>();
		while(rs.next())
		{
			ResultPojo resultPojo = new ResultPojo();
			resultPojo.setStud_name(rs.getString("stud_name"));
			resultPojo.setStud_marks(rs.getInt("stud_marks"));
			list.add(resultPojo);
		}
		return list;
		
	}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;	
}

	public boolean editfaculty(int fid, String femail, String fname) {
		Connection conn = null;
		try
		{
		conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("update faculty_registration set email =? ,name =? where id=? ");
		ps.setString(1, femail);
		ps.setString(2, fname);
		ps.setInt(3, fid);
		int i =ps.executeUpdate();
		if(i>0)
		{
			return true;
		}
		else
		{
			return false;
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
	public boolean editstudent(int fid, String femail, String fname) {
		System.out.println("fidddddd "+fid);
		Connection conn = null;
		try
		{
		conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("update student_registration set email =? ,name =? where id=? ");
		ps.setString(1, femail);
		ps.setString(2, fname);
		ps.setInt(3, fid);
		int i =ps.executeUpdate();
		if(i>0)
		{
			return true;
		}
		else
		{
			return false;
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
	
	public List<QuestionAnswer> getQuestion(String branch, String sub) {
		Connection conn = null;
		try {
			
			conn = MyConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement("select * from question_table where branch =? and subject=?");
			ps.setString(1, branch);
			ps.setString(2, sub);
			ResultSet rs=ps.executeQuery();
			List<QuestionAnswer> list =new ArrayList<QuestionAnswer>();
			while(rs.next())
			{
			QuestionAnswer q= new QuestionAnswer();
			int qid = rs.getInt("quetion_id");
			int cid = rs.getInt("correct_answer");
			q.setQuestion(rs.getString("quetion"));
		
			System.out.println("que"+qid+cid);
			
			PreparedStatement ps2 = conn.prepareStatement("select * from options_table where quetion_id=? and question_alphabets=?" );
			System.out.println("jjdjs"+qid+cid);
			ps2.setInt(1, qid);
			ps2.setInt(2, cid);
			ResultSet rs2 = ps2.executeQuery();
			while(rs2.next())
			{
				String option= rs2.getString("options");
				q.setCorrect(option);
				
			}
			list.add(q);
			
			}
			
			System.out.println("lisstttt"+list.toString());
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	

}

