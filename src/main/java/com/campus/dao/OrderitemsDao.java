package com.campus.dao;

import java.util.List;

import com.campus.dto.Orderitems;

public interface OrderitemsDao {
	
	void addOrderItem(Orderitems o);

    void updateOrderItem(Orderitems o);

    void deleteOrderItem(int orderItemId);

    Orderitems getOrderItemById(int orderItemId);

    List<Orderitems> getAllOrderItems();

}
