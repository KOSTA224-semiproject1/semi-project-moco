package org.kosta.moco.model;

public class ScrapVO {
	private int scrap_no;

	public ScrapVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getScrap_no() {
		return scrap_no;
	}

	public void setScrap_no(int scrap_no) {
		this.scrap_no = scrap_no;
	}

	public ScrapVO(int scrap_no) {
		super();
		this.scrap_no = scrap_no;
	}

	@Override
	public String toString() {
		return "ScrapVO [scrap_no=" + scrap_no + "]";
	}
	

}
