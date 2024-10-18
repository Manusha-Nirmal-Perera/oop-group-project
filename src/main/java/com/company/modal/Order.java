package com.company.modal;


public class Order extends Product{
	private int orderId;
	private int uid;
	private int qunatity;
	private String date;
	private String status;
	private String msg;
	
	public Order() {
	}
	
	public Order(int orderId, int uid, int qunatity, String date) {
		super();
		this.orderId = orderId;
		this.uid = uid;
		this.qunatity = qunatity;
		this.date = date;
	}

//	public Order(int uid, int qunatity, String date) {
//		super();
//		this.uid = uid;
//		this.qunatity = qunatity;
//		this.date = date;
//	}

	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getQunatity() {
		return qunatity;
	}
	public void setQunatity(int qunatity) {
		this.qunatity = qunatity;
	}
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
}

