package com.campus.dao;

import java.util.List;
import com.campus.dto.Orders;

public interface OrdersDao {
	
	int addOrders(Orders o);

    void updateOrders(Orders o);

    void deleteOrders(int orderId);

    Orders getOrdersById(int orderId);

<<<<<<< Updated upstream
    List<Orders> getAllOrders();
}
=======
    List<Orders> getAllOrderItems();
}
>>>>>>> Stashed changes
