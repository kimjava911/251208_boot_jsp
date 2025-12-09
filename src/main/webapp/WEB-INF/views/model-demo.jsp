<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Scope 학습</title>
</head>
<body>
    <h2>Model</h2>
    <p>${message} (모델 - request) </p>
    <p>${sessionScope.message} (세션) </p>
    <p>${currentTime} (모델) </p>
    <p>${test} (세션)</p>

    <% session.setAttribute("test", "재방문 감사합니다"); %>
</body>
</html>
