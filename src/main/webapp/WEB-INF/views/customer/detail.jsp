<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param name="pageTitle" value="${customer.name}"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/common/nav.jsp">
    <jsp:param name="currentPage" value="customers"/>
</jsp:include>
<h2>고객 상세 정보</h2>
</body>
</html>
