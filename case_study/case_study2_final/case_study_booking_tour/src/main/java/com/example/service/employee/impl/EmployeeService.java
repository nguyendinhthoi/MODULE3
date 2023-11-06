package com.example.service.employee.impl;



import com.example.model.employee.Employee;
import com.example.model.employee.dto.EmployeeListDto;
import com.example.repository.employee.IEmployeeRepo;
import com.example.repository.employee.impl.EmployeeRepo;
import com.example.service.employee.IEmployeeService;

import java.sql.SQLException;
import java.util.List;

public class EmployeeService implements IEmployeeService {
    IEmployeeRepo employeeRepo = new EmployeeRepo();

    @Override
    public List<EmployeeListDto> getAll() {
        return employeeRepo.getAll();
    }

    @Override
    public void createEmployee(Employee employee) {
        employeeRepo.createEmployee(employee);
    }

    @Override
    public void deleteEmployee(int id) {
        employeeRepo.deleteEmployee(id);
    }

    @Override
    public void editEmployee(int id, Employee employee){
        employeeRepo.editEmployee(id, employee);
    }

    @Override
    public Employee findEmployee(int id) {
        return employeeRepo.findEmployee(id);
    }

    @Override
    public List<EmployeeListDto> getAllDto() {
        return employeeRepo.getAllDto();
    }

    @Override
    public int sumCount() {
       return employeeRepo.sumCount();
    }
}
