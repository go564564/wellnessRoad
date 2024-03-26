package com.smhrd.model;

public class TripsDTO {

	//여행 식별자
	private int trip_idx;
	//여행 명
	private String trip_name;
	//회원 아이디
	private String mem_id;
	//여행 시작 일
	private String st_dt;
	//여행 종료 일
	private String ed_dt;
	
	public TripsDTO(int trip_idx, String trip_name, String mem_id, String st_dt, String ed_dt) {
		this.trip_idx = trip_idx;
		this.trip_name = trip_name;
		this.mem_id = mem_id;
		this.st_dt = st_dt;
		this.ed_dt = ed_dt;
	}
	
	public TripsDTO(String trip_name, String mem_id, String st_dt, String ed_dt) {
	    this.trip_name = trip_name;
		this.mem_id = mem_id;
		this.st_dt = st_dt;
		this.ed_dt = ed_dt;
	}
	
	
	
	

	public int getTrip_idx() {
		return trip_idx;
	}

	public void setTrip_idx(int trip_idx) {
		this.trip_idx = trip_idx;
	}

	public String getTrip_name() {
		return trip_name;
	}

	public void setTrip_name(String trip_name) {
		this.trip_name = trip_name;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getSt_dt() {
		return st_dt;
	}

	public void setSt_dt(String st_dt) {
		this.st_dt = st_dt;
	}

	public String getEd_dt() {
		return ed_dt;
	}

	public void setEd_dt(String ed_dt) {
		this.ed_dt = ed_dt;
	}
	
	
}
