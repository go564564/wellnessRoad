package com.smhrd.model;

public class BoardsImgDTO {
	
	private int file_idx;
	private String mem_id;
	private String file_name;
	private String file_ext;
	private String uploaded_at;
	
	
	public BoardsImgDTO(int file_idx, String mem_id, String file_name, String file_ext,
			String uploaded_at) {
		this.file_idx = file_idx;
		this.mem_id = mem_id;
		this.file_name = file_name;
		this.file_ext = file_ext;
		this.uploaded_at = uploaded_at;
	}
	
	public BoardsImgDTO() {}

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

	public String getFile_ext() {
		return file_ext;
	}


	public void setFile_ext(String file_ext) {
		this.file_ext = file_ext;
	}


	public String getUploaded_at() {
		return uploaded_at;
	}


	public void setUploaded_at(String uploaded_at) {
		this.uploaded_at = uploaded_at;
	}
	
	
	
}
