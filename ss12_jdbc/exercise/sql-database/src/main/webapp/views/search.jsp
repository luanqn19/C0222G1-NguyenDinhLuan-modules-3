<%--
  Created by IntelliJ IDEA.
  User: Dinh Luan
  Date: 5/31/2022
  Time: 10:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Search</title>
</head>
<body>
<h2>
    <a href="/users">List User</a>
    <a href="/users?action=create">Add New User</a>
    <a href="/users?action=search">Search</a>
    <a href="/users?action=sort">List User Sort</a>
</h2>

<form action="/users?action=search" method="post">
    <label>Country: </label>
    <input type="text" name="country" required>
    <button type="submit">Search</button>
</form>

<div align="center">
    <c:choose>
        <c:when test="${listUser == null}">
            <p>${msgNotFound}</p>
        </c:when>
        <c:when test="${listUser != null}">
            <p>${msgFound}</p>
        </c:when>
    </c:choose>

    <table border="1" cellpadding="5">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.country}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
