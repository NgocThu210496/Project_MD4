package com.ra.serviceImp;

import com.ra.repository.ImageRepository;
import com.ra.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.awt.*;
import java.util.ArrayList;
import java.util.List;

@Service
public class ImageServiceImp implements ImageService {
    @Autowired
    private ImageRepository imageRepository;

    @Override
    public List<Image> displayData(String id, int page, int size, String direction, String sortBy) {
        Pageable pageable = PageRequest.of(page,size,
                direction.equals("ASC")? Sort.Direction.ASC: Sort.Direction.DESC,sortBy);
        System.out.println(id);
        List<Image> imageList = imageRepository.findByProduct_ProductId(id,pageable).getContent();
        System.out.println(id);
        System.out.println(imageList);
        return imageList;
    }

    @Override
    public List<Integer> getListPage(String id, int size) {
        int count = imageRepository.countByProduct_ProductId(id);
        List<Integer> listPage = new ArrayList<>();
        for (int i = 0; i < (int) Math.ceil((double) count / (double) size); i++) {
            listPage.add(i+1);
        }
        return listPage;
    }

    @Override
    public Image findById(int id) {
        return imageRepository.findById(id).get();
    }

    @Override
    public boolean delete(int id) {
        try {
            imageRepository.deleteById(id);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean save(Image image) {
        try {
            imageRepository.save(image);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public Image findByProduct_ProductId(String productId) {
        return imageRepository.findByProduct_ProductId(productId);
    }
}
