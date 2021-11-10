package org.kosta.moco.model;

public class NicknameVO {
	private boolean isDuplicate;

	public NicknameVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NicknameVO(boolean isDuplicate) {
		super();
		this.isDuplicate = isDuplicate;
	}

	public boolean isDuplicate() {
		return isDuplicate;
	}

	public void setDuplicate(boolean isDuplicate) {
		this.isDuplicate = isDuplicate;
	}

	@Override
	public String toString() {
		return "NicknameVO [isDuplicate=" + isDuplicate + "]";
	}
	
	
}
