<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/8/2023
  Time: 8:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm mới tài khoản</title>

</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
<div class="dashboard" id="wrapper-content">
    <div class="overview">
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
                                                <span class="message">
                                                    <i class="fa-regular fa-circle-check"></i>
                                                        <label style="padding-left: 5px">${message}</label>
                                                </span>
                                            </div>
                                        </div>
                                    </c:if>
                                    <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Thông tin tài khoản</h3>

                                    <form method="post" action="/account?action=create">

                                        <div class="row">
                                            <div class="col-md-6 mb-4">

                                                <div class="form-outline">
                                                    <h6 class="form-label" for="name" size="15px">Tên đăng nhập</h6>
                                                    <input type="text" name="user" id="name"
                                                           value="${acc.getUsername()}"
                                                           class="form-control form-control-lg" placeholder="Nhập tên tài khoản" required/>
                                                    <c:if test="${error != null}">
                                                        <div class="alert alert-danger d-flex align-items-center"
                                                             role="alert" style="top: 10px">
                                                            <svg class="bi flex-shrink-0 me-2" width="0" height="0"
                                                                 role="img" aria-label="Danger:">
                                                                <use xlink:href="#check-circle-fill"/>
                                                            </svg>
                                                            <div>
                                                <span class="message">
                                                  <i class="uil uil-ban"></i><label
                                                        style="padding-left: 5px">${error}</label>
                                                </span>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </div>

                                            </div>
                                            <div class="col-md-6 mb-4">

                                                <div class="form-outline">
                                                    <h6 class="form-label" for="phone" size="15px">Mật khẩu</h6>
                                                    <input type="text" name="pass" id="phone"
                                                           value="${acc.getPassword()}"
                                                           class="form-control form-control-lg" placeholder="Nhập mật khẩu"/>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6 mb-4">

                                                <div class="form-outline">
                                                    <h6 class="form-label" for="email" size="15px">Email</h6>
                                                    <input type="email" name="email" id="email"
                                                           value="${acc.getEmail()}"
                                                           class="form-control form-control-lg" placeholder="Nhập email" required/>
                                                    <c:if test="${error1 != null}">
                                                        <div class="alert alert-danger d-flex align-items-center"
                                                             role="alert" style="top: 10px">
                                                            <svg class="bi flex-shrink-0 me-2" width="0" height="0"
                                                                 role="img" aria-label="Danger:">
                                                                <use xlink:href="#check-circle-fill"/>
                                                            </svg>
                                                            <div>
                                                                <span class="message">
                                                                  <i class="uil uil-ban"></i><label
                                                                        style="padding-left: 5px">${error1}</label>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </div>

                                            <div class="col-md-6 mb-4">

                                                <h6 class="form-label select-label">Role</h6>
                                                <select name="role" id="role" class="select form-control-lg" required>
                                                    <c:forEach items="${newRole}" var="role">
                                                        <option value="${role.getRoleId()}">${role.getRoleName()}</option>
                                                    </c:forEach>

                                                </select>
                                            </div>

                                        </div>


                                        <div class="row">
                                        </div>
                                        <div class="mt-4 pt-2">
                                            <input class="btn btn-primary btn-lg" type="submit" value="Thêm mới"/>
                                            <a class="btn btn-secondary btn-lg" href="/account">Trở về</a>
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
</div>
</body>
</html>
