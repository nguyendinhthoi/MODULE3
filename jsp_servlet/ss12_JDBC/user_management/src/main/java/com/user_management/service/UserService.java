package com.user_management.service;

import com.user_management.model.User;
import com.user_management.repository.user.IUserRepo;
import com.user_management.repository.user.UserRepo;

import java.util.List;

public class UserService implements IUserService {
    IUserRepo userRepo = new UserRepo();

    @Override
    public List<User> findAll() {
        return userRepo.findAll();
    }

    @Override
    public void createUser(User user) {
        userRepo.createUser(user);
    }

    @Override
    public User findId(int id) {
        return userRepo.findId(id);
    }

    @Override
    public void updateUser(int id, User user) {
        userRepo.updateUser(id, user);
    }


    @Override
    public void deleteUser(int id) {
        userRepo.deleteUser(id);
    }

    @Override
    public User search(String country) {
        return userRepo.search(country);
    }

    @Override
    public List<User> sort() {
        return userRepo.sort();
    }
}
