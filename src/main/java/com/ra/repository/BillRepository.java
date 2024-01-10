package com.ra.repository;


import com.ra.model.Bill;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


import java.util.List;

@Repository
public interface BillRepository extends JpaRepository<Bill,Integer> {
    Page<Bill> findAllByProductProductId(String productId, Pageable pageable);
    int countByProductProductId(String productId);
    List<Bill> findAllBy();

    List<Bill> findAllByOrder_OrderId(String orderId);
}
