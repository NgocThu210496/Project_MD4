package com.ra.controller;

import com.ra.model.Account;
import com.ra.model.Order;
import com.ra.model.Product;
import com.ra.service.AccountService;
import com.ra.service.CategoriesService;
import com.ra.service.OrderService;
import com.ra.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

@Controller
@RequestMapping(value = "/dashboardController")
public class DashboardController {
    @Autowired
    private AccountService accountService;
    @Autowired
    private ProductService productService;
    @Autowired
    private CategoriesService categoriesService;
    @Autowired
    private OrderService orderService;

    @GetMapping(value = "/findAll")
    public ModelAndView findAll() {
        ModelAndView mav = new ModelAndView("dashboard");
        List<Account> accountList = accountService.findAll();
        List<Account> activeCount = accountService.findFalse();
        List<Account> inActiveCount = accountService.findTrue();
        List<Product> productList = productService.findAll();
        List<Product> activeProduct = productService.findTrue();
        List<Product> inActiveProduct = productService.findFalse();
        List<Order> orderList = orderService.findAll();
        AtomicInteger waiting = new AtomicInteger();
        AtomicInteger shipping = new AtomicInteger();
        AtomicInteger received = new AtomicInteger();
        AtomicInteger approve = new AtomicInteger();
        AtomicInteger cancel = new AtomicInteger();
        orderList.stream().forEach(x -> {
            if (x.getStatus().equals("waiting")) {
                waiting.getAndIncrement();
            }
            if (x.getStatus().equals("shipping")) {
                shipping.getAndIncrement();
            }
            if (x.getStatus().equals("received")) {
                received.getAndIncrement();
            }
            if (x.getStatus().equals("cancel")) {
                cancel.getAndIncrement();
            }
            if (x.getStatus().equals("approve")) {
                approve.getAndIncrement();
            }
        });
        float revenueDay = orderService.getRevenueDay();
        float revenueMonth = orderService.getRevenueMonth();
        float revenueYear = orderService.getRevenueYear();

        mav.addObject("accountList", accountList);
        mav.addObject("activeCount", activeCount);
        mav.addObject("inActiveCount", inActiveCount);
        mav.addObject("productList", productList);
        mav.addObject("activeProduct", activeProduct);
        mav.addObject("inActiveProduct", inActiveProduct);
        mav.addObject("orderList", orderList);
        mav.addObject("waiting", waiting);
        mav.addObject("shipping", shipping);
        mav.addObject("received", received);
        mav.addObject("cancel", cancel);
        mav.addObject("approve", approve);
        mav.addObject("revenueDay", revenueDay);
        mav.addObject("revenueMonth", revenueMonth);
        mav.addObject("revenueYear", revenueYear);
        return mav;
    }
}
