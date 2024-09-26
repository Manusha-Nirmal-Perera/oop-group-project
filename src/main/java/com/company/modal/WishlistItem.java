package com.company.modal;

public class WishlistItem extends Product{
	private int recordId;
	private int userId;
	private int wLquantity;
	
	public int getRecordId() {
		return recordId;
	}
	public int getUserId() {
		return userId;
	}
	public int getWLquantity() {
		return wLquantity;
	}
	
	public void setRecordId(int recordId) {
		this.recordId = recordId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public void setWLquantity(int wLquantity) {
		this.wLquantity = wLquantity;
	}
}
