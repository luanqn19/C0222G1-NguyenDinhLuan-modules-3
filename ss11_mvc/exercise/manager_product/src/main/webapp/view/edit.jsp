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
    <title>Edit Product</title>
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

    <c:if test="${messenger != null}">
        <h2 class="text-center">${messenger}</h2>
    </c:if>

    <table class="table table-striped table-inverse table-responsive">
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
        <c:forEach items="${productList}" var="p">
            <tr>
                <td>${p.idProduct}</td>
                <td>${p.codeProduct}</td>
                <td>${p.nameProduct}</td>
                <td>${p.dateImport}</td>
                <td>${p.descriptionProduct}</td>
                <td>${p.productionName}</td>
                <td>${p.amount}</td>
                <td>${p.price}</td>
                <td>
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modelId">
                        Edit
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <form action="/product" method="post">
        <div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Do you want edit this field?</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Do you want edit this product has?
                        <div id="a">
                            <input type="text" name="id" id="demo">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary"
                                data-dismiss="modal">NO
                        </button>
                        <input type="submit" class="btn btn-danger" name="action" value="update">
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
<script src="../js/jquery.slim.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../bootstrap/dist/js/bootstrap.min.js"></script>
<script src="../bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="../js/custom.js"></script>
</html>
