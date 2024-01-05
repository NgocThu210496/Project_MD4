package com.ra.service;

import com.ra.model.Bill;
import org.springframework.data.domain.Page;

import java.util.List;

public interface BillService {
    Page<Bill> displayData(String billId, int page, int size, String direction, String sortBy);

    List<Integer> getListPage(String billId, int size);

    Bill findById(int id);


    List<Bill> findAll();
}
