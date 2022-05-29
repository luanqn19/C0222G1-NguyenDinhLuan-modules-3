<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Dinh Luan
  Date: 5/27/2022
  Time: 3:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <style>
    label {
      display: inline-block;
      width: 150px;
    }
  </style>
  <body>
  <form action="/calculator" method="post">
    <div>
      <label>First operand: </label>
      <input type="number" name="number1" required>
    </div>
    <div>
      <label>Second operand: </label>
      <input type="number" name="number2" required>
    </div>

    <select name="operation">
      <option value="cong">Cộng</option>
      <option value="tru">Trừ</option>
      <option value="nhan">Nhân</option>
      <option value="chia">Chia</option>
    </select>
    <br><br>
    <button type="submit">Calculator</button>
  </form>
  </body>
</html>
