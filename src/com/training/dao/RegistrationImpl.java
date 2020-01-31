package com.training.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.training.pojo.Registration;
import com.training.utility.MyConnection;

public class RegistrationImpl implements RegistrationIntf
{


	public boolean signup(Registration r) 
	{
		Connection conn=null;

		try
		{
			conn=MyConnection.getConnection();
			PreparedStatement ps= conn.prepareStatement("insert into student_registration(role,name,email,password,confirmpass,parents_email, branch)values(?,?,?,?,?,?,?)");
			ps.setString(1,r.getRole());
			ps.setString(2,r.getName());
			ps.setString(3,r.getEmail());
			ps.setString(4,r.getPassword());
			ps.setString(5,r.getConfirmpass());
			ps.setString(6,r.getParents_email());
			ps.setString(7, r.getBranch());
			
		    ps.executeUpdate();
			return true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return false;
	}

	
	public int Login(String role,String email, String password) 
	{
		Connection conn=null;
		  
		try
		{
			Registration reg=new Registration();
			conn=MyConnection.getConnection();
			System.out.println("email "+email+"password "+ password);
			System.out.println("hieeeeeeeeee");
			PreparedStatement ps=conn.prepareStatement("select * from student_registration where role=? and email=? and password=?");
			ps.setString(1,role );
			ps.setString(2,email);
			ps.setString(3, password);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			   {
				/*Registration r =new Registration();
				r.setBranch(rs.getString("branch"));
				r.setId(rs.getInt("id"));
				return r;*/
				int id = rs.getInt("id");
				return id;
			   }
			
			} catch (SQLException e) 
			{
				
				e.printStackTrace();
			}
				return 0;
			}

	
	public boolean addAlumini(Registration r) 
	{	
		
		// TODO Auto-generated method stub
		Connection conn=null;

		try
		{
			conn=MyConnection.getConnection();
			PreparedStatement ps= conn.prepareStatement("insert into Alumini_registration(role,name,email,password)values(?,?,?,?)");
			ps.setString(1,r.getRole());
			ps.setString(2,r.getName());
			ps.setString(3,r.getEmail());
			ps.setString(4,r.getPassword());
			
		    ps.executeUpdate();
			return true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}

	public int AluminiLogin(String role, String email, String password) 
	{
		// TODO Auto-generated method stub
		Connection conn=null;
		  
		try
		{
			Registration reg=new Registration();
			conn=MyConnection.getConnection();
			System.out.println("email "+email+"password "+ password);
			System.out.println("hieeeeeeeeee");
			PreparedStatement ps=conn.prepareStatement("select * from Alumini_registration where role=? and email=? and password=?");
			ps.setString(1,role);
			ps.setString(2,email );
			ps.setString(3,password);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			   {
				int id=rs.getInt("id");
				   return id;
			   }
			
			} catch (SQLException e) 
			{
				
				e.printStackTrace();
			}
				return 0;
			}

	
	public boolean addFaculty(Registration r) 
	{
		// TODO Auto-generated method stub

		Connection conn=null;

		try
		{
			conn=MyConnection.getConnection();
			PreparedStatement ps= conn.prepareStatement("insert into Faculty_registration(role,name,email,password, confirmpass)values(?,?,?,?,?)");
			ps.setString(1,r.getRole());
			ps.setString(2,r.getName());
			ps.setString(3,r.getEmail());
			ps.setString(4,r.getPassword());
			ps.setString(5,r.getConfirmpass());
		    ps.executeUpdate();
			return true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}

	
	public int FacultyLogin(String role, String email, String password) 
	{
		// TODO Auto-generated method stub
		Connection conn=null;
		  
		try
		{
			Registration reg=new Registration();
			conn=MyConnection.getConnection();
			System.out.println("email "+email+"password "+ password);
			System.out.println("hieeeeeeeeee");
			PreparedStatement ps=conn.prepareStatement("select * from Faculty_registration where role=? and email=? and password=?");
			ps.setString(1,role);
			ps.setString(2,email );
			ps.setString(3,password);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			   {
				  int id = rs.getInt("id");
				  return id;
			   }
			
			} catch (SQLException e) 
			{
				
				e.printStackTrace();
			}
				return 0;
			}


	public boolean addTpo(Registration r) {
		try
		{
			Connection conn=MyConnection.getConnection();
			PreparedStatement ps= conn.prepareStatement("insert into Tpo_registration(role,name,email,password)values(?,?,?,?)");
			ps.setString(1,r.getRole());
			ps.setString(2,r.getName());
			ps.setString(3,r.getEmail());
			ps.setString(4,r.getPassword());
			
		    ps.executeUpdate();
			return true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return false;
	}

	


	public boolean TpoLogin(String role, String email, String password) {
		Connection conn=null;
		  
		try
		{
			Registration reg=new Registration();
			conn=MyConnection.getConnection();
			System.out.println("email "+email+"password "+ password);
			System.out.println("hieeeeeeeeee");
			PreparedStatement ps=conn.prepareStatement("select * from Tpo_registration where role=? and email=? and password=?");
			ps.setString(1,role );
			ps.setString(2,email);
			ps.setString(3, password);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			   {
				   return true;
			   }
			
			} catch (SQLException e) 
			{
				
				e.printStackTrace();
			}
				return false;
			}

	



	public boolean checkEmail(String email) 
	{
		// TODO Auto-generated method stub
		try
		{
		Connection conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("select * from admin_registration,student_registration,Tpo_registration,faculty_registration,alumini_registration where email = ?");
		
		ps.setString(1, email);
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


	public boolean addAdmin(Registration r) {
		try
		{
			Connection conn=MyConnection.getConnection();
			PreparedStatement ps= conn.prepareStatement("insert into admin_registration(role,name,email,password)values(?,?,?,?)");
			ps.setString(1,r.getRole());
			ps.setString(2,r.getName());
			ps.setString(3,r.getEmail());
			ps.setString(4,r.getPassword());
			
		    ps.executeUpdate();
			return true;
		}
	
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return false;
	}




	public int AdminLogin(String role, String email, String password) {
		try
		{
			Registration reg=new Registration();
			Connection conn=MyConnection.getConnection();
			System.out.println("email "+email+"password "+ password);
			System.out.println("hieeeeeeeeee");
			PreparedStatement ps=conn.prepareStatement("select * from admin_registration where role=? and email=? and password=?");
			ps.setString(1,role );
			ps.setString(2,email);
			ps.setString(3, password);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			   {
				int id = rs.getInt("id");
				   return id;
			   }
			
			} catch (SQLException e) 
			{
				
				e.printStackTrace();
			}
				return 0;
	}


	public boolean checkAdminEmail(String email) {
		try
		{
		Connection conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("select * from admin_registration where email = ?");
		
		ps.setString(1, email);
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


	public boolean checkStudentEmail(String email) {
		try
		{
		Connection conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("select * from student_registration where email = ?");
		
		ps.setString(1, email);
	    ResultSet rs = ps.executeQuery();
	
	while(rs.next())
	{
		System.out.println("email is");
	return true;	
	}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return false;
	
	}


	public boolean checkFacultyEmail(String email) {
		try
		{
		Connection conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("select * from faculty_registration where email = ?");
		
		ps.setString(1, email);
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


	public boolean checkTPOEmail(String email) {
		try
		{
		Connection conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("select * from tpo_registration where email = ?");
		
		ps.setString(1, email);
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


	public boolean checkAluminiEmail(String email) {
		try
		{
		Connection conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("select * from alumini_registration where email = ?");
		
		ps.setString(1, email);
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


	public boolean checkResume(int id) {
		try
		{
		Connection conn = MyConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement("select resume_path from student_registration where id=?");
		
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


	public String checkemail(String email) {
		Connection conn = null;
		try
		{
			
			conn=MyConnection.getConnection();
			System.out.println("email "+email);
			
			PreparedStatement ps=conn.prepareStatement("SELECT password FROM student_registration where  email= ? UNION ALL SELECT password FROM faculty_registration WHERE email = ?UNION ALL SELECT password FROM admin_registration WHERE email = ? UNION ALL SELECT password FROM tpo_registration WHERE email = ? UNION ALL SELECT password FROM alumini_registration WHERE email = ?");
			ps.setString(1,email );
			ps.setString(2, email);
			ps.setString(3, email);
			ps.setString(4, email);
			ps.setString(5, email);
			ResultSet rs=ps.executeQuery();
			
			
			while(rs.next())
			   {
				
				String pass = rs.getString("password");
				System.out.println("id"+pass);
				return pass;
			   }
			if(rs.next()==false)
			{
				String msg = "no";
				return msg;
			}
			
			} catch (SQLException e) 
			{
				
				e.printStackTrace();
			}
				
		return null;
	}


	
}	
			
	

