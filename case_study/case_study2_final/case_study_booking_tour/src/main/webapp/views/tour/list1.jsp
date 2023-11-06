<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 8/4/2023
  Time: 2:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách Tour</title>
    <link rel="stylesheet" href="//cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
<div id="wrapper-content">
    <section class="dashboard">
        <h1 align="center">Danh sách Tour</h1>
        <div class="activity-data">
            <div class="title">
                <a class="btn btn-primary" href="tourServlet?action=create">
                    <i class="uil uil-clock-three"></i>
                </a>
                <span class="text">Thêm mới tour</span>
            </div>
            <table id="table" class="table">
                <thead>
                <tr>
                    <th scope="col">Tên tour</th>
                    <th scope="col">Quy mô nhóm</th>
                    <th scope="col">Ngày bắt đầu</th>
                    <th scope="col">Ngày kết thúc</th>
                    <th scope="col">Giá tour/1 người</th>
                    <%--<th hidden="hidden" scope="col">Tên hướng dẫn viên</th>--%>
                    <th scope="col" class=" text-center">Chi tiết</th>
                    <th scope="col" class=" text-center">Sửa</th>
                    <th scope="col" class=" text-center">Xóa</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${tours}" var="tour">
                    <tr>
                        <td class="data-list">${tour.getTourName()}</td>
                        <td class="data-list">${tour.getAvailableSeat()}</td>
                        <c:set var="dateString" value="${tour.getStartDate()}"/>
                        <fmt:parseDate value="${dateString}" var="date" pattern="yyyy-MM-dd"/>
                        <td class="data-list">
                            <fmt:formatDate value="${date}" pattern="dd/MM/yyyy"/>
                        </td>
                        <c:set var="dateString1" value="${tour.getEndDate()}"/>
                        <fmt:parseDate value="${dateString1}" var="date1" pattern="yyyy-MM-dd"/>
                        <td class="data-list">
                            <fmt:formatDate value="${date1}" pattern="dd/MM/yyyy"/>
                        </td>
                        <fmt:setLocale value="vi_VN"/>
                        <c:set var="price" value="${tour.getTourPrice()}"/>
                        <td class="data-list">
                            <fmt:formatNumber value="${price}" type="currency" currencySymbol="₫"/>
                        </td>
                            <%--                        <td hidden="hidden" class="data-list">${tour.getEmployeeName()}</td>--%>
                        <td class="data-list">
                            <a class="btn btn-warning" href="tourServlet?action=view&id=${tour.getTourId()}"
                               role="button">
                                Chi tiết
                            </a>
                        </td>
                        <td class="data-list">
                            <a class="btn btn-warning" href="tourServlet?action=edit&id=${tour.getTourId()}"
                               role="button">
                                Sửa
                            </a>
                        </td>
                        <td class="data-list">
                            <button type="button"
                                    onclick="showModal('${tour.getTourId()}','${tour.getTourName()}')"
                                    class="btn btn-danger">
                                Xóa
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <form action="/tourServlet?action=delete" method="post">
            <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">XOÁ</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <input type="hidden" name="code" id="code">
                        <div class="modal-body">
                            Bạn có muốn xóa Tour <b><span id="name"></span></b> không?
                            <br>
                            <label>(Lưu ý: hành động này sẽ không được hoàn tác)</label>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                            <button type="submit" class="btn btn-danger">Xác nhận</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </section>
</div>

<script src="/bootstrap-5.2.3-dist/js/bootstrap.bundle.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
        crossorigin="anonymous"></script>
<script src="/js/script.js"></script>
<script src="//cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

<script>
    new DataTable('#table');

    function showModal(id, name) {
        document.getElementById("name").innerHTML = name;
        document.getElementById("code").value = id;
        $("#deleteModal").modal("show");
    }
</script>
</body>
</html>