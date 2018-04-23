package com.lyf.service;

import com.lyf.pojos.Account;

import java.util.List;

/**
 * Created by fangjiejie on 2018/4/15.
 */
public interface AccountService {
    public Account login(Account account);
    public void register(Account account);
    public List<Account> getAccountList();
    public void AccountDelete(int aid);
    public Account getAccountById(int aid);
    public void updateAccount(Account account);
}
