package com.ra.controller;

import com.ra.model.Order;
import com.ra.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping( "/orderController")
public class OrderController {
    @Autowired
    private OrderService orderService;

    private static final int SIZE = 5;
    private static String nameDefault ="";
    private static String directionDefault = "ASC";
    private static String sortByDefault = "created";
    private static int pageDefault = 1;

    @GetMapping("/findAll")
    public ModelAndView displayCategories( Optional<String> orderId, Optional<Integer> page,
                                           Optional<String> direction, Optional<String> sortBy) {
        ModelAndView mav = new ModelAndView("order");
        nameDefault=orderId.orElse(nameDefault);
        directionDefault=direction.orElse(directionDefault);
        sortByDefault=sortBy.orElse(sortByDefault);
        pageDefault=page.orElse(pageDefault);

        //Lấy dữ liệu hiển thị
        List<Order> orderList = orderService.displayData(nameDefault,pageDefault-1,SIZE,
                directionDefault,sortByDefault);
        //Lấy ra danh sách các trang theo kết quả tìm kiếm
        List<Integer> listPages = orderService.getListPage(nameDefault,SIZE);
        mav.addObject("orderList",orderList);
        mav.addObject("listPages",listPages);
        mav.addObject("orderId",nameDefault);
        mav.addObject("sortBy",sortByDefault);
        mav.addObject("direction",directionDefault);
        mav.addObject("page",pageDefault);
        return mav;
    }

}
