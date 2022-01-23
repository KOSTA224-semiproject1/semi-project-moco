package org.kosta.moco.model;

public class RankVO {

	private String grade;
	private String min_thumbs;
	private String max_thumbs;

	public RankVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getMin_thumbs() {
		return min_thumbs;
	}

	public void setMin_thumbs(String min_thumbs) {
		this.min_thumbs = min_thumbs;
	}

	public String getMax_thumbs() {
		return max_thumbs;
	}

	public void setMax_thumbs(String max_thumbs) {
		this.max_thumbs = max_thumbs;
	}

	public RankVO(String grade, String min_thumbs, String max_thumbs) {
		super();
		this.grade = grade;
		this.min_thumbs = min_thumbs;
		this.max_thumbs = max_thumbs;
	}

	public RankVO(String grade) {
		super();
		this.grade = grade;
	}
	
	
}
