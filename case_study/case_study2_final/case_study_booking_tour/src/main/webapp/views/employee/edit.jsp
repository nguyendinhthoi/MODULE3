<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 8/4/2023
  Time: 2:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chỉnh sửa nhân viên</title>
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
<div class="dashboard">
    <div class="overview">
        <section class="vh-100 gradient-custom" style="height: 200vh !important;">

            <div class="container py-5 h-100">
                <div class="row justify-content-center h-100">
                    <div class="col-12 col-lg-9 col-xl-7">
                        <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
                            <div class="card-body p-4 p-md-5"
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
                                            <i class="fa-regular fa-circle-check"></i>
                                            <span class="message">
                                                    ${message}
                                            </span>
                                        </div>
                                    </div>
                                </c:if>
                                <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">
                                    Thông tin nhân viên</h3>
                                <form method="post">

                                    <div class="row">
                                        <div class="col-md-6 mb-4">

                                            <div class="form-outline">
                                                <h6 class="form-label" for="name">Họ và tên</h6>
                                                <input type="text" name="name" id="name"
                                                       class="form-control form-control-lg active"
                                                       value="${employee.getEmployeeName()}" required/>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <h6 class="form-label" for="phone">Số điện thoại</h6>
                                            <div class="form-outline">
                                                <input type="number" name="phone" id="phone"
                                                       class="form-control form-control-lg active"
                                                       value="${employee.getEmployeePhone()}" required/>
                                                <c:if test="${error != null}">
                                                    <div class="alert alert-danger d-flex align-items-center"
                                                         role="alert" style="top: 5px">
                                                        <svg class="bi flex-shrink-0 me-2" width="0" height="0"
                                                             role="img" aria-label="Danger:">
                                                            <use xlink:href="#check-circle-fill"/>
                                                        </svg>
                                                        <div>
                                                            <span class="error">
                                                                <i class="uil uil-ban"></i><label
                                                                    style="padding-left: 5px">${error}</label>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-4">
                                            <h6 class="form-label" for="email">Email</h6>
                                            <div class="form-outline">
                                                <input type="email" name="email" id="email"
                                                       class="form-control form-control-lg active"
                                                       value="${employee.getEmployeeEmail()}" required/>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4">

                                            <div class="form-outline" id="selectGender">
                                                <h6 class="form-label">Giới tính</h6>
                                                <br>
                                                <c:if test="${employee.getGender() == 0}">
                                                    <input value="${1}" name="gender" type="radio" required>
                                                    <label>Nam</label>
                                                    <input value="${0}"
                                                           name="gender" type="radio" required checked>
                                                    <label>Nữ</label>
                                                </c:if>
                                                <c:if test="${employee.getGender() == 1}">
                                                    <input value="${1}" name="gender" type="radio" required checked>
                                                    <label>Nam</label>
                                                    <input value="${0}" name="gender" type="radio" required>
                                                    <label>Nữ</label>
                                                </c:if>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-4">
                                            <h6 class="form-label select-label">Bộ phận</h6>
                                            <select class="select form-control-lg" name="typeId" id="typeId">
                                                <option disabled selected>Hãy chọn bộ phận</option>
                                                <c:forEach var="type" items="${type}">
                                                    <option value="${type.getEmployeeTypeId()}"
                                                            <c:if test="${type.getEmployeeTypeId() == employee.getEmployeeTypeId()}">
                                                                selected
                                                            </c:if>
                                                    >${type.getEmployeeTypeName()}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <%--                                        <div class="row">--%>
                                    <%--                                            <div class="col-12">--%>
                                    <%--                                                <select class="select form-control-lg" name="status">--%>
                                    <%--                                                    <option selected disabled>Chọn trạng thái</option>--%>

                                    <%--                                                    <option value="${0}"--%>
                                    <%--                                                            <c:if test="${employee.getStatus() ==0}">--%>
                                    <%--                                                                selected--%>
                                    <%--                                                            </c:if>--%>
                                    <%--                                                    >Đang rảnh--%>
                                    <%--                                                    </option>--%>
                                    <%--                                                    <option value="${1}"--%>
                                    <%--                                                            <c:if test="${employee.getStatus() ==1}">--%>
                                    <%--                                                                selected--%>
                                    <%--                                                            </c:if>--%>
                                    <%--                                                    > Đang bận--%>
                                    <%--                                                    </option>--%>
                                    <%--                                                </select>--%>
                                    <%--                                                </select>--%>
                                    <%--                                                <label class="form-label select-label">Trạng thái</label>--%>

                                    <%--                                            </div>--%>
                                    <%--                                        </div>--%>

                                    <div class="mt-4 pt-2">
                                        <input class="btn btn-primary btn-lg" type="submit" value="Chỉnh sửa"/>
                                        <a class="btn btn-secondary btn-lg" href="/employeeServlet">Trở về</a>
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
