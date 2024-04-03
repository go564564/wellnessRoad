package com.smhrd.model;

public class InsPoiDTO {

	private int id;
	private int day;
	private String schedule;
	
	public InsPoiDTO(int id, int day, String schedule) {
		
		this.id = id;
		this.day = day;
		this.schedule = schedule;
	}
	
	public InsPoiDTO() {
		
	}
	
	
	
	public InsPoiDTO(int id, int day) {
		
		this.id = id;
		this.day = day;
	}

	public int getId() {
		return id;
	}

	public int getDay() {
		return day;
	}

	public String getSchedule() {
		return schedule;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}
	
	
	
	
	
	
	
}
