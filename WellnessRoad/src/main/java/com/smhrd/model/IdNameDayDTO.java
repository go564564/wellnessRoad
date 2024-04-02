package com.smhrd.model;

public class IdNameDayDTO {
	private int trip_idx;
	private String trip_name;
	private String st_dt;
	private String ed_dt;
	
	public IdNameDayDTO(int trip_idx, String trip_name, String st_dt, String ed_dt) {		
		this.trip_idx = trip_idx;
		this.trip_name = trip_name;
		this.st_dt = st_dt;
		this.ed_dt = ed_dt;
	}

	public int getTrip_idx() {
		return trip_idx;
	}

	public String getTrip_name() {
		return trip_name;
	}

	public String getSt_dt() {
		return st_dt;
	}

	public String getEd_dt() {
		return ed_dt;
	}

	public void setTrip_idx(int trip_idx) {
		this.trip_idx = trip_idx;
	}

	public void setTrip_name(String trip_name) {
		this.trip_name = trip_name;
	}

	public void setSt_dt(String st_dt) {
		this.st_dt = st_dt;
	}

	public void setEd_dt(String ed_dt) {
		this.ed_dt = ed_dt;
	}
	
	
	
	
	
	
	
}
