package com.campus.dto;

public class Orderitems {
	
	private int orderItemId;
    private int orderId;
    private int productId;
    private int orderQuantity;
    private double unitPrice;
    
	public int getOrderItemId() {
		return orderItemId;
	}
	public void setOrderItemId(int orderItemId) {
		this.orderItemId = orderItemId;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getOrderQuantity() {
		return orderQuantity;
	}
	public void setOrderQuantity(int orderQuantity) {
		this.orderQuantity = orderQuantity;
	}
	public double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	@Override
	public String toString() {
		return "Orderitems [orderItemId=" + orderItemId + ", orderId=" + orderId + ", productId=" + productId
				+ ", orderQuantity=" + orderQuantity + ", unitPrice=" + unitPrice + "]";
	}
    
	
    

}
