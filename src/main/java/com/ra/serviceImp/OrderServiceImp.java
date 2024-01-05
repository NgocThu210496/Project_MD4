package com.ra.serviceImp;

import com.ra.model.Order;
import com.ra.repository.OrderRepository;
import com.ra.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class OrderServiceImp implements OrderService {
    @Autowired
    private OrderRepository orderRepository;
    @Override
    public List<Order> displayData(String orderId, int page, int size, String direction, String sortBy) {
        Pageable pageable = PageRequest.of(page,size,direction.equals("ASC") ? Sort.by(sortBy).ascending() : Sort.by(sortBy).descending());
        List<Order> orderList;
        if(orderId.isEmpty()) {
           orderList = orderRepository.findAll(pageable).getContent();
        } else {
            orderList = orderRepository.findAllByOrderId(orderId,pageable).getContent();
        }

        return orderList;
    }

    @Override
    public List<Integer> getListPage(String orderId, int size) {
        int count = orderRepository.countByOrderId(orderId);
        List<Integer> listPage = new ArrayList<>();
        for (int i = 0; i < (int) Math.ceil((double) count / (double) size); i++) {
            listPage.add(i+1);
        }
        return listPage;
    }

    @Override
    public Order findById(String orderId) {
        return orderRepository.findById(orderId).get();
    }

    @Override
    public List<Order> findAll() {
        return orderRepository.findAll();
    }

    @Override
    public float getRevenueDay() {
        return orderRepository.getRevenueDay();
    }

    @Override
    public float getRevenueMonth() {
        return orderRepository.getRevenueMonth();
    }

    @Override
    public float getRevenueYear() {
        return orderRepository.getRevenueYear();
    }
}
