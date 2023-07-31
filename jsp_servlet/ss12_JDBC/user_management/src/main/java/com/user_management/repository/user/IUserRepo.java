package com.user_management.repository.user;

import com.user_management.model.User;

import java.util.List;

public interface IUserRepo {
    List<User> findAll();

    void createUser(User user);

    User findId(int id);

    void updateUser(int id, User user);

    void deleteUser(int id);

    User search(String country);

    List<User> sort();
}
