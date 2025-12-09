<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%-- 네비게이션 메뉴 -> nav --%>
<% request.setAttribute("currentPage", request.getParameter("currentPage")); %>
<nav>
    <ul>
        <li>
            <a href="/"
            <c:if test="${currentPage eq 'home'}">
               style="font-weight: bold"
            </c:if>
            >홈</a>
        </li>
        <li>
            <a href="/customers"
            <c:if test="${currentPage eq 'customers'}">
               style="font-weight: bold"
            </c:if>
            >고객 관리</a>
        </li>
        <li>
            <a href="/products"
            <c:if test="${currentPage eq 'products'}">
               style="font-weight: bold"
            </c:if>
            >상품 관리</a>
        </li>
    </ul>
</nav>
