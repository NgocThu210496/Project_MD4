package com.ra.service;

import com.ra.model.Categories;

import java.util.List;

public interface CategoriesService {
    List<Categories> displayData(String catalogName, int page, int size, String direction, String sortBy);

    List<Integer> getListPage(String catalogName, int size);

    Categories findById(String id);

    boolean saveOrUpdate(Categories categories);

    boolean delete(String id);
    List<Categories> findAll();

}
