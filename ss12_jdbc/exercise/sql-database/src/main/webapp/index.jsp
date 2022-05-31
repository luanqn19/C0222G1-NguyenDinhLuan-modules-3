<%--
  Created by IntelliJ IDEA.
  User: Dinh Luan
  Date: 5/31/2022
  Time: 3:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>User Management Application</title>
    <link rel="stylesheet" href="bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="fontawesome/css/all.css">
    <link rel="stylesheet" href="css/custom.css">
</head>
<body>
<h1 class="text-center">User Management</h1>
<h2>
    <a href="/users">List User</a>
    <a href="/users?action=create">Add New User</a>
    <a href="/users?action=search">Search</a>
    <a href="/users?action=sort">List User Sort</a>
</h2>
</body>
<script src="js/jquery.slim.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="bootstrap/dist/js/bootstrap.min.js"></script>
<script src="bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/custom.js"></script>
</html>
