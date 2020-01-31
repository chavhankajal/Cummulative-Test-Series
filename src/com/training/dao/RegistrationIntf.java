package com.training.dao;

import com.training.pojo.Registration;



public interface RegistrationIntf 
{
	
	
	public boolean signup(Registration r);
	public int Login(String role,String email, String password);

	
	public boolean addAlumini(Registration r);
	public int AluminiLogin(String role,String email, String password);
	
	public boolean addFaculty(Registration r);
	public int FacultyLogin(String role,String email,String password);
	
	public boolean addTpo(Registration r);
	public boolean TpoLogin(String role,String email,String password);
	
	public boolean checkEmail(String email);
	public boolean checkAdminEmail(String email);
	public boolean checkStudentEmail(String email);
	public boolean checkFacultyEmail(String email);
	public boolean checkTPOEmail(String email);
	public boolean checkAluminiEmail(String email);
	
	public boolean addAdmin(Registration r);
	public int AdminLogin(String role,String email, String password);
	public boolean checkResume(int id);
	public String checkemail(String email);
	
}

