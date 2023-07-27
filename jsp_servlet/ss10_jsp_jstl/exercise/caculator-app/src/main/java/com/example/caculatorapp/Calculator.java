package com.example.caculatorapp;

import java.util.Objects;

public class Calculator {
    public static double calculate(double fNumber, double sNumber, String operator) {
        if (Objects.equals(operator, "addition")) {
            return fNumber + sNumber;
        } else if (Objects.equals(operator, "minus")) {
            return fNumber - sNumber;
        } else if (Objects.equals(operator, "multiplication")) {
            return fNumber * sNumber;
        } else if (Objects.equals(operator, "division")) {
            if (sNumber != 0) {
                return fNumber / sNumber;
            } else {
                throw new RuntimeException("Cant divide by 0");
            }
        }
        return 0;
    }
}
