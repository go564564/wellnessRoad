package com.smhrd.model;

public class BoardCommentsDTO {
	
	private int cmt_inx;
	private int b_idx;
	private String cmt_content;
	private String created_at;
	private String mem_id;
	
	
	public BoardCommentsDTO(int cmt_inx, int b_idx, String cmt_content, String created_at, String mem_id) {
		this.cmt_inx = cmt_inx;
		this.b_idx = b_idx;
		this.cmt_content = cmt_content;
		this.created_at = created_at;
		this.mem_id = mem_id;
	}
	
	
	
	public BoardCommentsDTO(int b_idx, String cmt_content, String mem_id) {
		this.b_idx = b_idx;
		this.cmt_content = cmt_content;
		this.mem_id = mem_id;
	}



	public BoardCommentsDTO() {}

	public int getCmt_inx() {
		return cmt_inx;
	}


	public void setCmt_inx(int cmt_inx) {
		this.cmt_inx = cmt_inx;
	}


	public int getB_idx() {
		return b_idx;
	}


	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}


	public String getCmt_content() {
		return cmt_content;
	}


	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}


	public String getCreated_at() {
		return created_at;
	}


	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}


	public String getMem_id() {
		return mem_id;
	}


	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
}
