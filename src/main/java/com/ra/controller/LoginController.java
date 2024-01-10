package com.ra.controller;

import com.ra.model.Account;
import com.ra.repository.AccountRepository;
import com.ra.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Optional;

@Controller
@RequestMapping(value = "/loginController")
public class LoginController {
    @Autowired
    private AccountService accountService;
    @Autowired
    private AccountRepository accountRepository;
    @GetMapping(value = "/findAll")
    public ModelAndView loginView(){
        ModelAndView mav = new ModelAndView("/login");
        return mav;
    }
    @PostMapping(value = "/check")
    public String loginAdmin(String email,String password){

       Optional<Account> optionalAccount = accountRepository.findByEmailAndPassword(email,password);
        if (optionalAccount.isPresent()){
            return "redirect:/dashboardController/findAll";
        }
        return "error";
    }
}
