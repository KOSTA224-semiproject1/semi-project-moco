package org.kosta.moco.model;

public class PostVO {
	private int post_no;
	private String post_title;
	private String post_content;
	private String post_code;
	private String post_regdate;
	private int hits;
	private String email;
	private int language_code;
	public PostVO() {
		super();
	}
	public PostVO(int post_no, String post_title, String post_content, String post_code, String post_regdate, int hits,
			String email, int language_code) {
		super();
		this.post_no = post_no;
		this.post_title = post_title;
		this.post_content = post_content;
		this.post_code = post_code;
		this.post_regdate = post_regdate;
		this.hits = hits;
		this.email = email;
		this.language_code = language_code;
	}
	public int getPost_no() {
		return post_no;
	}
	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}
	public String getPost_title() {
		return post_title;
	}
	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}
	public String getPost_content() {
		return post_content;
	}
	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}
	public String getPost_code() {
		return post_code;
	}
	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}
	public String getPost_regdate() {
		return post_regdate;
	}
	public void setPost_regdate(String post_regdate) {
		this.post_regdate = post_regdate;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getLanguage_code() {
		return language_code;
	}
	public void setLanguage_code(int language_code) {
		this.language_code = language_code;
	}
	@Override
	public String toString() {
		return "PostVO [post_no=" + post_no + ", post_title=" + post_title + ", post_content=" + post_content
				+ ", post_code=" + post_code + ", post_regdate=" + post_regdate + ", hits=" + hits + ", email=" + email
				+ ", language_code=" + language_code + "]";
	}
}