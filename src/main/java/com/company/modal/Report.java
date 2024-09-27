package com.company.modal;

public class Report {
	private int rid;
	private int uid;
	private String type;
	private String messege;
	private String date;
	private String status;
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getRid() {
		return rid;
	}
	public int getUid() {
		return uid;
	}
	public String getType() {
		return type;
	}
	public String getMessege() {
		return messege;
	}
	public String getDate() {
		return date;
	}
	
	public void setRid(int rid) {
		this.rid = rid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public void setType(String type) {
		this.type = type;
	}
	public void setMessege(String messege) {
		this.messege = messege;
	}
	public void setDate(String date) {
		this.date = date;
	}
}
