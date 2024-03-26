package com.smhrd.model;

public class PoiDTO {
	private int poi_idx;
	private String poi_name;
	private String poi_addr;
	private double poi_lat;
	private double poi_lng;
	private String poi_info;
	private String poi_closeDay;
	private String poi_available;
	private String poi_parking;
	private String poi_region;
	private String poi_tag;
	private String poi_img;
	
	public PoiDTO(int poi_idx, String poi_name, String poi_addr, double poi_lat, double poi_lng, String poi_info,
			String poi_closeDay, String poi_available, String poi_parking, String poi_region, String poi_tag,
			String poi_img) {
		this.poi_idx = poi_idx;
		this.poi_name = poi_name;
		this.poi_addr = poi_addr;
		this.poi_lat = poi_lat;
		this.poi_lng = poi_lng;
		this.poi_info = poi_info;
		this.poi_closeDay = poi_closeDay;
		this.poi_available = poi_available;
		this.poi_parking = poi_parking;
		this.poi_region = poi_region;
		this.poi_tag = poi_tag;
		this.poi_img = poi_img;
	}
	
	public PoiDTO() {
		
	}

	public int getPoi_idx() {
		return poi_idx;
	}

	public String getPoi_name() {
		return poi_name;
	}

	public String getPoi_addr() {
		return poi_addr;
	}

	public double getPoi_lat() {
		return poi_lat;
	}

	public double getPoi_lng() {
		return poi_lng;
	}

	public String getPoi_info() {
		return poi_info;
	}

	public String getPoi_closeDay() {
		return poi_closeDay;
	}

	public String getPoi_available() {
		return poi_available;
	}

	public String getPoi_parking() {
		return poi_parking;
	}

	public String getPoi_region() {
		return poi_region;
	}

	public String getPoi_tag() {
		return poi_tag;
	}

	public String getPoi_img() {
		return poi_img;
	}

	public void setPoi_idx(int poi_idx) {
		this.poi_idx = poi_idx;
	}

	public void setPoi_name(String poi_name) {
		this.poi_name = poi_name;
	}

	public void setPoi_addr(String poi_addr) {
		this.poi_addr = poi_addr;
	}

	public void setPoi_lat(double poi_lat) {
		this.poi_lat = poi_lat;
	}

	public void setPoi_lng(double poi_lng) {
		this.poi_lng = poi_lng;
	}

	public void setPoi_info(String poi_info) {
		this.poi_info = poi_info;
	}

	public void setPoi_closeDay(String poi_closeDay) {
		this.poi_closeDay = poi_closeDay;
	}

	public void setPoi_available(String poi_available) {
		this.poi_available = poi_available;
	}

	public void setPoi_parking(String poi_parking) {
		this.poi_parking = poi_parking;
	}

	public void setPoi_region(String poi_region) {
		this.poi_region = poi_region;
	}

	public void setPoi_tag(String poi_tag) {
		this.poi_tag = poi_tag;
	}

	public void setPoi_img(String poi_img) {
		this.poi_img = poi_img;
	}
	
	
	
	
	
	
	
	
	
}



