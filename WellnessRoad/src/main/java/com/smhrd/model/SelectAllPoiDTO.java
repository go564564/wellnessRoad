package com.smhrd.model;

public class SelectAllPoiDTO {
	
	int sche_day;
	String poi_name;
	String poi_url;
	
	public SelectAllPoiDTO(int sche_day, String poi_name, String poi_url) {
		this.sche_day = sche_day;
		this.poi_name = poi_name;
		this.poi_url = poi_url;
	}

	public int getSche_day() {
		return sche_day;
	}

	public String getPoi_name() {
		return poi_name;
	}

	public String getPoi_url() {
		return poi_url;
	}

	public void setSche_day(int sche_day) {
		this.sche_day = sche_day;
	}

	public void setPoi_name(String poi_name) {
		this.poi_name = poi_name;
	}

	public void setPoi_url(String poi_url) {
		this.poi_url = poi_url;
	}
	
	
	
	
	
}
