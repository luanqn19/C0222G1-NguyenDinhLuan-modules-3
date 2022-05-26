<%--
  Created by IntelliJ IDEA.
  User: Dinh Luan
  Date: 5/26/2022
  Time: 11:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <style>
        .item-form {
          padding: 10px 30px;
        }
        .item-form label {
          display: inline-block;
          width: 150px;
        }
        .form-cointainer button {
          margin: 10px 30px;
        }
        .form-cointainer {
          border: solid 1px;
          width: fit-content;
          position: relative;
          left: 35%;
        }
    </style>
</head>
<body>
<form action="display-discount" method="post">
    <div class="form-cointainer">
        <div class="item-form description">
          <label> Product Description: </label>
          <input type="text" name="description">
        </div>
        <div class="item-form list-price">
            <label>List Price: </label>
            <input type="number" name="list-price">
        </div>
        <div class="item-form discount-percent">
            <label>Discount Percent: </label>
          <input type="number" name="discount-percent">
        </div>
        <button type="submit">Calculator</button>
    </div>
</form>
</body>
</html>
