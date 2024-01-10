package com.ra.repository;

import com.ra.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ProductRepository extends JpaRepository<Product,String> {
    @Query("select p from Product p where p.productName like %?1%")
    Page<Product> findByProductName(String name, Pageable pageable);
    int countByProductNameContains(String name);
   /* @Query("select p from Product p where p.status = false ")
    List<Product> findAccountByStatusFalse();
    @Query("select p from Product p where p.status = true")

    List<Product> findAccountByStatusTrue();*/
    List<Product> findAllByStatus(boolean status);
}
