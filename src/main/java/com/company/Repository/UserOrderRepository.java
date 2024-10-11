package com.company.Repository;

public interface UserOrderRepository {
    boolean userAcceptOrder(int orderId);
    boolean userRejectOrder(int orderId);
    int getUserOrderCount(int userId);
}
