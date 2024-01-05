package com.ra.repository;

import com.ra.model.Categories;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface CategoriesRepository extends JpaRepository<Categories,String> {
    @Query("select c from Categories c where c.catalogName like %?1%")
    Page<Categories> findByCatalogName(String catalogName, Pageable pageable);
    int countByCatalogNameContains(String catalogName);
    List<Categories> findAllBy();
}
