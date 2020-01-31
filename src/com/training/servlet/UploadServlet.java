package com.training.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class UploadServlet
 */
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadServlet() {
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
	
		
		System.out.println("pooja");
		
		
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	    
		if (isMultipart) {
			DiskFileItemFactory diskFactory = new DiskFileItemFactory();
			
	        
			diskFactory.setSizeThreshold(4000);
			diskFactory.setRepository(new File(System.getProperty("java.io.tmpdir")));
			ServletFileUpload uploadHandler = new ServletFileUpload(diskFactory);
			  try {
		           
	            	System.out.println("upload"+uploadHandler);
	            	
	            	List<FileItem> items = uploadHandler.parseRequest(request);
	            	@SuppressWarnings("rawtypes")
					Iterator iterator = items.iterator();
	            	  while (iterator.hasNext()) {
		                	
		                	System.out.println("iterator"+iterator);
		                	 FileItem item = (FileItem) iterator.next();
			                    if (item.isFormField()) {
			                    	
			                    	 String name = item.getFieldName();
			                    	 System.out.println("name"+name);
			                         String value = item.getString();
			                    	System.out.println("jshdj"+value);
			                    	
			                    }
			                    
			           
		
		}
			  }
			  catch (FileUploadException e) {
	                e.printStackTrace();
			  }
		}
	}
}

