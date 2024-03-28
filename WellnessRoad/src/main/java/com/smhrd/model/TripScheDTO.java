package com.smhrd.model;

public class TripScheDTO {

	private int trip_idx;
	private int sche_day;
	private String trip_sche;

	public TripScheDTO(int trip_idx, int sche_day, String trip_sche) {

		this.trip_idx = trip_idx;
		this.sche_day = sche_day;
		this.trip_sche = trip_sche;
	}



	 public TripScheDTO(){
		
	}




	public int getTrip_idx() {
		return trip_idx;
	}



	public void setTrip_idx(int trip_idx) {
		this.trip_idx = trip_idx;
	}



	public int getSche_day() {
		return sche_day;
	}



	public void setSche_day(int sche_day) {
		this.sche_day = sche_day;
	}



	public String getTrip_sche() {
		return trip_sche;
	}



	public void setTrip_sche(String trip_sche) {
		this.trip_sche = trip_sche;
	}
	

	
}


