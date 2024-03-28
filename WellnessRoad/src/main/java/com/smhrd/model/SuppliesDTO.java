package com.smhrd.model;

public class SuppliesDTO {
	
	//준비물 식별자
	private int supply_idx;
	//준비물 명
	private String supply_name;
	//준비물 상태
	private int supply_status;
	//여행 식별자
	private int trip_idx;
	
	public SuppliesDTO(int supply_idx, String supply_name, int supply_status, int trip_idx) {
		this.supply_idx = supply_idx;
		this.supply_name = supply_name;
		this.supply_status = supply_status;
		this.trip_idx = trip_idx;
	}

	
	
	//준비물 생성자
	public SuppliesDTO(String supply_name, int supply_status, int trip_idx) {
		this.supply_name = supply_name;
		this.supply_status = supply_status;
		this.trip_idx = trip_idx;
	}



	public int getSupply_idx() {
		return supply_idx;
	}



	public void setSupply_idx(int supply_idx) {
		this.supply_idx = supply_idx;
	}



	public String getSupply_name() {
		return supply_name;
	}



	public void setSupply_name(String supply_name) {
		this.supply_name = supply_name;
	}



	public int getSupply_status() {
		return supply_status;
	}



	public void setSupply_status(int supply_status) {
		this.supply_status = supply_status;
	}



	public int getTrip_idx() {
		return trip_idx;
	}



	public void setTrip_idx(int trip_idx) {
		this.trip_idx = trip_idx;
	}
	
	
	
	
	
	
	
	
}
