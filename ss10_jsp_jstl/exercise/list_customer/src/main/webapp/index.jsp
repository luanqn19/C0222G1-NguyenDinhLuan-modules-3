<%@ page import="model.Customer" %><%--
  Created by IntelliJ IDEA.
  User: Dinh Luan
  Date: 5/27/2022
  Time: 1:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>$Title$</title>
  <style>
    table {
      border-collapse: collapse;
    }

    table td {
      width: 50px;
      height: 30px;
      text-align: center;
    }

    td img {
      width: inherit;
      height: auto;
    }
  </style>
</head>
<body>
<table border="1px" width="500px">
  <tr>
    <th>Tên</th>
    <th>Ngày sinh</th>
    <th>Địa chỉ</th>
    <th>Ảnh</th>
  </tr>
  <c:forEach items="${listCustomer}" var="customer">
    <tr>
      <td>${customer.name}</td>
      <td>${customer.birthDay}</td>
      <td>${customer.address}</td>
      <td>
        <img src="${customer.pathFile}" alt="img-customer">
      </td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
