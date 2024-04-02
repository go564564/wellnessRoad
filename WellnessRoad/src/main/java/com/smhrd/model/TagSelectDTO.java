package com.smhrd.model;

public class TagSelectDTO {

	private int num;
	private String tag;
	
	public TagSelectDTO(int num, String tag) {		
		this.num = num;
		this.tag = tag;
	}

	public int getNum() {
		return num;
	}

	public String getTag() {
		return tag;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}
	
	
	
	
	
	
}
