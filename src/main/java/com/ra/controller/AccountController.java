package com.ra.controller;

import com.ra.model.Account;
import com.ra.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping( "/accountController")
public class AccountController {
    @Autowired
    private AccountService accountService;

    private static final int SIZE = 5;
    private static String nameDefault = "";
    private static String directionDefault = "ASC";
    private static String sortByDefault = "email";
    private static int pageDefault = 1;

    @GetMapping("/findAll")
    public ModelAndView displayCategories(Optional<String> email, Optional<Integer> page,
                                          Optional<String> direction, Optional<String> sortBy,
                                          Optional<Integer> open, Optional<Integer> block) {
        ModelAndView mav = new ModelAndView("account");
        nameDefault=email.orElse(nameDefault);
        directionDefault=direction.orElse(directionDefault);
        sortByDefault=sortBy.orElse(sortByDefault);
        pageDefault=page.orElse(pageDefault);
        open.ifPresent(x->
        {
            accountService.openAccount(x);
        });
        block.ifPresent(x->{
            accountService.blockAccount(x);
        });

        //Lấy dữ liệu hiển thị
        List<Account> accountList = accountService.displayData(nameDefault,pageDefault-1,SIZE,
                directionDefault,sortByDefault);
        //Lấy ra danh sách các trang theo kết quả tìm kiếm
        List<Integer> listPages = accountService.getListPage(nameDefault,SIZE);
        mav.addObject("accountList",accountList);
        mav.addObject("listPages",listPages);
        mav.addObject("catalogName",nameDefault);
        mav.addObject("sortBy",sortByDefault);
        mav.addObject("direction",directionDefault);
        mav.addObject("page",pageDefault);

        return mav;
    }
}
