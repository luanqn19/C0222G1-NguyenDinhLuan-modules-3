<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Dinh Luan
  Date: 5/29/2022
  Time: 12:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Display Product</title>
    <link rel="stylesheet" href="../bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../fontawesome/css/all.css">
    <link rel="stylesheet" href="../css/custom.css">
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
                <a class="nav-link" href="/">Trang chủ <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="dropdownId" data-toggle="dropdown">Chức năng</a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="/product?action=display">Hiển thị danh sách sản phẩm</a>
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
    <form action="/product?action=search" method="post">
        <div class="form-add">
            <label for="id">ID Product</label>
            <input type="number" class="form-control" name="id" id="id" placeholder="Input ID Product Search" required>
        </div>

        <div>
            <button type="submit" class="btn btn-primary form-control">Submit</button>
        </div>
    </form>

    <table class="table table-striped table-inverse">
        <thead class="thead-inverse">
        <tr>
            <th>ID Product</th>
            <th>Mã sản phẩm</th>
            <th>Tên sản phẩm</th>
            <th>Ngày nhập</th>
            <th>Mô tả</th>
            <th>Nhà sản xuất</th>
            <th>Số lượng</th>
            <th>Đơn giá</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${product != null}">
            <tr>
                <td>${product.idProduct}</td>
                <td>${product.codeProduct}</td>
                <td>${product.nameProduct}</td>
                <td>${product.dateImport}</td>
                <td>${product.descriptionProduct}</td>
                <td>${product.productionName}</td>
                <td>${product.amount}</td>
                <td>${product.price}</td>
            </tr>
        </c:if>
        </tbody>
    </table>
</div>
</body>
<script src="../js/jquery.slim.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../bootstrap/dist/js/bootstrap.min.js"></script>
<script src="../bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="../js/custom.js"></script>
</html>
