package com.ra.serviceImp;

import com.ra.model.Account;
import com.ra.repository.AccountRepository;
import com.ra.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
public class AccountServiceImp implements AccountService {
    @Autowired
    private AccountRepository accountRepository;
    @Override
    public List<Account> displayData(String email, int page, int size, String direction, String sortBy) {
        Pageable pageable = PageRequest.of(page,size,
                direction.equals("ASC")? Sort.Direction.ASC: Sort.Direction.DESC,sortBy);
        List<Account> accountList = accountRepository.findByEmail(email,pageable).getContent();
        return accountList;
    }

    @Override
    public List<Integer> getListPage(String email, int size) {
        int count = accountRepository.countByEmailContains(email);
        List<Integer> listPage = new ArrayList<>();
        for (int i = 0; i < (int) Math.ceil((double) count / (double) size); i++) {
            listPage.add(i+1);
        }
        return listPage;
    }

    @Override
    public Account findById(int email) {
        return accountRepository.findById(email).get();
    }

    @Override
    public Account checkEmail(String email) {
        return accountRepository.checkEmail(email);
    }

    @Override
    public Account checkPassword(String password) {
        return accountRepository.checkPassword(password);
    }

    @Override
    public Account save(Account account) {
        return null;
    }

    @Override
    public List<Account> findAll() {
        return accountRepository.findAll();
    }

    @Override
    public List<Account> findFalse() {
        return accountRepository.findAccountByStatusFalse();
    }

    @Override
    public List<Account> findTrue() {
        return accountRepository.findAccountByStatusTrue();
    }

    @Override
    public void openAccount(int accountId) {
        accountRepository.updateAccountStatus(accountId);
    }

    @Override
    public void blockAccount(int accountId) {
        accountRepository.blockAccount(accountId);
    }
}
