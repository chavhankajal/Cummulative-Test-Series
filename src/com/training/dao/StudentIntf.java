package com.training.dao;

import java.util.List;

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

public interface StudentIntf {
	
	public boolean addPersonal(StudentPersonalPojo sp, int id);
	public boolean addEducation(StudentEducationPojo sp, int id);
	public boolean addProject(StudentProjectDetails sp, int id);
	public boolean updatePath(String path, int id);
   public String getName(int id);
   public boolean addDocuments(DocumentsPojo dp);
   public List<DocumentsPojo> getList(int id);
   public DocumentsPojo getPath(int id);
   public boolean chckdocument(int id);
   public List<NotesPojo> viewNotes(String type);
   public NotesPojo getNotePath(int id);
   public boolean checkEmail(int id, String email);
   
   public String getPdfPath(int id);
   public boolean getDocName(int id, String name);
	public String getBranch(int id);
	public List<FacultyPojo> getQuestion(List<BranchSubject> sublist);
	public List<OptionPojo> getOption(long qid);
	public int getAnswer(int opid);
	public int getFinalResult(int id);
	public boolean addQueStatus(int uid, int qid, String status);
	public boolean addAnsStatus(int id, long qid, String ansstatus, int marks);
	public boolean checkQueStatus(int qid, int id, String status);
	public List<FacultyPojo> getNewQue(int qid, String branch);
	public boolean insertTemp(List<FacultyPojo> list,int stud_id);
	public List<FacultyPojo>fetchTemp();
	public boolean deleteTemp(int qid);
	public List<Integer> getTotalMarks(int id);
	public boolean addFinalMarks(int uid, int marks);
	public List<BranchSubject>getSubjectList(String branch);
	public boolean deleteMarks(int id);
	public boolean checkStudentTest(int id);
	public List<AnswerStatusPojo>getQuestionid(int id);
	public boolean addQueSubject(int id, int que, int marks);
	public boolean updateSubject(int id, int que, String sub);
	public String fetchSubject(int qid);
	public List<SubjectMarksPojo> getsubjectMarks(int id);
	public List<FacultyPojo> getQuestionList(String subject,int marks);
	public double getMarks(String subject);
	public List<Integer> fetchFlag(int stud_id);
	public FacultyPojo getquestionid(int id,int stud_id);
	public FacultyPojo getquestionidFirst(int stud_id);
	public FacultyPojo getQuestion(int id);
	public List<FacultyPojo> getTempQuestion();
	public void finalTruncate(int stud_id); 
	public String getParentsEmail(int stud_id);
	
	public void addMarks(int stud_id,String name ,String branch,String subject,int marks);
	public void updateDifficultyLevel(int qid);
	
   
}
