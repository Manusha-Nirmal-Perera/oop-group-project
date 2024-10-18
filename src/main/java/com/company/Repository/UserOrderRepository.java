package com.company.Repository;

public interface UserOrderRepository {
    boolean userAcceptOrder(int orderId);
    boolean userRejectOrder(int orderId, String msg);
    int getUserOrderCount(int userId);
}
