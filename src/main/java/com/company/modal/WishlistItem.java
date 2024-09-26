package com.company.modal;

public class WishlistItem extends Product{
	private int userId;
	private int WLqantity;
	
	public int getUserId() {
		return userId;
	}
	public int getWLqantity() {
		return WLqantity;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public void setWLqantity(int wLqantity) {
		WLqantity = wLqantity;
	}
}
