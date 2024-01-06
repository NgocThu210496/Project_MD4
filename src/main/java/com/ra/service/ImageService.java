package com.ra.service;


import com.ra.model.Image;

import java.util.List;

public interface ImageService {
    List<Image> displayData(String id, int page, int size, String direction, String sortBy);

    List<Integer> getListPage(String id, int size);

    Image findById(int id);
    boolean delete(int id);
    boolean save(Image image );
    Image findByProduct_ProductId(String productId);
}
