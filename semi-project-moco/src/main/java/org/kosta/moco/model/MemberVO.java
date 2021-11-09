package org.kosta.moco.model;

import java.io.Serializable;

public class MemberVO implements Serializable {
	private static final long serialVersionUID = -2388103345617605810L;
	private String email;
	private String password;
	private String nickname;
	private int thumbs;
	private String github;

	public MemberVO() {
		super();
	}
	
	
	public MemberVO(String email, String nickname, String github) {
		super();
		this.email = email;
		this.nickname = nickname;
		this.github = github;
	}
	
	public MemberVO(String email, String password, String nickname, String github) {
		super();
		this.email = email;
		this.password = password;
		this.nickname = nickname;
		this.github = github;
	}

	public MemberVO(String email, String password, String nickname, int thumbs, String github) {
		super();
		this.email = email;
		this.password = password;
		this.nickname = nickname;
		this.thumbs = thumbs;
		this.github = github;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getThumbs() {
		return thumbs;
	}

	public void setThumbs(int thumbs) {
		this.thumbs = thumbs;
	}

	public String getGithub() {
		return github;
	}

	public void setGithub(String github) {
		this.github = github;
	}

	@Override
	public String toString() {
		return "MemberVO [email=" + email + ", password=" + password + ", nickname=" + nickname + ", thumbs=" + thumbs
				+ ", github=" + github + "]";
	}
}