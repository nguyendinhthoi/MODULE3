package com.example.repository.account;


import com.example.model.account.Role;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RoleRepository implements IRoleRepository{

    public static final String SELECT_ROLE = "select * from roles";
    @Override
    public List<Role> getRole() {
        Connection connection = Base.getConnection();
        List<Role> roleList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ROLE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("role_id");
                String name = resultSet.getString("role_name");
                Role role = new Role(id,name);
                roleList.add(role);
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return roleList;
    }
}
