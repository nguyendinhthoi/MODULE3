<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/8/2023
  Time: 1:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Danh sách tài khoản</title>
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
            <h1 style="">DANH SÁCH TÀI KHOẢN</h1>
        </div>
        <div class="activity-data">
            <div class="title" style="padding-bottom: 10px">
                <a class="btn btn-primary" role="button" href="/account?action=create">
                    <i class="fa-solid fa-user-plus fa-beat"></i>
                </a>
            </div>
            <table id="myTable" class="table">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Tên đăng nhập</th>
                    <th scope="col" hidden="hidden">Mật khẩu</th>
                    <th scope="col" hidden="hidden">Trạng thái</th>
                    <th scope="col">Role</th>
                    <th scope="col">Email</th>
                    <th scope="col">Sửa</th>
                    <th scope="col">Xóa</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${accounts}" var="account" varStatus="loop">
                    <tr>
                        <td class="data-list">${loop.count}</td>
                        <td class="data-list">${account.getUsername()}</td>
                        <td class="data-list" hidden="hidden">${account.getPassword()}</td>
                        <td class="data-list" hidden="hidden"> <c:if test="${account.getStatus()==0}" >
                            Available
                        </c:if>
                            <c:if test="${account.getStatus()==1}" >
                                Not Available
                            </c:if>
                        </td>
                        <td class="data-list">
                            <c:if test="${account.getRole()==1}" >
                                Admin
                            </c:if>
                            <c:if test="${account.getRole()!=1}" >
                                User
                            </c:if>
                        </td>
                        <td>
                                ${account.getEmail()}
                        </td>

                        <td class="data-list">
                            <a class="btn btn-primary" href="/account?action=edit&id=${account.getId()}"
                               role="button">
                                <i class="fa-solid fa-pen-to-square fa-beat" style="color: white" title="Sửa"></i>
                            </a>
                        </td>
                        <td class="data-list">
                            <button type="button" onclick="showModal('${account.getId()}','${account.getUsername()}')" class="btn btn-danger"
                                    <c:if test="${account.getStatus()==1}">disabled</c:if>
                            >
                                <i class="fa-solid fa-trash fa-beat" title="Xoá"></i>
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <form action="/account?action=delete" method="post" id="deleteForm">
            <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Thông báo</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                        <input type="hidden" name="id" id="id">
                        <div class="modal-body">
                            Bạn có muốn xóa account có tên là <b><span id="nameAccountDelete"></span></b>?
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
        document.getElementById("nameAccountDelete").innerText = name;
        document.getElementById("id").value = id;
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