<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isErrorPage="true" %>
<%-- exception 내장 객체 --%>
<html>
<head>
    <title>오류 발생</title>
</head>
<body>
    <h1>오류가 발생했습니다</h1>
    <p><%= exception.getMessage() %></p>
</body>
</html>
