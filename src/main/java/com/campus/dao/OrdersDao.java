package com.campus.dao;

import java.util.List;
import com.campus.dto.Orders;

public interface OrdersDao {
	void addOrders(Orders o);

    void updateOrders(Orders o);

    void deleteOrders(int orderId);

    Orders getOrdersById(int orderId);

    List<Orders> getAllOrderItems();
}
