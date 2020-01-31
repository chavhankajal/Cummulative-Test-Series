package com.training.pojo;

public class DocumentsPojo {
	
	
	private int id;
	private int student_id;
	private String document_name;
	private String document_path;
	private String document_web_path;
	
	public String getDocument_web_path() {
		return document_web_path;
	}
	public void setDocument_web_path(String document_web_path) {
		this.document_web_path = document_web_path;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStudent_id() {
		return student_id;
	}
	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}
	public String getDocument_name() {
		return document_name;
	}
	public void setDocument_name(String document_name) {
		this.document_name = document_name;
	}
	public String getDocument_path() {
		return document_path;
	}
	public void setDocument_path(String document_path) {
		this.document_path = document_path;
	}
	
	

}
