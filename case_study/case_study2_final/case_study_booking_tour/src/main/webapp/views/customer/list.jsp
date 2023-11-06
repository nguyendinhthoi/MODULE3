<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 8/1/2023
  Time: 11:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh Sách Khách Hàng</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="//cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

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

<%--------------------------------------------------------%>
<a href="/CustomerServlet?action=showFormCreate">
    <button class="btn btn-primary"> ADD</button>
</a>
<%------------------------------------------------------------------------------------------------%>
<div id="wrapper-content">
    <section class="dashboard">
        <div class="eight">
            <h1 style="">DANH SÁCH KHÁCH HÀNG</h1>
        </div>
        <div class="activity-data">
            <div class="title" style="padding-bottom: 10px">
                <a class="btn btn-primary" role="button" href="/CustomerServlet?action=showFormCreate">
                    <i class="fa-solid fa-user-plus fa-beat"></i>
                </a>
            </div>
            <table class="table" id="myTable">
                <thead>
                <tr>
                    <th scope="col" hidden="">ID</th>
                    <th scope="col">Họ và tên</th>
                    <th scope="col">Số CMND/CCCD</th>
                    <th scope="col">Giới Tính</th>
                    <th scope="col">Email</th>
                    <th scope="col">Số ĐT</th>
                    <th scope="col">Địa Chỉ</th>
                    <th scope="col">Kiểu KH</th>
                    <th scope="col" hidden>Loại TK</th>
                    <th scope="col">Sửa</th>
                    <th scope="col">Xóa</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="customer" items="${customerList}">
                    <tr>
                        <td class="data-list" hidden="">${customer.customerId}</td>
                        <td class="data-list">${customer.customerName}</td>
                        <td class="data-list">${customer.customerIdCard}</td>
                        <c:if test="${customer.customerGender==true}">
                            <td>Nam</td>
                        </c:if>
                        <c:if test="${customer.customerGender==false}">
                            <td>Nữ</td>
                        </c:if>
                        <td class="data-list">${customer.customerEmail}</td>
                        <td class="data-list">${customer.customerPhone}</td>
                        <td class="data-list">${customer.customerAddress}</td>
                        <c:if test="${customer.customerTypeId==1}">
                            <td>Thường</td>
                        </c:if>

                        <c:if test="${customer.customerTypeId==2}">
                            <td>V.I.P</td>
                        </c:if>
                        <td class="data-list" hidden>${customer.accountId}</td>
                        <td class="data-list">
                            <a class="btn btn-primary"
                               href="CustomerServlet?action=showFormEdit&customer_id=${customer.customerId}"
                               role="button">
                                <i class="fa-solid fa-pen-to-square fa-beat" title="Sửa"></i>
                            </a>
                        </td>
                        <td class="data-list">
                            <button type="submit" class="btn btn-danger" data-bs-toggle="modal"
                                    data-bs-target="#exampleModal"
                                    onclick="sendInfoDelete('${customer.customerId}','${customer.customerName}')">
                                <i class="fa-solid fa-trash fa-beat" title="Xoá"></i>
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <%------------------------------------------------------------------------------------------------%>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Thông Báo</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <%--Modal--%>
                    <form action="/CustomerServlet?action=" id="deleteForm">
                        <div class="modal-body">
                            <input type="hidden" name="action" value="deleteCustomer"/>
                            <input type="hidden" id="id" name="customer_id"/>
                            <span>Bạn Có Muốn Xóa Khách Hàng <b><span id="nameDelete"></span>?</b></span>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                            <button type="submit" class="btn btn-danger" id="deleteButton">Xác Nhận</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</div>
</body>
<script src="//cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    new DataTable('#myTable');

    function sendInfoDelete(id, name) {
        document.getElementById("nameDelete").innerText = name;
        document.getElementById("id").value = id;
    }
    const deleteButton = document.querySelector("#deleteButton");
    const deleteForm = document.querySelector("#deleteForm");
    const modal = document.getElementById("exampleModal");
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
                modal.style.display = "none";
            }
        });
    });
</script>
</html>
