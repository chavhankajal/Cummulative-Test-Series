package com.training.pojo;

public class FacultyPojo 
{
	private int id;
	private int question_id;
	private String branch;
	private String subject;
	private String quetion;
	private String options;
	private int correct_answer;
	private String question_alphabets;
	private String level;
	
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public int getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getQuetion() {
		return quetion;
	}
	public void setQuetion(String quetion) {
		this.quetion = quetion;
	}
	public String getOptions() {
		return options;
	}
	public void setOptions(String options) {
		this.options = options;
	}
	public int getCorrect_answer() {
		return correct_answer;
	}
	public void setCorrect_answer(int correct_answer) {
		this.correct_answer = correct_answer;
	}
	public String getQuestion_alphabets() {
		return question_alphabets;
	}
	public void setQuestion_alphabets(String question_alphabets) {
		this.question_alphabets = question_alphabets;
	}
	
	
}
