package com.training.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ArrayBlockingQueue;

import javax.naming.spi.DirStateFactory.Result;

import com.training.pojo.AnswerStatusPojo;
import com.training.pojo.BranchSubject;
import com.training.pojo.DocumentsPojo;
import com.training.pojo.FacultyPojo;
import com.training.pojo.NotesPojo;
import com.training.pojo.OptionPojo;
import com.training.pojo.StudentEducationPojo;
import com.training.pojo.StudentPersonalPojo;
import com.training.pojo.StudentProjectDetails;
import com.training.pojo.SubjectMarksPojo;
import com.training.utility.MyConnection;

public class StudentImpl implements StudentIntf{
	Connection conn = null;
	
	public boolean addPersonal(StudentPersonalPojo sp, int id) {
		try
		{
		conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("insert into resume_personal_details (student_id, name, emailid, phone, address, objective, gender, dob, father_name, hobby, languages, place) values(?,?,?,?,?,?,?,?,?,?,?,?)");
		ps.setInt(1, id);
		ps.setString(2, sp.getName());
		ps.setString(3, sp.getEmail());
		ps.setString(4, sp.getPhone());
		ps.setString(5, sp.getAddress());
		ps.setString(6, sp.getObjective());
		ps.setString(7, sp.getGender());
		ps.setString(8, sp.getDob());
		ps.setString(9, sp.getFather_name());
		ps.setString(10, sp.getHobby());
		ps.setString(11, sp.getLanguages());
		ps.setString(12, sp.getPlace());
		
		
		int count = ps.executeUpdate();
		return true;
		
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return false;
	}

	public boolean addEducation(StudentEducationPojo sp, int id) {
		try
		{
		Connection conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("insert into education_details(student_id, profile_id, qual, year, university, perc)values(?,?,?,?,?,?)");
		
		ps.setInt(1, id);
		ps.setInt(2, sp.getProfile_id());
		ps.setString(3, sp.getQual());
		ps.setString(4, sp.getYear());
		ps.setString(5, sp.getUniversity());
		ps.setDouble(6, sp.getPerc());
		int count = ps.executeUpdate();
		if(count>0)
		{
			return true;
		}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}return false;
		}

	public boolean addProject(StudentProjectDetails sp, int id) {
		try
		{
		Connection conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("insert into student_project_details (student_id, profile_id, project_name, project_lang, project_desc) values(?,?,?,?,?)");
		
		ps.setInt(1, id);
		ps.setInt(2, sp.getProfile_id());
		ps.setString(3, sp.getProject_name());
		ps.setString(4, sp.getProject_lang());
		ps.setString(5, sp.getProject_desc());
		
		int count = ps.executeUpdate();
		if(count>0)
		{
			return true;
		
		}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return false;
		}

	public boolean updatePath(String path, int id) {
		try
		{
		Connection conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("update student_registration set resume_path=? where id=?");
		ps.setString(1, path);
		ps.setInt(2, id);
		
		int count = ps.executeUpdate();
		
		if(count>0)
		{
			return true;
		}
		
		} catch(SQLException e) 
		{
			e.printStackTrace();
		}
		return false;
	}

	public String getName(int id) {
		try
		{
		Connection conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("select name from student_registration where id=?");
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			String name = rs.getString("name");
			return name;
		}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return null;
	}

	public boolean addDocuments(DocumentsPojo dp) {
	
		try
		{
		Connection conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("insert into document_table(student_id, document_name, document_path) values(?,?,?)");
		
		ps.setInt(1, dp.getId());
		ps.setString(2, dp.getDocument_name());
		ps.setString(3, dp.getDocument_path());
		//ps.setString(4, dp.getDocument_web_path());
		
		int count = ps.executeUpdate();
		if(count>0)
		{
			return true;
		}
		
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return false;
	}

	public List<DocumentsPojo> getList(int id) {
		try
		{
		Connection con = MyConnection.getConnection();
		PreparedStatement ps = con.prepareStatement("select * from document_table where student_id=?");
		
		List<DocumentsPojo> list = new ArrayList<DocumentsPojo>();
		ps.setInt(1, id);
		
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			DocumentsPojo dp = new DocumentsPojo();
			dp.setDocument_name(rs.getString("document_name"));
			dp.setDocument_path(rs.getString("document_path"));
			dp.setDocument_web_path(rs.getString("document_web_path"));
			dp.setId(rs.getInt("id"));
			list.add(dp);
			
		}
		return list;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			
		}
		return null;
	}

	public DocumentsPojo getPath(int id) {
		try
		{
		Connection con = MyConnection.getConnection();
		PreparedStatement ps = con.prepareStatement("select * from document_table where id=?");
		ps.setInt(1, id);
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			DocumentsPojo dp = new DocumentsPojo();
			dp.setDocument_path(rs.getString("document_path"));
			dp.setDocument_web_path(rs.getString("document_web_path"));
			return dp;
		}
		
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return null;
		}

	public boolean chckdocument(int id) {
		try
		{
		Connection conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("select * from document_table where student_id=?");
		ps.setInt(1, id);
		
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		
		{
			return true;
		}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return false;
	}

	public List<NotesPojo> viewNotes(String type) {
		try
		{
			List<NotesPojo> list = new ArrayList<NotesPojo>();
			Connection conn = MyConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement("select * from notes_table where type=?");
			ps.setString(1, type);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				NotesPojo dp =new NotesPojo();
				dp.setId(rs.getInt("id"));
				dp.setNotes_name(rs.getString("notes_name"));
				dp.setNotes_path(rs.getString("notes_path"));
				list.add(dp);
			}
			return list;
			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return null;
	}

	public NotesPojo getNotePath(int id) {
		// TODO Auto-generated method stub
		try
		{
			Connection conn = MyConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement("select notes_path from notes_table where id=?");
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				NotesPojo np = new NotesPojo();
				np.setNotes_path(rs.getString("notes_path"));
				return np;
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return null;
	}

	public boolean checkEmail(int id, String email) {
		try
		{
		Connection conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("select * from student_registration where email=? and id=?");
		ps.setString(1, email);
		ps.setInt(2, id);
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

	public String getPdfPath(int id) {
		try
		{
		Connection conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("select resume_path from student_registration where id=?");
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			String path = rs.getString("resume_path");
			return path;
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	public boolean getDocName(int id, String name) {
		try
		{
		Connection conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("select * from document_table where document_name =? and student_id=?");
		ps.setString(1, name);
		ps.setInt(2, id);
		
	ResultSet rs =	ps.executeQuery();
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
	
	public String getBranch(int id) {
		try
		{
	Connection conn = MyConnection.getConnection();
	PreparedStatement ps = conn.prepareStatement("select branch from student_registration where id =?");
	ps.setInt(1, id);
	ResultSet rs = ps.executeQuery();
	
	while(rs.next())
	{
		String branch = rs.getString("branch");
		return branch;
	}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
				return null;
	}

	public List<FacultyPojo> getQuestion(List<BranchSubject> sublist) {
		try
		{
			List<FacultyPojo> list = new ArrayList<FacultyPojo>();
		Connection conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("select * from question_table where subject=? ");
	System.out.println("ppp"+sublist.size());
		for(int i =0; i<sublist.size(); i++)
		{
			ps.setString(1, sublist.get(i).getSubject_name());	
			
		
		
		
			ResultSet rs = ps.executeQuery();
		
	while(rs.next())
	{
		FacultyPojo fp = new FacultyPojo();
		fp.setQuetion(rs.getString("quetion"));
		fp.setQuestion_id(rs.getInt("quetion_id"));
		fp.setCorrect_answer(rs.getInt("correct_answer"));
		list.add(fp);
		
		
	}
	System.out.println("listttttttttttttttttt"+list.size());
		}
		
		System.out.println("listttttttttttttttttt"+list.size());
		return list;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	public List<OptionPojo> getOption(long qid) {
		try
		{
			List<OptionPojo> list = new ArrayList<OptionPojo>();
		Connection conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("select * from options_table where quetion_id=?");
		ps.setLong(1, qid);
		
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			OptionPojo op = new OptionPojo();
			
			op.setOptions(rs.getString("options"));
			op.setQuestion_alphabets(rs.getString("question_alphabets"));
			op.setId(rs.getInt("id"));
			list.add(op);
		}
		return list;
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
					}
		return null;

	}

	public int getAnswer(int opid) {
		try
		{
			 conn = MyConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement("select question_alphabets from options_table where id=? ");
		ps.setInt(1, opid);
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			int ans = rs.getInt("question_alphabets");
			return ans;
		}
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return 0;
	}

	

	public boolean addQueStatus(int uid, int qid, String status) {
		try
		{
		 conn = MyConnection.getConnection();
		PreparedStatement ps =conn.prepareStatement("insert into table_que_status (uid, qid, status) values(?,?,?)");
    ps.setInt(1, uid);
	ps.setInt(2, qid);
	ps.setString(3, status);
	ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}

	public boolean addAnsStatus(int id, long qid, String ansstatus, int marks) {
		try
		{
		 conn = MyConnection.getConnection();
		PreparedStatement ps =conn.prepareStatement("insert into table_ans_status (uid, qid, anwer_status, marks) values(?,?,?,?)");
		
		ps.setInt(1, id);
		ps.setLong(2, qid);
		ps.setString(3, ansstatus);
		ps.setDouble(4, marks);
		
		ps.executeUpdate();
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}

	public boolean checkQueStatus(int qid,int uid, String status) {
		try
		{
		Connection conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("select * from table_que_status where qid=? and uid=? and status=?");
		
		ps.setInt(1, qid);
		ps.setInt(2, uid);
		ps.setString(3, status);
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

	public List<FacultyPojo> getNewQue(int qid, String branch) {
		try
		{
			List<FacultyPojo> list = new ArrayList<FacultyPojo>();
		Connection conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("select * from  question_table where quetion_id!=? and branch=?");
		ps.setInt(1, qid);
		ps.setString(2, branch);
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			FacultyPojo fp = new FacultyPojo();
			fp.setQuetion(rs.getString("quetion"));
			fp.setQuestion_id(rs.getInt("quetion_id"));
			fp.setCorrect_answer(rs.getInt("correct_answer"));
			list.add(fp);
		}
		return list;
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	public boolean insertTemp(List<FacultyPojo> list,int stud_id) {
		try
		{
			Connection conn = MyConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement("insert into temp_que(que_id, question, correct_answer,stud_id,id) values(?,?,?,?,?)");
		int x=1;
		for(int i =0; i<list.size(); i++)
		{
			ps.setInt(1, list.get(i).getQuestion_id());
			ps.setString(2, list.get(i).getQuetion());
			ps.setInt(3, list.get(i).getCorrect_answer());
			ps.setInt(4, stud_id);
			ps.setInt(5, x);
			ps.executeUpdate();
			x++;
		}
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}

	public List<FacultyPojo> fetchTemp() {
		try
		{
			List<FacultyPojo> list = new ArrayList<FacultyPojo>();
		Connection conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("select * from temp_que");
	ResultSet rs =	ps.executeQuery();
	while(rs.next())
	{
		FacultyPojo fp = new FacultyPojo();
		fp.setQuestion_id(rs.getInt("que_id"));
		fp.setQuetion(rs.getString("question"));
		fp.setCorrect_answer(rs.getInt("correct_answer"));
		list.add(fp);
		
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

	public boolean deleteTemp(int qid) {
		try
		{
			Connection conn = MyConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement("delete from temp_que where que_id=?");
			ps.setInt(1, qid);
			ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}

	
	public int getFinalResult(int id) {
		try
		{
			Connection conn = MyConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement("select total_marks from result_table where uid=? order by uid desc limit 1");
	
			ps.setInt(1, id);
			
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
		int marks = rs.getInt("total_marks");
		System.out.println("marks"+marks);
			return marks;
		
		}}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return 0;
	}

	public List<Integer> getTotalMarks(int id) {
		try
		{
			System.out.println("uuu"+id);
			List<Integer> list = new ArrayList<Integer>();
			int marks=0;
			 conn = MyConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement("select marks from table_ans_status where uid=?");
			
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				 marks = rs.getInt("marks");
				 list.add(marks);
				 System.out.println("kssk"+list.size());
				
				
				 
			}
			return list;
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	public boolean addFinalMarks(int uid, int marks) {
		try
		{
		Connection conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("insert into result_table (uid, total_marks) values(?,?)");
		ps.setInt(1, uid);
		ps.setInt(2, marks);
		ps.executeUpdate();
		return true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		return false;
	}

	public List<BranchSubject> getSubjectList(String branch) {
		try
		{
			List<BranchSubject> list = new ArrayList<BranchSubject>();
		Connection conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("select subject_name  from subject_table where branch_name=?");
		ps.setString(1, branch);
		
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			BranchSubject br = new BranchSubject();
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

	public boolean deleteMarks(int id) {
		try
		{
		Connection conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("delete from result_table where uid=?");
		ps.setInt(1, id);
		ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}

	public boolean checkStudentTest(int id) {
		try
		{
		Connection conn  = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("select * from result_table where uid=?");
		ps.setInt(1, id);
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

	public boolean addQueSubject(int id, int que, int marks) {
		try
		{
		Connection conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("insert into subject_marks(uid, qid, marks) values(?,?,?) ");
		ps.setInt(1, id);
		ps.setInt(2, que);
		ps.setInt(3, marks);
		int count = ps.executeUpdate();
		
		if(count>0)
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

	public List<AnswerStatusPojo> getQuestionid(int id) {
		try
		{
			List<AnswerStatusPojo> list = new ArrayList<AnswerStatusPojo>();
		Connection conn  = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("select * from subject_marks where uid=?");
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			AnswerStatusPojo an = new AnswerStatusPojo();
			an.setQid(rs.getInt("qid"));
			list.add(an);
			
		}
		return list;
		}
		catch(Exception e)
		{
			
		}
		return null;
	}

	public boolean updateSubject(int id, int que, String sub) {
		
		try
		{
		 conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("update subject_marks set subject=? where uid=? and qid=?");
		
		ps.setString(1, sub);
		ps.setInt(2, id);
		ps.setInt(3, que);
		ps.executeUpdate();
		conn.close();
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return false;
	}

	public String fetchSubject(int qid) {
		try
		{
		conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("select subject from question_table where quetion_id=?");
		ps.setInt(1, qid);
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			String sub = rs.getString("subject");
			conn.close();
			return sub;
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	public List<SubjectMarksPojo> getsubjectMarks(int id) {
		try
		{
			List<SubjectMarksPojo> list = new ArrayList<SubjectMarksPojo>();
		 conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("select * from subject_marks where uid=?");
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			SubjectMarksPojo sub = new SubjectMarksPojo();
			sub.setQid(rs.getInt("qid"));
			sub.setMarks(rs.getInt("marks"));
			sub.setSubject(rs.getString("subject"));
			
			list.add(sub);
		}
		return list;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	public List<FacultyPojo> getQuestionList(String subject,int marks) {
		System.out.println("markssssssssssssssssssssssssssssss "+marks+"ddddddddddddddd "+subject);
		int totalquestions =marks/4;
		List<FacultyPojo>  list = new ArrayList<FacultyPojo>();
		Connection conn = null;
		try
		{
			
		 conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("select * from question_table where subject=? and level_id=1 order by rand() limit "+totalquestions);
	
			ps.setString(1, subject);	
			
			ResultSet rs = ps.executeQuery();
		
	while(rs.next())
	{
		FacultyPojo fp = new FacultyPojo();
		fp.setQuetion(rs.getString("quetion"));
		fp.setQuestion_id(rs.getInt("quetion_id"));
		fp.setCorrect_answer(rs.getInt("correct_answer"));
		list.add(fp);
		
		
	}
	
	
	
	
	
	PreparedStatement ps1 = conn.prepareStatement("select * from question_table where subject=? and level_id=2 order by rand() limit "+totalquestions);

		ps1.setString(1, subject);	
		
		ResultSet rs1 = ps1.executeQuery();
	
while(rs1.next())
{
	FacultyPojo fp1 = new FacultyPojo();
	fp1.setQuetion(rs1.getString("quetion"));
	fp1.setQuestion_id(rs1.getInt("quetion_id"));
	fp1.setCorrect_answer(rs1.getInt("correct_answer"));
	list.add(fp1);
	
	
}



PreparedStatement ps2 = conn.prepareStatement("select * from question_table where subject=? and level_id=3 order by rand() limit "+totalquestions);

ps2.setString(1, subject);	

ResultSet rs2 = ps2.executeQuery();

while(rs2.next())
{
FacultyPojo fp2 = new FacultyPojo();
fp2.setQuetion(rs2.getString("quetion"));
fp2.setQuestion_id(rs2.getInt("quetion_id"));
fp2.setCorrect_answer(rs2.getInt("correct_answer"));
list.add(fp2);


}


PreparedStatement ps3 = conn.prepareStatement("select * from question_table where subject=? and level_id=4 order by rand() limit "+totalquestions);

ps3.setString(1, subject);	

ResultSet rs3 = ps3.executeQuery();

while(rs3.next())
{
FacultyPojo fp3 = new FacultyPojo();
fp3.setQuetion(rs3.getString("quetion"));
fp3.setQuestion_id(rs3.getInt("quetion_id"));
fp3.setCorrect_answer(rs3.getInt("correct_answer"));
list.add(fp3);


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

	public double getMarks(String subject) {
		Connection conn = null;
		try
		{
			
		 conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("select total_marks from subject_table where subject_name=? ");
		ps.setString(1, subject);
		ResultSet rs= ps.executeQuery();
		double marks=0.0;
		while(rs.next())
		{
			marks=rs.getDouble("total_marks");
			return marks;
			
		}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return 0;
	}
	public List<Integer> fetchFlag(int stud_id ) {
		
		Connection conn = null;
		List<Integer> list = new ArrayList<Integer>();
		try
		{
			conn = MyConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement("select id from temp_que where stud_id=?");
			ps.setInt(1, stud_id);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				int tempid = rs.getInt("id");
				list.add(tempid);
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

	public FacultyPojo getquestionid(int id,int stud_id) {
	
		
		try
		{
			conn = MyConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement("select que_id, question, correct_answer from temp_que where id=? and stud_id=? ");
			ps.setInt(1, id);
			ps.setInt(2, stud_id);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				FacultyPojo fp = new FacultyPojo();
				fp.setQuestion_id(rs.getInt("que_id"));
				fp.setQuetion(rs.getString("question"));
				fp.setCorrect_answer(rs.getInt("correct_answer"));
				
				
				return fp;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

public FacultyPojo getquestionidFirst(int stud_id) {
	
		
		try
		{
			conn = MyConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement("select que_id, question, correct_answer from temp_que where stud_id=? limit 1 ");
			
			ps.setInt(1, stud_id);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				FacultyPojo fp = new FacultyPojo();
				fp.setQuestion_id(rs.getInt("que_id"));
				fp.setQuetion(rs.getString("question"));
				fp.setCorrect_answer(rs.getInt("correct_answer"));
				
				
				return fp;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	
	public FacultyPojo getQuestion(int id) {
		// 
		return null;
	}

	public List<FacultyPojo> getTempQuestion() {
		
		return null;
	}

	public void finalTruncate(int stud_id) {
		try
		{
		conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("delete  from table_ans_status where uid=?");
		ps.setInt(1, stud_id);
		ps.executeUpdate();
		
		PreparedStatement ps2 = conn.prepareStatement("delete  from subject_marks where uid=?");
		ps2.setInt(1, stud_id);
		ps2.executeUpdate();
		
		
		PreparedStatement ps3 = conn.prepareStatement("delete  from temp_que where stud_id=?");
		ps3.setInt(1, stud_id);
		ps3.executeUpdate();
		
		/*PreparedStatement ps4 = conn.prepareStatement("delete  from result_table where uid=?");
		ps4.setInt(1, stud_id);
		ps4.executeUpdate();*/
		
		
		
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

	public String getParentsEmail(int stud_id) {
		try
		{
		conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("select parents_email from student_registration where id =?");
		ps.setInt(1, stud_id);
		ResultSet rs =ps.executeQuery();
		String email=null;
		while(rs.next())
		{
			email = rs.getString("parents_email");
			return email;
		}
		
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
		
	}

	public void addMarks(int stud_id, String name, String branch,String subject, int marks) 
	{
		try
		{
		conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("insert into result_table (uid,stud_name,stud_branch,stud_subject,stud_marks) values (?,?,?,?,?)");
		ps.setInt(1, stud_id);
		ps.setString(2, name);
		ps.setString(3, branch);
		ps.setString(4, subject);
		ps.setInt(5, marks);
		ps.executeUpdate();
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

	public void updateDifficultyLevel(int qid) {
		try
		{
		conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("select level_id, count from question_table where quetion_id =?");
		ps.setInt(1, qid);
		ResultSet rs= ps.executeQuery();
		int count=0;
		int level_id=0;
		while(rs.next())
		{
			count = rs.getInt("count");
			level_id = rs.getInt("level_id");
		}
		
		if(count<3)
		{
			PreparedStatement ps2 = conn.prepareStatement("update question_table set count =? where quetion_id =? ");
			ps2.setInt(1,count+1 );
			ps2.setInt(2, qid);
			ps2.executeUpdate();
		}
		else if((count>=3)&&(level_id<4))
		{
			PreparedStatement ps3 =conn.prepareStatement("update question_table set count =? , level_id = ? where quetion_id =?");
		    ps3.setInt(1, 0);
			ps3.setInt(2, level_id+1);
			ps3.setInt(3, qid);
			ps3.executeUpdate();
		}
		
		
	}catch(Exception e)
		{
		e.printStackTrace();
	}

	
	}
	
	

	
	

	
	}

	
	


