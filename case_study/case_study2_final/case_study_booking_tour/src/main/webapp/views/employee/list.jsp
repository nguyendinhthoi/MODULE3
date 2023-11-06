<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách nhân viên</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        .eight h1 {
            text-align:center;

            text-transform:uppercase;
            font-size:26px; letter-spacing:1px;

            display: grid;
            grid-template-columns: 1fr auto 1fr;
            grid-template-rows: 16px 0;
            grid-gap: 22px;
        }

        .eight h1:after,.eight h1:before {
            content: " ";
            display: block;
            border-bottom: 2px solid #ccc;
            background-color:#27374D;
        }

    </style>
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
<div id="wrapper-content">
    <section class="dashboard">
        <div class="eight">
            <h1 style="">DANH SÁCH NHÂN VIÊN</h1>
        </div>
        <div class="activity-data">
            <div class="title" style="padding-bottom: 10px">
                <a class="btn btn-primary" role="button" href="/employeeServlet?action=create">
                    <i class="fa-solid fa-user-plus fa-beat"></i>
                </a>
            </div>
            <table class="table" id="myTable">
                <thead>
                <tr>
                    <th scope="col" hidden="">ID</th>
                    <th scope="col">#</th>
                    <th scope="col">Họ và tên</th>
                    <th scope="col">Số điện thoại</th>
                    <th scope="col">Email</th>
                    <th scope="col">Giới tính</th>
                    <th scope="col">Bộ phận</th>
                    <th scope="col">Trạng thái</th>
                    <th scope="col">Sửa</th>
                    <th scope="col">Xóa</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${employee}" var="employees" varStatus="loop">
                    <tr>
                        <td class="data-list" hidden="">${employees.getId()}</td>
                        <td class="data-list">${loop.count}</td>
                        <td class="data-list">${employees.getName()}</td>
                        <td class="data-list">${employees.getPhone()}</td>
                        <td class="data-list">${employees.getEmail()}</td>
                        <td class="data-list">
                            <c:if test="${employees.getGender() == 1}">Nam</c:if>
                            <c:if test="${employees.getGender() == 0}">Nữ</c:if>
                        </td>
                        <td>
                                ${employees.getTypeName()}
                        </td>
                        <td class="data-list">
                            <c:if test="${employees.getStatus() == 1}">Đang bận</c:if>
                            <c:if test="${employees.getStatus() == 0}">Đang rảnh</c:if>
                        </td>
                        <td class="data-list">
                            <a class="btn btn-primary" href="employeeServlet?action=edit&id=${employees.getId()}"
                               role="button">
                                <i class="fa-solid fa-pen-to-square fa-beat" title="Sửa"></i>
                            </a>
                        </td>
                        <td class="data-list">
                            <button type="button" onclick="showModal('${employees.getId()}','${employees.getName()}')" class="btn btn-danger">
                                <i class="fa-solid fa-trash fa-beat" title="Xoá"></i>
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <form action="/employeeServlet?action=delete" method="post" id="deleteForm">
            <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Thông báo</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                        <input type="hidden" name="code" id="code">
                        <div class="modal-body">
                            Bạn có muốn xóa nhân viên <b><span id="name"></span></b> không ?
                            <br>
                            <label>(Lưu ý: hành động này sẽ không được hoàn tác)</label>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                            <button id="deleteButton" type="submit" class="btn btn-danger">Xác nhận</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </section>
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    new DataTable('#myTable');

    function showModal(id,name) {
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
