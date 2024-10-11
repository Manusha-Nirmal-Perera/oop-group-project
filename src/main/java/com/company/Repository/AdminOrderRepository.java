package com.company.Repository;

public interface AdminOrderRepository {
    boolean adminDeliverOrder(int orderId);
    boolean adminCancelOrder(int orderId);
}
