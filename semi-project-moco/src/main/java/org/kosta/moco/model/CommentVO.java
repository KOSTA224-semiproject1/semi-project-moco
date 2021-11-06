package org.kosta.moco.model;

public class CommentVO {
	private int comment_no;
	private String comment_content;
	private String comment_regdate;
	private String email;
	private int post_no;
	public CommentVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommentVO(int comment_no, String comment_content, String comment_regdate, String email, int post_no) {
		super();
		this.comment_no = comment_no;
		this.comment_content = comment_content;
		this.comment_regdate = comment_regdate;
		this.email = email;
		this.post_no = post_no;
	}
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public String getComment_regdate() {
		return comment_regdate;
	}
	public void setComment_regdate(String comment_regdate) {
		this.comment_regdate = comment_regdate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPost_no() {
		return post_no;
	}
	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}
	@Override
	public String toString() {
		return "CommentVO [comment_no=" + comment_no + ", comment_content=" + comment_content + ", comment_regdate="
				+ comment_regdate + ", email=" + email + ", post_no=" + post_no + "]";
	}
}
/*
comment_no number primary key,
comment_content clob not null,
comment_regdate date not null,
email varchar2(100) not null,
post_no number not null,
*/