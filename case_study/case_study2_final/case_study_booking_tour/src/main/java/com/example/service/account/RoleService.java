package com.example.service.account;

import com.example.model.account.Role;
import com.example.repository.account.IRoleRepository;
import com.example.repository.account.RoleRepository;


import java.util.List;

public class RoleService implements IRoleService{
    IRoleRepository roleRepository = new RoleRepository();

    @Override
    public List<Role> getRole() {
        return roleRepository.getRole();
    }
}
