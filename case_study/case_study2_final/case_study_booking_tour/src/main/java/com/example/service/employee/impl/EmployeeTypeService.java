package com.example.service.employee.impl;



import com.example.model.employee.EmployeeType;
import com.example.repository.employee.IEmployeeTypeRepo;
import com.example.repository.employee.impl.EmployeeTypeRepo;
import com.example.service.employee.IEmployeeTypeService;

import java.util.List;

public class EmployeeTypeService implements IEmployeeTypeService {
    IEmployeeTypeRepo employeeTypeRepo = new EmployeeTypeRepo();

    @Override
    public List<EmployeeType> getAll() {
        return employeeTypeRepo.getAll();
    }
}
