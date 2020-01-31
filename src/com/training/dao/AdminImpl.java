package com.training.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



import java.util.ArrayList;
import java.util.List;

import com.training.pojo.DocumentsPojo;
import com.training.pojo.NotesPojo;
import com.training.pojo.StudentPojo;
import com.training.utility.MyConnection;

public class AdminImpl implements AdminIntf {

	public boolean addNotes(NotesPojo np) {
		// TODO Auto-generated method stub
		
		try
		{
		Connection conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("insert into notes_table (notes_name, notes_path, type) values(?,?,?)");
		ps.setString(1, np.getNotes_name());
		ps.setString(2, np.getNotes_path());
		ps.setString(3, np.getType());
		
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

	public List<StudentPojo> getStudentName() {
		List<StudentPojo> student=new ArrayList<StudentPojo>();
		try
		{
		Connection conn=MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("select * from student_registration");
		
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			StudentPojo sp = new StudentPojo();
			
			
			sp.setName(rs.getString("name"));
			sp.setId(rs.getInt("id"));
			student.add(sp);
			
		}
		return student;
		
		
	}
		catch(Exception e)
		{
			
		}
		return null;
	}

	public StudentPojo getAllStudentsRecords(String name) {
Connection conn=null;
		
		try {
			
			System.out.println("name is"+name);
			conn=MyConnection.getConnection();
			PreparedStatement ps=conn.prepareStatement("select * from student_registration where name=?");
			
			ps.setString(1, name);
			
			ResultSet rs=ps.executeQuery();
			List<StudentPojo> studentList=new ArrayList<StudentPojo>();

			while(rs.next())
			{
				StudentPojo studentPojo=new StudentPojo();
				
				studentPojo.setId(rs.getInt("id"));
				studentPojo.setName(name);
				
				return studentPojo;
			}
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return null;
	}

	public List<DocumentsPojo> getPath(int id, String status) {
		System.out.println("ppp"+status);
		List<DocumentsPojo> list = new ArrayList<DocumentsPojo>();
		try
		{
		Connection conn=MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("select id,document_name,document_path from document_table where student_id=? and doc_status!=?");
		ps.setInt(1, id);
		ps.setString(2, status);
		ResultSet rs = ps.executeQuery();
		
		
		while(rs.next())
		{
			DocumentsPojo dp = new DocumentsPojo();
			
			dp.setId(rs.getInt("id"));
			System.out.println(dp.getId());
			dp.setDocument_name(rs.getString("document_name"));
			dp.setDocument_path(rs.getString("document_path"));
			/*System.out.println("name is"+name);
			System.out.println("path is:"+path);*/
		
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

	public DocumentsPojo getdocpath(int id) {
		try
		{
		Connection conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("select * from document_table where id=?");
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

	public boolean updateStatus(int id, String status) {
		try
		{
		Connection conn = MyConnection.getConnection();
		PreparedStatement ps =conn.prepareStatement("update document_table set doc_status=? where id=?");
		
		ps.setString(1, status);
		ps.setInt(2, id);
		
		
		ps.executeUpdate();
		
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

	public String getName(int id) {
		try
		{
		Connection conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("select name from admin_registration where id=?");
		
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
	
	

}
