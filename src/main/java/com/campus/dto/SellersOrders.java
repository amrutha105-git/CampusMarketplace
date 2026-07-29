package com.campus.dto;

public class SellersOrders {
	
	private Integer orderId;
    private Integer productId;
    private String productName;
    private Integer quantity;
    private Double unitPrice;
    private String buyerName;
    private String orderStatus;
    private String orderedAt;
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getBuyerName() {
		return buyerName;
	}
	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getOrderedAt() {
		return orderedAt;
	}
	public void setOrderedAt(String orderedAt) {
		this.orderedAt = orderedAt;
	}
	@Override
	public String toString() {
		return "SellersOrders [orderId=" + orderId + ", productId=" + productId + ", productName=" + productName
				+ ", quantity=" + quantity + ", unitPrice=" + unitPrice + ", buyerName=" + buyerName + ", orderStatus="
				+ orderStatus + ", orderedAt=" + orderedAt + "]";
	}
    
    


}
