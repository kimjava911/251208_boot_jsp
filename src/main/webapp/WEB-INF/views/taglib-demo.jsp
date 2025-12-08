<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- JSTL --%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>taglib</title>
</head>
<body>
    <c:forEach items="${list}" var="item">
        <%-- for (String item : list) --%>
        <p>${item}</p>
        <c:if test="${item eq '사과'}">
            <p>나는 사과가 좋다</p>
        </c:if>
    </c:forEach>

</body>
</html>
