package com.example.service.account;

import com.example.model.account.Account;



import java.util.Map;

public interface IAccountService {

    Map<String, Account> getAll();

    Account login(String user, String password);

    Account checkAccount(String userName);

    void signUp(String userName, String password, String email);

    Account findById(int id);

    void editAccount(int id, Account account);

    void createAcction(Account account);

    Account findByName(String userName);

    void deleteAccount(int id, boolean b);
    Map<String, Account> getAllByEmail();

    void resetPassWord(int id, String newPassWord);

    Account findByEmail(String email);
}
