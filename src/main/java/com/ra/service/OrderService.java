package com.ra.service;

import com.ra.model.Order;

import java.util.List;

public interface OrderService {
    List<Order> displayData(String orderId, int page, int size, String direction, String sortBy);

    List<Integer> getListPage(String orderId, int size);

    Order findById(String id);


    List<Order> findAll();
    float getRevenueDay();
    float getRevenueMonth();
    float getRevenueYear();
}
