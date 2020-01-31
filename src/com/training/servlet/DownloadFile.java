package com.training.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.training.dao.FacultyImpl;
import com.training.dao.FacultyIntf;
import com.training.pojo.AluminiPojo;

/**
 * Servlet implementation class DownloadFile
 */
public class DownloadFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadFile() {
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
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				String action = request.getParameter("action");
				System.out.println("action is:"+action);
				HttpSession session =request.getSession();
				
				
			
				
			
				
				
					int id = Integer.parseInt(request.getParameter("id"));
				System.out.println("id"+id);
					
					FacultyIntf intf =new FacultyImpl();
					AluminiPojo ap = new AluminiPojo();
					//int fileid =(Integer)id;
					String filepath= intf.getPath(id);
					
					//File path = new File(dp.getDocument_path());
					
		           System.out.println("filepath"+filepath);
					File downloadfile = new File(filepath);
					FileInputStream input = new FileInputStream(downloadfile);
					// String relativePath = getServletContext().getRealPath("");
					 ServletContext context = getServletContext();
					 String mimeType = context.getMimeType(filepath);
					 if (mimeType == null) {        
				           // set to binary type if MIME mapping not found
				           mimeType = "application/octet-stream";
				       }
					 response.setContentType(mimeType);
					 response.setContentLength((int) downloadfile.length());
					 String headerKey = "Content-Disposition";
				       System.out.println("download file name:"+downloadfile.getName());
				       String headerValue = String.format("attachment; filename=\"%s\"", downloadfile.getName());
				       response.setHeader(headerKey, headerValue);
				       OutputStream outStream = response.getOutputStream();
				        
				       byte[] buffer = new byte[4096];
				       int bytesRead;
				       while ((bytesRead = input.read(buffer)) != -1) {
				           outStream.write(buffer, 0, bytesRead);
				       }
				        
				       input.close();
				       outStream.close();
				}

	}


