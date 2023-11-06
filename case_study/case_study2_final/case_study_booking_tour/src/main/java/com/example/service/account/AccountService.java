package com.example.service.account;

import com.example.repository.account.IAccountRepository;
import com.example.repository.account.AccountRepository;
import com.example.model.account.Account;

import java.util.Map;

public class AccountService implements IAccountService {

    IAccountRepository repository = new AccountRepository();

    @Override
    public Map<String, Account> getAll() {
        return repository.getAll();
    }

    @Override
    public Account login(String user, String password) {
        return repository.login(user,password);
    }

    @Override
    public Account checkAccount(String userName) {
        return repository.checkAccount(userName);
    }

    @Override
    public void signUp(String userName, String password, String email) {
        repository.insertAccount(userName,password,email);
    }

    @Override
    public Account findById(int id) {
        return repository.findById(id);
    }

    @Override
    public void editAccount(int id, Account account) {
        repository.editAccount(id, account);
    }

    @Override
    public void createAcction(Account account) {
        repository.createAccount(account);
    }

    @Override
    public Account findByName(String userName) {
        return repository.findByName(userName);
    }

    @Override
    public void deleteAccount(int id, boolean b) {
        repository.deleteAccount(id, b);
    }

    @Override
    public Map<String, Account> getAllByEmail() {
        return repository.getAllByEmail();
    }

    @Override
    public void resetPassWord(int id, String newPassWord) {
        repository.resetPassWord(id,newPassWord);
    }

    @Override
    public Account findByEmail(String email) {
        return repository.findByEmail(email);
    }
}
