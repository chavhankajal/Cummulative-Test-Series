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

import com.training.dao.StudentImpl;
import com.training.dao.StudentIntf;
import com.training.pojo.NotesPojo;

/**
 * Servlet implementation class DownloadNotes
 */
public class DownloadNotes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadNotes() {
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
		
		StudentIntf intf = new StudentImpl();
			
			System.out.println("inside download");
			int id = Integer.parseInt(request.getParameter("id"));
			NotesPojo np = new NotesPojo();
			np = intf.getNotePath(id);
			
			String filepath = np.getNotes_path();
			System.out.println("path is"+filepath);
			
			File downloadfile = new File(filepath);
			FileInputStream input = new FileInputStream(downloadfile);
			 ServletContext context = getServletContext();
			 String mimeType = context.getMimeType(filepath);
			 if (mimeType == null) {        
		           // set to binary type if MIME mapping not found
		           mimeType = "application/octet-stream";
		       }
			 response.setContentType(mimeType);
			 response.setContentLength((int) downloadfile.length());
			 String headerKey = "Content-Disposition";
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
