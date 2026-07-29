package com.campus.dao;

import java.util.List;
import com.campus.dto.Orders;
import com.campus.dto.SellersOrders;

public interface OrdersDao {
	
	int addOrders(Orders o);

    void updateOrders(Orders o);

    void deleteOrders(int orderId);

    Orders getOrdersById(int orderId);


    List<Orders> getAllOrders();
    
    List<SellersOrders> getSellerOrders(int sellerId);
    
    void updateOrderStatus(int orderId, String status);
    
    boolean canReview(int userId, int productId);
    
    boolean alreadyReviewed(int userId, int productId);
}

