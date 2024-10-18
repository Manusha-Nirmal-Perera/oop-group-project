package com.company.Repository;

import com.company.modal.Order;
import java.util.List;

public interface OrderRepository {
    boolean insertOrder(Order order);
    Order getOrderById(int id);
    List<Order> getAllOrders();
    List<Order> userOrders(int userId);
    void cancelOrder(int orderId);
}
