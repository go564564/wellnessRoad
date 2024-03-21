package com.smhrd.model;

public class MembersDTO {

	// 회원 아이디 
    private String mem_id;

    // 회원 비밀번호 
    private String mem_pw;

    // 회원 닉네임 
    private String mem_nick;

    // 회원 성별 
    private String mem_gender;

    // 회원 생년월일 
    private String mem_birthdate;

    // 회원 이메일 
    private String mem_email;

    // 회원 전화번호 
    private String mem_phone;

    // 회원 가입일자 
    private String joined_at;

    
    
    // 회원 생성자
	public MembersDTO(String mem_id, String mem_pw, String mem_nick, String mem_gender, String mem_birthdate,
			String mem_email, String mem_phone, String joined_at) {
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_nick = mem_nick;
		this.mem_gender = mem_gender;
		this.mem_birthdate = mem_birthdate;
		this.mem_email = mem_email;
		this.mem_phone = mem_phone;
		this.joined_at = joined_at;
	}

	
	
	
	
	
	
	//============ 회원 Getter/Setter ============
	
	
	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public String getMem_nick() {
		return mem_nick;
	}

	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}

	public String getMem_gender() {
		return mem_gender;
	}

	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}

	public String getMem_birthdate() {
		return mem_birthdate;
	}

	public void setMem_birthdate(String mem_birthdate) {
		this.mem_birthdate = mem_birthdate;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getMem_phone() {
		return mem_phone;
	}

	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}

	public String getJoined_at() {
		return joined_at;
	}

	public void setJoined_at(String joined_at) {
		this.joined_at = joined_at;
	}

}
