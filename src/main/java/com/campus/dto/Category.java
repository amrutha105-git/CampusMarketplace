package com.campus.dto;

public class Category {
	private Integer category_id;
	private String cname;
	
	public Integer getCategory_id() {
		return category_id;
	}
	public void setCategory_id(Integer category_id) {
		this.category_id = category_id;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	@Override
	public String toString() {
		return "Category [category_id=" + category_id + ", cname=" + cname + "]";
	}
	

}
