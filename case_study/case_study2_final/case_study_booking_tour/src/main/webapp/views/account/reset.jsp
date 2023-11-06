<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/8/2023
  Time: 12:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Lấy lại mật khẩu</title>
    <link rel="stylesheet" href="/bootstrap-5.2.3-dist/css/bootstrap.css">
    <style>
        .spinner-container {
            display: none;
            width: 100%;
            height: 100%;
            position: fixed;
            top: 0;
            left: 0;
            background-color: rgba(255, 255, 255, 0.7);
            z-index: 9999;
        }

        .spinner {
            position: absolute;
            top: 40%;
            left: 50%;
            border: 4px solid #f3f3f3;
            border-top: 4px solid #3498db;
            border-radius: 50%;
            width: 100px;
            height: 100px;
            animation: spin 1s linear infinite;
            margin: 0 auto;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>
<body>
<div class="spinner-container">
    <div class="spinner"></div>
</div>
<section class="vh-100" style="background-color:white;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-xl-10">
                <div class="card" style="border-radius: 1rem;">
                    <div class="row g-0">
                        <div class="col-md-6 col-lg-5 d-none d-md-block">
                            <img src="https://i.pinimg.com/564x/58/4e/48/584e488642a0d49dfa869dfc87360734.jpg"
                                 alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem; min-height: 100%" />
                        </div>
                        <div class="col-md-6 col-lg-7 d-flex align-items-center" style="background-color: #bcdff3">
                            <div class="card-body p-4 p-lg-5 text-black">

                                <form action="/account?action=reset" method="post">
                                    <div class="d-flex align-items-center mb-3 pb-1" style="margin-left:20%">
                                        <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
                                        <span class="h1 fw-bold mb-0" >Lấy lại mật khẩu</span>
                                    </div>





                                    <p style="color: blue">${success}</p>
                                    <div class="form-outline mb-4">
                                        <input type="text" id="form2Example17" class="form-control form-control-lg" name="email" placeholder="Nhập vào email"/>
                                        <label class="form-label" for="form2Example17"></label>
                                    </div>

                                    <p class="text-bg-danger" style="text-align: center">${message}</p>

                                    <div class="pt-1 mb-4">
                                        <button class="btn btn-dark btn-lg btn-block" id="myButton" type="submit">Gửi</button>
                                    </div>

                                    <a class="small text-muted" href="/account?action=reset">Quên mật khẩu?</a>
                                    <p class="mb-5 pb-lg-2" style="color: #393f81;">Bạn đã có tài khoản? <a href="/account?action=login" style="color: #393f81;">Đăng nhập ngay</a></p>
                                    <a href="/account?action=home" class="small text-muted">Quay về trang chủ.</a>

                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="/bootstrap-5.2.3-dist/js/bootstrap.bundle.js"></script>
<script>
    const button = document.getElementById("myButton");
    const spinnerContainer = document.querySelector(".spinner-container");

    button.addEventListener("click", () => {
        spinnerContainer.style.display = "block";

        // Simulate a delay for demonstration purposes
    });
</script>
</body>
</html>
