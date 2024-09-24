package com.company.modal;

public class AdminActivity {
	private int actId;
	private String actType;
	private String description;
	private String ActTime;
	private String status;
	
	public AdminActivity() {}
	public AdminActivity(int actId, String actType, String description, String ActTime, String status) {
		this.actId = actId;
		this.actType = actType;
		this.description = description;
		this.ActTime = ActTime;
		this.status = status;
	}
	public int getActId() {
		return actId;
	}
	public String getActType() {
		return actType;
	}
	public String getDescription() {
		return description;
	}
	public String getActTime() {
		return ActTime;
	}
	public String getStatus() {
		return status;
	}
	public void setActId(int actId) {
		this.actId = actId;
	}
	public void setActType(String actType) {
		this.actType = actType;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setActTime(String ActTime) {
		this.ActTime = ActTime;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
