<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm mới nhân viên</title>

</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
<div class="dashboard" id="wrapper-content">
    <div class="overview">
        <section class="vh-100 gradient-custom" style="height: 200vh !important;">

            <div class="container py-5 h-100">
                <div class="row justify-content-center h-100">
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
                                            <i class="fa-regular fa-circle-check"></i><label
                                                style="padding-left: 5px">${message}</label>
                                        </div>
                                    </div>
                                </c:if>
                                <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Thêm mới nhân viên</h3>
                                <form method="post" action="employeeServlet?action=create">

                                    <div class="row">
                                        <div class="col-md-6 mb-4">

                                            <div class="form-outline">
                                                <h6 class="form-label" for="name">Họ và tên</h6>
                                                <input type="text" name="name" id="name"
                                                       class="form-control form-control-lg"
                                                       value="${employee.getEmployeeName()}" required placeholder="Nhập tên"/>
                                            </div>

                                        </div>
                                        <div class="col-md-6 mb-4">

                                            <div class="form-outline">
                                                <h6 class="form-label" for="phone">Số điện thoại</h6>
                                                <input type="number" name="phone" id="phone"
                                                       class="form-control form-control-lg"
                                                       value="${employee.getEmployeePhone()}" required
                                                       placeholder="Nhập số điện thoại"/>
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

                                            <div class="form-outline">
                                                <h6 class="form-label" for="email">Email</h6>
                                                <input type="email" name="email" id="email"
                                                       class="form-control form-control-lg"
                                                       value="${employee.getEmployeeEmail()}" required
                                                placeholder="Nhập email"/>
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

                                    <div class="row">
                                        <div class="col-12">

                                            <h6 class="form-label select-label">Bộ phận</h6>
                                            <select class="select form-control-lg" name="typeId" id="typeId">
                                                <option selected disabled>Chọn bộ phận</option>
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

                                    <div class="mt-4 pt-2">
                                        <input class="btn btn-primary btn-lg" type="submit" value="Thêm mới"/>
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

