package com.campus.dto;

public class Orders {
	 private int order_id ;
	private double total_amount; 
	private String order_status;  
	private String ordered_at;
	private double gst;
	public int getOrder_id() {
		return order_id;
		
	}
	public double getGst() {
		return gst;
	}
	public void setGst(double gst) {
		this.gst = gst;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public double getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(double total_amount) {
		this.total_amount = total_amount;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public String getOrdered_at() {
		return ordered_at;
	}
	public void setOrdered_at(String ordered_at) {
		this.ordered_at = ordered_at;
	}
	@Override
	public String toString() {
		return "Orders [order_id=" + order_id + ", total_amount=" + total_amount + ", order_status=" + order_status
				+ ", ordered_at=" + ordered_at + ", gst=" + gst + "]";
	}

	} 

