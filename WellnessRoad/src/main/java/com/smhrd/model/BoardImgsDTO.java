package com.smhrd.model;

public class BoardImgsDTO {

	//보드 이미지DTO
	private int file_idx;
	private String mem_id;
	private String file_name;
	private String uploaded_at;
	
	
	public BoardImgsDTO(int file_idx, String mem_id, String file_name, String uploaded_at) {
		super();
		this.file_idx = file_idx;
		this.mem_id = mem_id;
		this.file_name = file_name;
		this.uploaded_at = uploaded_at;
	}
	
	public BoardImgsDTO() {}

	public int getFile_idx() {
		return file_idx;
	}

	public void setFile_idx(int file_idx) {
		this.file_idx = file_idx;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getUploaded_at() {
		return uploaded_at;
	}

	public void setUploaded_at(String uploaded_at) {
		this.uploaded_at = uploaded_at;
	}
	
}
