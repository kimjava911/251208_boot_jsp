<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%-- taglib --%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>--%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<html>
<head>
    <title>JSTL DEMO</title>
</head>
<body>
<%-- 테스트 데이터 설정 --%>
<%
    // 상품 목록 시뮬레이션
    List<Map<String, Object>> products = new ArrayList<>();

    Map<String, Object> p1 = new HashMap<>();
    p1.put("name", "노트북");
    p1.put("price", 1500000);
    p1.put("stock", 5);
    products.add(p1);

    Map<String, Object> p2 = new HashMap<>();
    p2.put("name", "마우스");
    p2.put("price", 35000);
    p2.put("stock", 0);  // 재고 없음
    products.add(p2);

    Map<String, Object> p3 = new HashMap<>();
    p3.put("name", "키보드");
    p3.put("price", 89000);
    p3.put("stock", 12);
    products.add(p3);

    request.setAttribute("products", products);
//    request.setAttribute("userRole", "admin");
    request.setAttribute("userRole", "user");
    request.setAttribute("currentDate", new java.util.Date());
    request.setAttribute("bigNumber", 1234567890);
    request.setAttribute("ratio", 0.156789);
%>

<%-- <%= %> -> ${} -> c:out --%>
<h2>1. c:out 안전한 출력</h2>
<% request.setAttribute("userInput", "<script>alert('해킹 당했으니 비트코인 만원 어치 주세요')</script>"); %>
<h3>EL 출력</h3>
<p>${userInput}</p>
<h3>c:out</h3>
<p><c:out value="${userInput}" /></p>
<p><c:out value="${noValue}" default="기본값" /></p>

<h2>2. c:set 변수 설정</h2>
<c:set var="siteName" value="JSTL 학습용 사이트" />
<p> 사이트 이름 : ${siteName}</p>
<%--<p> ${pageContext.siteName} </p>--%>
<p> ${requestScope.siteName}</p>
<c:set var="discountRate" value="0.15" />
<%-- 숫자 값이라면 알아서 변환 --%>
<p> 할인율 : ${discountRate * 100}% </p>

<h2>3. c:if 단일 조건문</h2>
<c:if test="${userRole == 'admin'}">
    <p>저는 관리자입니다</p>
</c:if>
<c:if test="${userRole != 'admin'}">
    <p>저는 일반유저입니다</p>
</c:if>

<c:if test="${empty products}">
    <p>상품이 없습니다</p>
</c:if>
<c:if test="${not empty products}">
    <p>상품의 개수는 ${products.size()}개 입니다</p>
</c:if>

<h2> 4. c:choose 다중조건문 -> c:when, c:otherwise (if-else, else if)</h2>

<% request.setAttribute("dice", (new Random()).nextInt(6) + 1); %>
<c:choose>
<%-- 맨위에 있는 내용부터 검사 -> 아무것도 해당하지 않으면 otherwise  --%>
    <c:when test="${dice <= 3}">
        <%-- 1 ~ 3 사이가 당첨 --%>
        <p>주사위 눈 : ${dice} (당첨)</p>
    </c:when>
    <c:when test="${dice <= 5}">
        <%-- 4 ~ 5 사이가 낙첨 --%>
        <p>주사위 눈 : ${dice} (낙첨)</p>
    </c:when>
    <c:otherwise>
        <p>주사위 눈 : ${dice} (재도전)</p>
    </c:otherwise>
</c:choose>

<h2>5. c:forEach 반복문</h2>
<h3>상품 목록</h3>
<table border="1">
    <tr>
        <th>번호</th>
        <th>상품명</th>
        <th>가격</th>
        <th>재고</th>
        <th>상태</th>
    </tr>
    <c:forEach items="${products}" var="product" varStatus="status">
        <%-- var -> el. --%>
        <%-- varStatus -> index(0), count(1), first, last...       --%>

        <tr>
            <td>
                    ${status.count}
                    <c:if test="${status.first}">
                        <p>첫번째 데이터</p>
                    </c:if>
                    <c:if test="${status.last}">
                        <p>마지막 데이터</p>
                    </c:if>
            </td>
            <td>${product.name}</td>
            <td><fmt:formatNumber value="${product.price}" type="number" />원</td>
            <td>${product.stock}개</td>
        </tr>
    </c:forEach>
</table>

<h3>숫자 반복</h3>
<c:forEach begin="1" end="5" var="num">
    <%-- 끝점 포함 --%>
    <p>${num}</p>
</c:forEach>

<h3>varStatus 활용</h3>
<c:forEach items="${products}" var="product" varStatus="s">
    <li>
        index : ${s.index}<br>
        count : ${s.count}<br>
        first : ${s.first}<br>
        last : ${s.last}
    </li>
</c:forEach>

<h2>6. fmt 태그 - 형식화</h2>
<h3>숫자 형식화</h3>
<table border="1">
    <tr>
        <th>원본</th>
        <th>형식</th>
        <th>결과</th>
    </tr>
    <tr>
        <td>${bigNumber}</td>
        <td>천단위 구분</td>
        <td><fmt:formatNumber value="${bigNumber}" type="number"/></td>
    </tr>
    <tr>
        <td>${ratio}</td>
        <td>퍼센트</td>
        <td><fmt:formatNumber value="${ratio}" type="percent"/></td>
    </tr>
    <tr>
        <td>1500000</td>
        <td>통화</td>
        <td><fmt:formatNumber value="1500000" type="currency" currencySymbol="₩"/></td>
    </tr>
    <tr>
        <td>${ratio}</td>
        <td>소수점 2자리</td>
        <td><fmt:formatNumber value="${ratio}" pattern="#.##"/></td>
    </tr>
</table>

<h3>날짜 형식화</h3>
<table border="1">
    <tr>
        <th>형식</th>
        <th>결과</th>
    </tr>
    <tr>
        <td>date (날짜만)</td>
        <td><fmt:formatDate value="${currentDate}" type="date"/></td>
    </tr>
    <tr>
        <td>time (시간만)</td>
        <td><fmt:formatDate value="${currentDate}" type="time"/></td>
    </tr>
    <tr>
        <td>both (날짜+시간)</td>
        <td><fmt:formatDate value="${currentDate}" type="both"/></td>
    </tr>
    <tr>
        <td>커스텀 패턴</td>
        <td><fmt:formatDate value="${currentDate}" pattern="yyyy년 MM월 dd일 (E)"/></td>
    </tr>
</table>

<h2>7. 스크립틀릿 vs JSTL 비교</h2>
<table border="1">
    <tr>
        <th>기능</th>
        <th>스크립틀릿</th>
        <th>JSTL</th>
    </tr>
    <tr>
        <td>조건문</td>
        <td><code>&lt;% if (조건) { %&gt; ... &lt;% } %&gt;</code></td>
        <td><code>&lt;c:if test="조건"&gt; ... &lt;/c:if&gt;</code></td>
    </tr>
    <tr>
        <td>반복문</td>
        <td><code>&lt;% for (...) { %&gt; ... &lt;% } %&gt;</code></td>
        <td><code>&lt;c:forEach&gt; ... &lt;/c:forEach&gt;</code></td>
    </tr>
    <tr>
        <td>값 출력</td>
        <td><code>&lt;%= 값 %&gt;</code></td>
        <td><code>&#36;{값}</code> 또는 <code>&lt;c:out&gt;</code></td>
    </tr>
</table>

</body>
</html>
