package com.company.Repository;

import com.company.modal.Order;
import java.util.List;

public interface OrderRepository {
    boolean insertOrder(Order order);
    Order getOrderById(int id);
    public List<Order> getAllOrdersByStatus(String status);
    List<Order> userOrders(int userId);
    void cancelOrder(int orderId);
}
