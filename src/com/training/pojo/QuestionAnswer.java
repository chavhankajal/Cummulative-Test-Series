package com.training.pojo;

public class QuestionAnswer {
	
	private String question;
	private String correct;
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getCorrect() {
		return correct;
	}
	public void setCorrect(String correct) {
		this.correct = correct;
	}
	@Override
	public String toString() {
		return "QuestionAnswer [question=" + question + ", correct=" + correct
				+ "]";
	}
	
	
	
	

}
