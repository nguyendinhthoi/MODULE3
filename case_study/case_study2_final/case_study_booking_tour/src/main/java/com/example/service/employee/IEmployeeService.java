package com.example.service.employee;


import com.example.model.employee.Employee;
import com.example.model.employee.dto.EmployeeListDto;

import java.sql.SQLException;
import java.util.List;

public interface IEmployeeService {
    List<EmployeeListDto> getAll();

    void createEmployee(Employee employee);

    void deleteEmployee(int id);

    void editEmployee(int id, Employee employee);

    Employee findEmployee(int id);

    List<EmployeeListDto> getAllDto();

    int sumCount();
}
