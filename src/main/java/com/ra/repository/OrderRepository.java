package com.ra.repository;

import com.ra.model.Order;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends JpaRepository<Order,String> {
    @Query("select o from Order o where o.orderId like %?1%")

    Page<Order> findAllByOrderId(String orderId, Pageable pageable);

    int countByOrderId(String orderId);

    @Query("select sum(b.total) from Order o join Bill b on o.orderId = b.order.orderId where o.status = 'received' and DAY(current_date) = DAY(o.created)")
    float getRevenueDay();

    @Query("select sum(b.total) from Order o join Bill b on o.orderId = b.order.orderId where o.status = 'received' and MONTH (current_date) = MONTH (o.created)")
    float getRevenueMonth();

    @Query("select sum(b.total) from Order o join Bill b on o.orderId = b.order.orderId where o.status = 'received' and year (current_date) = year (o.created)")
    float getRevenueYear();
}
