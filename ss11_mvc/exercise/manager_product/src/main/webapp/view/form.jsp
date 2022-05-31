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
    <form action="/product?action=create" method="post">
        <c:if test="${messenger != null}">
            <h2 class="text-center">${messenger}</h2>
        </c:if>

        <div class="form-add">
            <label for="id">ID Product</label>
            <input type="number" class="form-control" name="id" id="id" required>
        </div>
        <div class="form-add">
            <label for="code">Code Product</label>
            <input type="text" class="form-control" name="code" id="code" required>
        </div>
        <div class="form-add">
            <label for="inputName">Name Product</label>
            <input type="text" class="form-control" name="inputName" id="inputName" required>
        </div>
        <div class="form-add">
            <label for="date">Date Import</label>
            <input type="date" class="form-control" name="date" id="date" required>
        </div>
        <div class="form-add">
            <label for="description">Description Product</label>
            <input type="text" class="form-control" name="description" id="description" required>
        </div>
        <div class="form-add">
            <label for="production">Production Name</label>
            <input type="text" class="form-control" name="productionName" id="production" required>
        </div>
        <div class="form-add">
            <label for="amount">Amount</label>
            <input type="number" class="form-control" name="amount" id="amount" required>
        </div>
        <div class="form-add">
            <label for="price">Price</label>
            <input type="number" class="form-control" name="price" id="price" required>
        </div>

        <div><button type="submit" class="btn btn-primary form-control">Submit</button></div>
    </form>
</div>
</body>
<script src="../js/jquery.slim.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../bootstrap/dist/js/bootstrap.min.js"></script>
<script src="../bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="../js/custom.js"></script>
</html>
