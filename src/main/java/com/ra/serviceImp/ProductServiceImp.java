package com.ra.serviceImp;

import com.ra.model.Product;
import com.ra.repository.ProductRepository;
import com.ra.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProductServiceImp implements ProductService {
    @Autowired
    private ProductRepository productRepository;
    @Override
    public List<Product> displayData(String name, int page, int size, String direction, String sortBy) {
        Pageable pageable = PageRequest.of(page,size,
                direction.equals("ASC")? Sort.Direction.ASC: Sort.Direction.DESC,sortBy);
        List<Product> productList = productRepository.findByProductName(name,pageable).getContent();
        return productList;
    }

    @Override
    public List<Integer> getListPage(String name, int size) {
        int count = productRepository.countByProductNameContains(name);
        List<Integer> listPage = new ArrayList<>();
        for (int i = 0; i < (int) Math.ceil((double) count / (double) size); i++) {
            listPage.add(i+1);
        }
        return listPage;
    }

    @Override
    public Product findById(String id) {
        return productRepository.findById(id).get();
    }
    @Transactional
    @Override
    public Product saveOrUpdate(Product product) {
        try {
            return productRepository.save(product);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean delete(String id) {
        try {
            productRepository.deleteById(id);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public List<Product> findFalse() {
        return productRepository.findAccountByStatusFalse();
    }

    @Override
    public List<Product> findTrue() {
        return productRepository.findAccountByStatusTrue();
    }
}
