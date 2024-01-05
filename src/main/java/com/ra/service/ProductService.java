package com.ra.service;

import com.ra.model.Product;

import java.util.List;

public interface ProductService {
    List<Product> displayData(String name, int page, int size, String direction, String sortBy);

    List<Integer> getListPage(String name, int size);

    Product findById(String id);

    Product saveOrUpdate(Product product);

    boolean delete(String id);
    List<Product> findAll();
    List<Product> findFalse();
    List<Product> findTrue();
}
