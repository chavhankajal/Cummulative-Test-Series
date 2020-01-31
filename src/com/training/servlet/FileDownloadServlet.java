package com.training.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.training.dao.StudentImpl;
import com.training.dao.StudentIntf;
import com.training.pojo.DocumentsPojo;

/**
 * Servlet implementation class FileDownloadServlet
 */
public class FileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int BUFSIZE = 4096;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileDownloadServlet() {
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
		
		
		String action = request.getParameter("action");
		System.out.println("action is:"+action);
		HttpSession session =request.getSession();
		
		
		if(action!=null && action.equalsIgnoreCase("getList"))
		{
			System.out.println("inside getlist");
			StudentIntf intf = new StudentImpl();
			List<DocumentsPojo> list = new ArrayList<DocumentsPojo>();
			list = intf.getList(1);
			
			session.setAttribute("list", list);
			response.sendRedirect("downloaddocuments.jsp");
			//new Gson().toJson(list, response.getWriter());
			
			
			
		}
		
		else
		
		{
			int id = Integer.parseInt(request.getParameter("id"));
			String filename = request.getParameter("filename");
			
			StudentIntf intf =new StudentImpl();
			DocumentsPojo dp = new DocumentsPojo();
			//int fileid =(Integer)id;
			dp = intf.getPath(id);
			
			//File path = new File(dp.getDocument_path());
			

			File downloadfile = new File(dp.getDocument_path());
			FileInputStream input = new FileInputStream(downloadfile);
			// String relativePath = getServletContext().getRealPath("");
			 ServletContext context = getServletContext();
			 String mimeType = context.getMimeType(dp.getDocument_path());
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

}
