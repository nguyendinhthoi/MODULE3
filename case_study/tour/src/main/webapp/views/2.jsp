<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/7/2023
  Time: 7:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<html>
<head>
    <title>Danh sách tour</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        .eight h1 {
            text-align: center;

            text-transform: uppercase;
            font-size: 26px;
            letter-spacing: 1px;

            display: grid;
            grid-template-columns: 1fr auto 1fr;
            grid-template-rows: 16px 0;
            grid-gap: 22px;
        }

        .eight h1:after, .eight h1:before {
            content: " ";
            display: block;
            border-bottom: 2px solid #ccc;
            background-color: #27374D;
        }

    </style>
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
<div id="wrapper-content">
    <section class="dashboard">
        <div class="eight">
            <h1 style="">DANH SÁCH TOUR</h1>
        </div>
        <div class="activity-data">
            <div class="title" style="padding-bottom: 10px">
                <a class="btn btn-primary" role="button" href="/tourServlet?action=create">
                    <i class="fa-solid fa-user-plus fa-beat"></i>
                </a>
            </div>
            <table class="table" id="table">
                <thead>
                <tr>
                    <th scope="col">Tên tour</th>
                    <th scope="col">Quy mô nhóm</th>
                    <th scope="col">Ngày bắt đầu</th>
                    <th scope="col">Ngày kết thúc</th>
                    <th scope="col">Giá tour/1 người</th>
                    <th scope="col">Chi tiết</th>
                    <th scope="col">Sửa</th>
                    <th scope="col">Xóa</th>
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
                            <a class="btn btn-primary" href="tourServlet?action=view&id=${tour.getTourId()}"
                               role="button">
                                <i class="fa-solid fa-info fa-beat" style="color: #FFFFFF" title="Chi tiết"></i>
                            </a>
                        </td>
                        <td class="data-list">
                            <a class="btn btn-primary" href="tourServlet?action=edit&id=${tour.getTourId()}"
                               role="button">
                                <i class="fa-solid fa-pen-to-square fa-beat" title="Sửa"></i>
                            </a>
                        </td>
                        <td class="data-list">
                            <button type="button"
                                    onclick="showModal('${tour.getTourId()}','${tour.getTourName()}')"
                                    class="btn btn-danger">
                                <i class="fa-solid fa-trash fa-beat" title="Xoá"></i>
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <form action="/tourServlet?action=delete" method="post" id="deleteForm">
            <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">THÔNG BÁO</h5>
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
                            <button id="deleteButton" type="submit" class="btn btn-danger">Xác nhận</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </section>
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>--%>
<script>
    new DataTable('#table');

    function showModal(id, name) {
        document.getElementById("name").innerHTML = name;
        document.getElementById("code").value = id;
        $("#deleteModal").modal("show");
    }

    const deleteButton = document.querySelector("#deleteButton");
    const deleteForm = document.querySelector("#deleteForm");
    const modal = document.getElementById("deleteModal");
    deleteButton.addEventListener("click", function (event) {
        event.preventDefault();
        Swal.fire({
            title: 'Xoá thành công',
            text: 'Dữ liệu đã được xoá thành công!',
            icon: 'success',
            showConfirmButton: true
        }).then((result) => {
            if (result.isConfirmed) {
                // Nếu người dùng xác nhận, thực hiện submit form
                deleteForm.submit();
                modal.style.display ="none";
            }
        });
    });
</script>
</body>
</html>
