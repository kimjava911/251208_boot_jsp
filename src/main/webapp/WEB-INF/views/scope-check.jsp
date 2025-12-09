<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Scope 학습</title>
</head>
<body>
    <h1>Scope</h1>
    <h2>Page Scope</h2>
    <p>
        <%= pageContext.getAttribute("pageData") %><br>
        ${pageContext.getAttribute("pageData")}<br>
        ${pageScope.pageData}<br>
        ${pageData}
    </p>
    <h2>Request Scope</h2>
    <p>
        <%= request.getAttribute("requestData") %><br>
        ${requestScope.requestData}<br>
        ${requestData}<br>
        ${pageData} | ${pageScope.pageData} | ${requestScope.pageData}
    </p>
    <h2>Session Scope</h2>
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
