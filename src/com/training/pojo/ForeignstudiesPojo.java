package com.training.pojo;

public class ForeignstudiesPojo 
{
	private int id;
	private String country;
	private double GRE_Score;
	private int std_id;
	private String year_of_admission;
	//private String documents;
	
	private String admission_letter;
	public int getStd_id() {
		return std_id;
	}
	public void setStd_id(int std_id) {
		this.std_id = std_id;
	}
	public String getAdmission_letter() {
		return admission_letter;
	}
	public void setAdmission_letter(String admission_letter) {
		this.admission_letter = admission_letter;
	}
	private int documents;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public double getGRE_Score() {
		return GRE_Score;
	}
	public void setGRE_Score(double gRE_Score) {
		GRE_Score = gRE_Score;
	}
	/*public String getAddmission_letter_card() {
		return addmission_letter_card;
	}
	public void setAddmission_letter_card(String addmission_letter_card) {
		this.addmission_letter_card = addmission_letter_card;
	}*/
	public String getYear_of_admission() {
		return year_of_admission;
	}
	public void setYear_of_admission(String year_of_admission) {
		this.year_of_admission = year_of_admission;
	}
	public int getDocuments() {
		return documents;
	}
	public void setDocuments(int documents) {
		this.documents = documents;
	}
	
	
}
