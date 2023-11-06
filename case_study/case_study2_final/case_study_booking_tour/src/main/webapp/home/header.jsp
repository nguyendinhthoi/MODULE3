<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/8/2023
  Time: 7:09 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    header {
        position: fixed;
        top: 0;
        botop: 0;
        left: 0;
        right: 0;
        z-index: 9999;
        background-color: white;
    }

    .carousel .input-group {
        padding-top: 280px;
        padding-left: 150px;
        position: absolute;
        z-index: 2;
    }

    ​
    .carousel .intro span {
        color: rgba(255, 255, 255, 1);
        font-size: 20px;
        font-family: Arial;
    }

    ​
    .carousel .form-control {
        font-size: 1.5rem;
    }
</style>
<header>
    <div class="col-md-12" style="position: fixed;padding-top: 0">
        <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
            <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
                <svg class="bi me-2" width="40" height="32">
                    <use xlink:href="#bootstrap"></use>
                </svg>
                <span class="fs-4" style=" font-family: 'Lobster';font-size: 70px;color: #ff5b00 ">Simple Booking</span>
            </a>
            <input type="text" placeholder=" Search..."
                   style="border-radius: 35px;width: 200px;background-color: #f5f5f5">
            <ul class="nav nav-pills">
                <li class="nav-item"><a href="/account?action=home" class="nav-link" style="color: #222222">Trang Chủ</a>
                </li>
                <li class="nav-item"><a href="#" class="nav-link" style="color: #222222">Tour</a></li>
                <li class="nav-item"><a href="https://www.facebook.com/klookvn" class="nav-link" style="color: #222222">Liên Hệ</a></li>

                <c:if test="${sessionScope.account == null}">
                <li class="nav-item"><a href="/account?action=signup" class="nav-link" style="color: #222222">Đăng Kí</a>
                    </c:if>

                    <c:if test="${sessionScope.account.role == 1}">
                <li class="nav-item"><a href="/account?action=manage" class="nav-link" style="color: #222222">Quản Lý</a></li>
                </c:if>

                <li class="nav-item"><a href="#" class="nav-link" style="margin-top: -15px"></a>
                    <c:if test="${sessionScope.account == null}">
                        <a href="/account?action=login">
                            <button type="submit"
                                    style="background-color: #ff5b00;border-radius: 35px;border: none;height: 40px;text-align: center;width: 100px;color: white;padding-top: 0px;padding-bottom: 0px ">
                                Đăng Nhập
                            </button>
                        </a>
                    </c:if>
                    <c:if test="${sessionScope.account != null}">

                        <div class="dropdown" >
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2"
                                    data-bs-toggle="dropdown" aria-expanded="false" style="background-color: #ff5c01; border: white">
                                    ${sessionScope.account.username}
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">

                                <li>
                                    <a href="/CustomerServlet?action=detail&id=${sessionScope.account.id}" style="text-decoration: none"> <button class="dropdown-item" type="button">Thông tin</button></a>
                                </li>

                                <li>
                                    <a href="/account?action=logout" style="text-decoration: none"><button class="dropdown-item" type="button">Đăng xuất</button></a>
                                </li>
                            </ul>
                        </div>
                    </c:if>
                </li>
            </ul>
        </header>
    </div>
</header>


