package com.ra.service;

import com.ra.model.Account;

import java.util.List;

public interface AccountService {
    List<Account> displayData(String email, int page, int size, String direction, String sortBy);

    List<Integer> getListPage(String email, int size);

    Account findById(int email);
    Account checkEmail(String email);
    Account checkPassword(String password);

    Account save(Account account);
    List<Account> findAll();
    List<Account> findFalse();
    List<Account> findTrue();
    void openAccount(int accountId);
    void blockAccount(int accountId);
}
