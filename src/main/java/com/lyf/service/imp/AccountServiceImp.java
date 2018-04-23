package com.lyf.service.imp;

import com.lyf.dao.GenericHibernateDAO;
import com.lyf.pojos.Account;
import com.lyf.service.AccountService;
import org.hibernate.Query;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by fangjiejie on 2018/4/15.
 */
@Service("accountService")
public class AccountServiceImp extends GenericHibernateDAO implements AccountService{

    @Override
    public Account login(Account account) {
        Query query=this.createQuery("from Account account where account.username=:username and account.password=:password");
        query.setString("username",account.getUsername());
        query.setString("password",account.getPassword());
//        query.setInteger("state",1);
        List<Account> list=query.list();
        if(list.size()!=0){
            return list.get(0);
        }else{
            return null;
        }
    }

    @Override
    public List<Account> getAccountList() {
        Query query=this.createQuery("from Account");
        List<Account> list=query.list();
        return list;
    }

    @Override
    public void AccountDelete(int aid) {
        this.deleteByIds(Account.class,aid);
    }

    @Override
    public Account getAccountById(int aid) {
        Account account=(Account) this.getObjById(Account.class,aid);
        return account;
    }

    @Override
    public void updateAccount(Account account) {
        this.update(account);
    }

    @Override
    public void register(Account account) {
        this.save(account);
    }
}
