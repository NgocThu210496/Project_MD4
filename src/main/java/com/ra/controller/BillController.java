package com.ra.controller;

import com.ra.model.Bill;
import com.ra.service.BillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping( "/billController")
public class BillController {
    @Autowired
    private BillService billService;

    private static final int SIZE = 5;
    private static String nameDefault = "";
    private static String directionDefault = "ASC";
    private static String sortByDefault = "orderId";
    private static int pageDefault = 1;

    @GetMapping("/findAll")
    public ModelAndView displayCategories(Optional<String> productId, Optional<Integer> page,
                                          Optional<String> direction, Optional<String> sortBy) {
        ModelAndView mav = new ModelAndView("bill");
        nameDefault = productId.orElse(nameDefault);
        directionDefault = direction.orElse(directionDefault);
        sortByDefault = sortBy.orElse(sortByDefault);
        pageDefault = page.orElse(pageDefault);

        //Lấy dữ liệu hiển thị
        Page<Bill> billList = billService.displayData(nameDefault, pageDefault - 1, SIZE,
                directionDefault, sortByDefault);
        //Lấy ra danh sách các trang theo kết quả tìm kiếm
        List<Integer> listPages = billService.getListPage(nameDefault, SIZE);
        mav.addObject("billList", billList);
        mav.addObject("listPages", listPages);
        mav.addObject("productId", nameDefault);
        mav.addObject("sortBy", sortByDefault);
        mav.addObject("direction", directionDefault);
        mav.addObject("page", pageDefault);

        return mav;
    }
}
