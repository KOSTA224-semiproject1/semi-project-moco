package org.kosta.moco.model;

public class LanguageVO {
	private int language_code;
	private String language;
	
	public LanguageVO() {
		super();
	}
	public LanguageVO(int language_code, String language) {
		super();
		this.language_code = language_code;
		this.language = language;
	}
	public int getLanguage_code() {
		return language_code;
	}
	public void setLanguage_code(int language_code) {
		this.language_code = language_code;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	@Override
	public String toString() {
		return "LanguageVO [language_code=" + language_code + ", language=" + language + "]";
	}
}