package com.training.dao;

import java.util.List;

import com.training.pojo.NotesPojo;
import com.training.pojo.DocumentsPojo;
import com.training.pojo.StudentPojo;


public interface AdminIntf {
	
	public boolean addNotes(NotesPojo np);
	public List<StudentPojo> getStudentName();
	public StudentPojo getAllStudentsRecords(String name); 
	public List<DocumentsPojo> getPath(int id, String status);
	public DocumentsPojo getdocpath(int id);
	public boolean updateStatus(int id, String status);
	public String getName(int id);
}
