package com.ra.repository;

import com.ra.model.Image;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


@Repository
public interface ImageRepository extends JpaRepository<Image,Integer> {
    @Query("select i from Image i where i.product.productId like %?1%")
    Page<Image> findByProduct_ProductId(String id, Pageable pageable);

    int countByProduct_ProductId(String id);
    Image findByProduct_ProductId(String productId);
}
