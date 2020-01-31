package com.training.pojo;

public class StudentEducationPojo {
	
	private int id;
	private int student_id;
	private int profile_id;
	private String qual;
	private String year;
	private String university;
	@Override
	public String toString() {
		return "StudentEducationPojo [id=" + id + ", student_id=" + student_id
				+ ", profile_id=" + profile_id + ", qual=" + qual + ", year="
				+ year + ", university=" + university + ", perc=" + perc + "]";
	}
	private double perc;
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
	public int getProfile_id() {
		return profile_id;
	}
	public void setProfile_id(int profile_id) {
		this.profile_id = profile_id;
	}
	public String getQual() {
		return qual;
	}
	public void setQual(String qual) {
		this.qual = qual;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getUniversity() {
		return university;
	}
	public void setUniversity(String university) {
		this.university = university;
	}
	public double getPerc() {
		return perc;
	}
	public void setPerc(double perc) {
		this.perc = perc;
	}
	
	
	
	

}
