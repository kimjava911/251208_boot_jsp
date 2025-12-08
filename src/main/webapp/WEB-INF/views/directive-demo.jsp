<%@ page contentType="text/html;charset=UTF-8"%>
<%--<%@ page session="false" %>--%>
<%@ page session="true" %>
<%-- 세션 내장 객체 사용 관련 --%>

<%-- 에러 발생시... --%>
<%@ page errorPage="/WEB-INF/views/error/500.jsp" %>
<html>
<head>
    <title>디렉티브 학습</title>
</head>
<body>
    <%= session.getId() %>
    <% throw new Exception("에러 발생"); %>
</body>
</html>
