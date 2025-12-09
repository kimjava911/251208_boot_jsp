<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Scope 학습</title>
</head>
<body>
    <h1>Scope</h1>
    <% pageContext.setAttribute("pageData", "현재 페이지(jsp)에서 유지되는 데이터"); %>
    <h2>Page Scope</h2>
    <p>
        <%= pageContext.getAttribute("pageData") %><br>
        ${pageContext.getAttribute("pageData")}<br>
        ${pageScope.pageData}<br>
        ${pageData}
    </p>
    <h2>Request Scope</h2>
    <% request.setAttribute("requestData", "이 데이터는 현재 요청 간 유효"); %>
    <% request.setAttribute("pageData", "이 데이터는 현재 요청 간 유효"); %>
    <p>
        <%= request.getAttribute("requestData") %><br>
        ${requestScope.requestData}<br>
        ${requestData}<br>
        ${pageData} | ${pageScope.pageData} | ${requestScope.pageData}
    </p>
    <h2>Session Scope</h2>
    <% session.setAttribute("sessionData", "서버가 종료되거나 쿠키 유실되기 전까지 유효"); %>
    <% Integer visitCount = (Integer) session.getAttribute("visitCount");
        if (visitCount == null) {
            visitCount = 1;
        } else {
            visitCount++;
        }
        session.setAttribute("visitCount", visitCount);
    %>
    <p>
        <%= session.getAttribute("sessionData") %>
        ${sessionScope.sessionData}
        ${sessionData}
        <%= session.getAttribute("visitCount") %>
    </p>
    <h2>Application Scope : '모든' 접속자에게 공유</h2>
    <% application.setAttribute("applicationData", "서버 실행 중 '모든 사용자 공유'"); %>
    <%
        Integer totalVisits = (Integer) application.getAttribute("totalVisit");
        if (totalVisits == null) {
            totalVisits = 1;
        } else {
            totalVisits++;
        }
        application.setAttribute("totalVisit", totalVisits);
    %>
    <p>
        <%= application.getAttribute("applicationData") %>
        ${applicationScope.applicationData}
        ${applicationData}
        <%= application.getAttribute("totalVisit") %>
    </p>
</body>
</html>
