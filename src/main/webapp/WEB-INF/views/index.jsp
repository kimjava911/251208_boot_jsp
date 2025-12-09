<%-- 디렉티브 : page --%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%--<%@ page import="" %>--%>
<%-- 외부 의존성, 타입, 모듈... --%>
<%@ page import="java.util.List" %>
<%@ page import="kr.java.boot_jsp.model.entity.Customer" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%-- jsp action tag --%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param name="pageTitle" value="홈"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/nav.jsp">
    <jsp:param name="currentPage" value="home"/>
</jsp:include>

<%--<html>--%>
<%--<head>--%>
<%--    <title>고객 및 상품 관리</title>--%>
<%--</head>--%>
<%--<body>--%>
    <h1>고객 목록</h1>
    <%
        // 일반적인 스크립틀릿 -> 흐름제어, 변수 선언 등
        List<Customer> customers = (List<Customer>) request.getAttribute("customers");
        LocalDateTime serverTime = (LocalDateTime) request.getAttribute("serverTime");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    %>
    <p>서버 시간 : <%= serverTime.format(formatter) %></p>

    <% if (customers != null && !customers.isEmpty ()) { %>
    <% for (Customer customer : customers) { %>
        <div>
            <h3>
                <%-- 세부 페이지로 이동 / 고객 이름 --%>
                <a href="/customer/<%= customer.getId() %>">
                    <%= customer.getName() %></a></h3>
                <p>이메일 : <%= customer.getEmail() %></p>
                <p>보유 상품 수 : <%= customer.getProducts().size() %>개</p>
        </div>
    <% } // 반복문 닫아줌 %>
    <% } else { // null이거나 비어있을 때 %>
        <p>등록된 고객이 없습니다</p>
    <% } %>
</body>
</html>
