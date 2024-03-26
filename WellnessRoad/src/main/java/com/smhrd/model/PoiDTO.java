package com.smhrd.model;

public class PoiDTO {
	private int idx;
	private String name;
	private String addr;
	private double lat;
	private double lng;
	private String info;
	private String closeDay;
	private String available;
	private String parking;
	private String tag;
	private String imgUrl;
	
	public PoiDTO(int idx, String name, String addr, double lat, double lng, String info, String closeDay,
			String available, String parking, String tag, String imgUrl) {		
		this.idx = idx;
		this.name = name;
		this.addr = addr;
		this.lat = lat;
		this.lng = lng;
		this.info = info;
		this.closeDay = closeDay;
		this.available = available;
		this.parking = parking;
		this.tag = tag;
		this.imgUrl = imgUrl;
	}	
	
	public PoiDTO() {
		
	}
	
	
	public int getIdx() {
		return idx;
	}

	public String getName() {
		return name;
	}

	public String getAddr() {
		return addr;
	}

	public double getLat() {
		return lat;
	}

	public double getLng() {
		return lng;
	}

	public String getInfo() {
		return info;
	}

	public String getCloseDay() {
		return closeDay;
	}

	public String getAvailable() {
		return available;
	}

	public String getParking() {
		return parking;
	}

	public String getTag() {
		return tag;
	}

	public String getImgUrl() {
		return imgUrl;
	}
	
	
	

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public void setCloseDay(String closeDay) {
		this.closeDay = closeDay;
	}

	public void setAvailable(String available) {
		this.available = available;
	}

	public void setParking(String parking) {
		this.parking = parking;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	
	
	
	
	
}


