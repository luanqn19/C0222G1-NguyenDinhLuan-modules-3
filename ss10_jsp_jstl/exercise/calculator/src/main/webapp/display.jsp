<%--
  Created by IntelliJ IDEA.
  User: Dinh Luan
  Date: 5/27/2022
  Time: 4:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${number2 == 0}">
    <p>Khong the chia number 2 = ${number2}</p>
</c:if>
<c:if test="${number2 != 0}">
    <p>Result: ${number1} ${operation} ${number2} = ${result}</p>
</c:if>

</body>
</html>
