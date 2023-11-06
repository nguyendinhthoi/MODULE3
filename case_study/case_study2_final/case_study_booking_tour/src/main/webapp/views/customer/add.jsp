<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 8/1/2023
  Time: 2:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm Mới Khách Hàng</title>
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
<div class="dashboard" id="wrapper-content">
    <div class="overview">
        <section class="vh-100 gradient-custom">
            <div class="container py-5 h-100">
                <div class="row justify-content-center h-100"
                     style="height: 200vh !important; background-color: #DDE6ED">
                    <div class="col-12 col-lg-9 col-xl-7">
                        <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
                            <div id="formCreate" class="card-body p-4 p-md-5"
                                 style="box-shadow: 0 0 10px rgba(0, 0, 0, 1); border-radius: 10px">
                                <img src="/images/simple.png"
                                     class="w-100"
                                     style="border-top-left-radius: .3rem; border-top-right-radius: .3rem; padding-bottom: 20px"
                                     alt="Sample photo">
                                <c:if test="${message != null}">
                                    <div class="alert alert-success d-flex align-items-center" role="alert">
                                        <svg class="bi flex-shrink-0 me-2" width="0" height="0" role="img"
                                             aria-label="Success:">
                                            <use xlink:href="#check-circle-fill"/>
                                        </svg>
                                        <div>
                                            <span class="message">
                                                <i class="fa-regular fa-circle-check"></i>
                                                    ${message}
                                            </span>
                                        </div>
                                    </div>
                                </c:if>
                                <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Thêm mới khách hàng</h3>
                                <form method="post" action="/CustomerServlet?action=addCustomer">
                                    <div class="row">
                                        <div class="col-md-6 mb-4">
                                            <div class="form-outline">
                                                <h6 class="form-label" for="Name">Họ và tên</h6>
                                                <input type="text" name="Name" id="name"
                                                       class="form-control form-control-lg"
                                                       value="${customer.customerName}" required/>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <div class="form-outline">
                                                <h6 class="form-label" for="IdCard">Số CMND/CCCD</h6>
                                                <input type="text" name="IdCard" id="IdCard"
                                                       value="${customer.customerIdCard}"
                                                       class="form-control form-control-lg" required/>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <div class="form-outline">
                                                <h6 class="form-label" for="phone">Số điện thoại</h6>
                                                <input type="text" name="phone" id="phone"
                                                       class="form-control form-control-lg"
                                                       value="${customer.customerPhone}" required/>
                                                <c:if test="${error != null}">
                                                    <div class="alert alert-danger d-flex align-items-center"
                                                         role="alert" style="top: 5px">
                                                        <svg class="bi flex-shrink-0 me-2" width="0" height="0"
                                                             role="img" aria-label="Danger:">
                                                            <use xlink:href="#check-circle-fill"/>
                                                        </svg>
                                                        <div>
                                                                <span class="error">
                                                               <label> <i class="uil uil-ban"></i> ${error}</label>
                                                                 </span>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <div class="form-outline">
                                                <h6 class="form-label" for="address" size="15px">Địa Chỉ</h6>
                                                <textarea class="form-control" name="address"
                                                          required>${customer.customerAddress}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 mb-4">
                                            <div class="form-outline">
                                                <h6 class="form-label" for="email" size="15px">Email</h6>
                                                <input type="email" name="email" id="email"
                                                       value="${customer.customerEmail}"
                                                       class="form-control form-control-lg" required/>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <div class="form-outline" id="selectGender">
                                                <h6 class="form-label">Giới tính</h6>
                                                <br>
                                                <input value="1" name="gender" type="radio" required checked/>
                                                <label>Nam</label>
                                                <input value="0" name="gender" type="radio" required/>
                                                <label>Nữ</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mt-4 pt-2">
                                        <input class="btn btn-primary btn-lg" type="submit" value="Thêm mới"/>
                                        <a class="btn btn-secondary btn-lg" href="/CustomerServlet">Trở về</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
</body>
</html>
