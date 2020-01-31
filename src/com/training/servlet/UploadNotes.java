package com.training.servlet;



import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
















import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;

import com.training.dao.AdminImpl;
import com.training.dao.AdminIntf;
import com.training.pojo.NotesPojo;
import com.training.utility.Constant;
;


/**
 * Servlet implementation class FileUploadServlet
 */


public class UploadNotes extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//private final String UPLOAD_DIRECTORY = "C:/tmp";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadNotes() {
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
		
		
	

			System.out.println("inside uploadfile");
			//int stdid = Integer.parseInt(request.getParameter("id"));
			//System.out.println("stdid"+stdid);
			
			
			
			
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
	                    if (!item.isFormField()) {
	                       
	                        
	                        String filename = new File(item.getName()).getName();
	                        System.out.println("file"+filename);
	                        String path = Constant.UPLOAD_NOTES + File.separator + filename;
	                        item.write( new File(Constant.UPLOAD_NOTES + File.separator + filename));
	                        String type="";
	                        if(filename.endsWith("txt")|| filename.endsWith("TXT"))
	                        {
	                        	type="document";
;	                        }
	                        else if(filename.endsWith("mp4")||filename.endsWith("MP4"))
	                        {
	                        	type="video";
	                        }
	                        
	                        else if(filename.endsWith("pdf")||filename.endsWith("PDF"))
	                        {
	                        	type="pdf";
	                        }
	                        else if(filename.endsWith("jpg")||filename.endsWith("JPG"))
	                        {
	                        	type="image";
	                        }
	                        else if(filename.endsWith("png")||filename.endsWith("PNG"))
	                        {
	                        	type="image";
	                        }
	                        else if(filename.endsWith("jpeg")||filename.endsWith("JPEG"))
	                        {
	                        	type="image";
	                        }
	                        else 
	                        {
	                        	type="document";
	                        }
		        			
	                        AdminIntf intf = new AdminImpl();
	                        NotesPojo np = new NotesPojo();
	                        np.setNotes_name(filename);
	                        np.setNotes_path(path);
	                        np.setType(type);
	                       boolean res =  intf.addNotes(np);
 	                      
	                        if(res)
	                        {
	                        	PrintWriter out = response.getWriter();
	                        	out.write("true");
	                        }
	                        
	                       
	                    }
	                }	
	            } catch (FileUploadException e) {
	                e.printStackTrace();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
			
			
			
			
			
			
			}
			
			
	
			
			
	}	
			
			
			
	}	
			
			
			
	


