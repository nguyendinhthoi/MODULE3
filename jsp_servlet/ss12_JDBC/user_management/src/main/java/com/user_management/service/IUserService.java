package com.user_management.service;

import com.user_management.model.User;

import java.util.List;

public interface IUserService {
    List<User> findAll();

    void createUser(User user);

    User findId(int id);

    void updateUser(int id, User user);

    void deleteUser(int id);

    User search(String country);

    List<User> sort();
}
