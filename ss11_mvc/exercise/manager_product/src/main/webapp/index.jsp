<%--
  Created by IntelliJ IDEA.
  User: Dinh Luan
  Date: 5/29/2022
  Time: 11:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Manager</title>
    <link rel="stylesheet" href="bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="fontawesome/css/all.css">
</head>
<body>

<nav class="navbar navbar-expand-sm navbar-dark bg-primary">
    <a class="navbar-brand" href="#">Product Manager</a>
    <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#collapsibleNavId"
            aria-controls="collapsibleNavId"
            aria-expanded="false" aria-label="Toggle navigation"></button>
    <div class="collapse navbar-collapse" id="collapsibleNavId">
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item active">
                <a class="nav-link" href="/index.jsp">Trang chủ <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="dropdownId" data-toggle="dropdown">Chức năng</a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="/product?action=display" >Hiển thị danh sách sản phẩm</a>
                    <a class="dropdown-item" href="/product?action=create">Tạo sản phẩm mới</a>
                    <a class="dropdown-item" href="/product?action=update">Cập nhật thông tin sản phẩm</a>
                    <a class="dropdown-item" href="/product?action=delete">Xoá một sản phẩm</a>
                    <a class="dropdown-item" href="/product?action=detail">Xem chi tiết một sản phẩm</a>
                    <a class="dropdown-item" href="/product?action=search">Tìm kiếm sản phẩm theo tên</a>
                </div>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="text" placeholder="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>
<div class="container">
    <div class="align-content-lg-center text-center">
        <h1>
            Welcome To Product Manager Page
        </h1>
        <p class="text-center">
            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the
            industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and
            scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into
            electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of
            Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like
            Aldus PageMaker including versions of Lorem Ipsum.
        </p>
    </div>
</div>

</body>
<script src="js/jquery.slim.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="bootstrap/dist/js/bootstrap.min.js"></script>
<script src="bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/custom.js"></script>
</html>
