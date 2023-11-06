package com.example.repository.account;

import com.example.model.account.Account;

import java.util.Map;

public interface IAccountRepository {
    Map<String, Account> getAll();

    Account login(String user, String password);

    Account checkAccount(String userName);

    void insertAccount(String userName, String password, String email);

    Account findById(int id);

    void editAccount(int id, Account account);

    void createAccount(Account account);

    Account findByName(String userName);

    void deleteAccount(int id, boolean b);
    Map<String, Account> getAllByEmail();

    void resetPassWord(int id, String newPassWord);

    Account findByEmail(String email);
}
