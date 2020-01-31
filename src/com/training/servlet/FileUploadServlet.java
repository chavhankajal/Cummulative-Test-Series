package com.training.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.io.FileNotFoundException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.taglibs.standard.extra.spath.AbsolutePath;


import com.training.dao.StudentImpl;
import com.training.dao.StudentIntf;
import com.training.pojo.AluminiPojo;
import com.training.pojo.DocumentsPojo;
import com.training.utility.Constant;

/**
 * Servlet implementation class AlumniServlet
 */

@MultipartConfig
public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "C:\\trainingandplacement\\TrainingandPlacement\\WebContent\\documents";
	//private static final String SAVE_DIR= "C:\\pooja\\apache-tomcat-8.0.35\\webapps\\portal_content\\img";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileUploadServlet() 
    {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		doPost(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		HttpSession session=request.getSession(); 
		
		
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			
			StudentIntf inf=new StudentImpl();
			DocumentsPojo ap = new DocumentsPojo();
			String company="";
			int id = (Integer)session.getAttribute("id");
			System.out.println("id"+id);
			ap.setId(id);
		
			if (isMultipart) 
			{
	        
				
				System.out.println("pooja"+isMultipart);
				DiskFileItemFactory diskFactory = new DiskFileItemFactory();

				diskFactory.setSizeThreshold(4000);
				diskFactory.setRepository(new File(System.getProperty("java.io.tmpdir")));
				ServletFileUpload uploadHandler = new ServletFileUpload(diskFactory);
	 
	            try 
	            {
	           
	            	System.out.println("upload"+uploadHandler);
	            	List<FileItem> items = uploadHandler.parseRequest(request);
	            
	            	@SuppressWarnings("rawtypes")
					Iterator iterator = items.iterator();
	            	List<String> list = new ArrayList<String>();
 	                while (iterator.hasNext()) 
	                {
	                	
	                	System.out.println("iterator"+iterator);
	                    FileItem item = (FileItem) iterator.next();
	                 
	                   
	                    String name1="";
	                    String newname="";
	                    
	                    if(item.isFormField())
	                    {
	                   
	                    	
	                    String fieldname = item.getFieldName();
	                    
	                     if(fieldname.equals("name"))
	                    {
	                    	
	                    	
	                    	 ap.setDocument_name(item.getString());
	                    	System.out.println("pooja"+item.getString());
	                    
	                    }
	                    }
	                    
	                    
	                    if (!item.isFormField()) 
	                    {
	                    name1= new File(item.getName()).getName();
	                    System.out.println("name11"+name1);
	                    System.out.println("new "+ap.getDocument_name());
	                    
	                    String nname = ap.getDocument_name();
	                    
	                    String filename[] = name1.split("\\.");
	                    int index = filename.length-1;
	                    newname = nname + "." +filename[index];
	                    System.out.println("new name:"+newname);
	                    ap.setDocument_name(newname);
	                    String appPath = request.getServletContext().getRealPath("");
	                    System.out.println("appp"+appPath);
	                    //String savePath = appPath + File.separator + SAVE_DIR;

	                    //System.out.println("absolute path"+getAbsolutePath());
                        //save to folder in eclipse
                       //item.write( new File(SAVE_DIR + File.separator + newname));
                 item.write( new File(Constant.UPLOAD_DIRECTORY + File.separator + newname));

                        ap.setDocument_path(Constant.UPLOAD_DIRECTORY + File.separator + newname);
                        System.out.println("filepath"+ap.getDocument_path());
                       // ap.setDocument_web_path(SAVE_DIR + File.separator + newname);
                   
	                    }
	                    
	              
	            }
 	                
 	               boolean res = inf.addDocuments(ap);
 	                System.out.println("result is"+res);
 	                
	                }
	                
	            
	            catch (FileUploadException e)
	            {
	                e.printStackTrace();
	            } 
	            catch (Exception e) 
	            {
	                e.printStackTrace();
	            }
			}
			
			

		
	}
}
	
	


