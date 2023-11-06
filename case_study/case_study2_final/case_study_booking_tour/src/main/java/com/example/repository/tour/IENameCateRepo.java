package com.example.repository.tour;

import com.example.model.tour.ENameCate;

import java.util.List;

public interface IENameCateRepo {
    List<ENameCate> displayCateN();



    void updateCate();

    ENameCate getIdAvailable(int employeeId, String s_date, String e_date);

    void updateCateDel();
}
