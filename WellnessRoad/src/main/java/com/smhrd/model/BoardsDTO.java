package com.smhrd.model;

public class BoardsDTO {
	private int b_idx;
	private String b_title;
	private String b_content;
	private String created_at;
	private int b_views;
	private int b_likes;
	private String mem_id;
	private int poi_idx;
	
	
	
	//게시판 DTO 
	public BoardsDTO(int b_idx, String b_title, String b_content, String created_at, int b_views, int b_likes,
			String mem_id, int poi_idx) {
		this.b_idx = b_idx;
		this.b_title = b_title;
		this.b_content = b_content;
		this.created_at = created_at;
		this.b_views = b_views;
		this.b_likes = b_likes;
		this.mem_id = mem_id;
		this.poi_idx = poi_idx;
	}

	public BoardsDTO(int b_idx, int b_views) {
		this.b_idx = b_idx;
		this.b_views = b_views;
	}
	
	//default DTO
	public BoardsDTO(){
		
	}

	public int getB_idx() {
		return b_idx;
	}



	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}



	public String getB_title() {
		return b_title;
	}



	public void setB_title(String b_title) {
		this.b_title = b_title;
	}



	public String getB_content() {
		return b_content;
	}



	public void setB_content(String b_content) {
		this.b_content = b_content;
	}



	public String getCreated_at() {
		return created_at;
	}



	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}



	public int getB_views() {
		return b_views;
	}



	public void setB_views(int b_views) {
		this.b_views = b_views;
	}



	public int getB_likes() {
		return b_likes;
	}



	public void setB_likes(int b_likes) {
		this.b_likes = b_likes;
	}



	public String getMem_id() {
		return mem_id;
	}



	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}



	public int getPoi_idx() {
		return poi_idx;
	}



	public void setPoi_idx(int poi_idx) {
		this.poi_idx = poi_idx;
	}
	
	
	
	
}
