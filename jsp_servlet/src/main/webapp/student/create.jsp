<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 7/28/2023
  Time: 09:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/students?action=create">
    <input name="code">
    <input name="nameStudent">
    <input name="point">
    <input name="idCard">
    <input name="codeClass">
    <button type="submit">Create</button>
</form>
</body>
</html>
