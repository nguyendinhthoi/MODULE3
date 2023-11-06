package com.example.repository.employee;

import com.example.model.employee.dto.EmployeeListDto;
import com.example.model.employee.Employee;



import java.sql.SQLException;
import java.util.List;

public interface IEmployeeRepo {
    List<EmployeeListDto> getAll();

    void createEmployee(Employee employee);

    void deleteEmployee(int id);

    void editEmployee(int id, Employee employee);

    Employee findEmployee(int id);

    List<EmployeeListDto> getAllDto();

    int sumCount();
}
