package com.ra.serviceImp;

import com.ra.model.Bill;
import com.ra.repository.BillRepository;
import com.ra.service.BillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.data.domain.Pageable;

import java.util.ArrayList;
import java.util.List;

@Service
public class BillServiceImp implements BillService {
    @Autowired

    private BillRepository billRepository;
    @Override

    public Page<Bill> displayData(String productId, int page, int size, String direction, String sortBy) {
        Pageable pageable = PageRequest.of(page,size,
                direction.equals("ASC")? Sort.Direction.ASC: Sort.Direction.DESC,sortBy);

       // List<Bill> billList;
        Page<Bill> billList = billRepository.findByProductId(productId,pageable);


        return billList;
    }

    @Override
    public List<Integer> getListPage(String productId, int size) {
        int count = billRepository.countByProductProductId(productId);
        List<Integer> listPage = new ArrayList<>();
        for (int i = 0; i < (int) Math.ceil((double) count / (double) size); i++) {
            listPage.add(i+1);
        }
        return listPage;
    }

    @Override
    public Bill findById(int id) {
        return billRepository.findById(id).get();
    }

    @Override
    public List<Bill> findAll() {
        return billRepository.findAllBy();
    }
}
