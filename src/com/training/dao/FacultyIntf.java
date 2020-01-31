package com.training.dao;

import java.util.List;

import javax.swing.text.AbstractDocument.BranchElement;

import com.training.pojo.BranchSubject;
import com.training.pojo.FacultyPojo;
import  com.training.pojo.AluminiPojo;
import com.training.pojo.LevelPojo;
import com.training.pojo.QuestionAnswer;
import com.training.pojo.ResultPojo;

public interface FacultyIntf 
{
	
	public boolean addQuestion(FacultyPojo facultyPojo,String options[][]);
	public List<AluminiPojo> getAllAluminiRecords(String year);
	public String getPath(int id);
	public boolean addSubject(String branch, String subject,Double marks,int facultyId);
	public boolean checkSubject(String branch, String subject);
	public List<BranchSubject> fetchSubject(String branch);
	public String getName(int id);
	public boolean addBranch(String email,String branch);
	public boolean getBranch(String email, String branch);
	public List branchList(String emailId);
	public List<LevelPojo> fetchLevel();
	public int getLevelID(String level);
	public List fetchSubject(String branch,int facultyId);
	public int fetchSubjectMarks(String branch,String subject);
	public boolean editSubjectMarks(String branch,String subject,int marks);
	public List<ResultPojo> getMarkList(String branch,String subject);
	
	
	public boolean editfaculty(int fid,String femail,String fname);
	public boolean editstudent(int fid,String femail,String fname);
	public List<QuestionAnswer>getQuestion(String branch, String sub);
}

