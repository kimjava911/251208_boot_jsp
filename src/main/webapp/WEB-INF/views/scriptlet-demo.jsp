<%@ page import="java.time.LocalDateTime" %>
<%@ page contentType="text/html;charset=UTF-8"%>

<html>
<head>
    <title>스크립틀릿 비교 실습</title>
</head>
<body>
    <%--
        1. 선언문 <%! %> -> Controller 멤버 변수
        - 페이지 최초 로딩 시 1번 실행되는 값
        - 모든 요청(접속)이 공유하는 값
    --%>
    <%!
        // jsp -> servlet 변수 -> 서버 재시작 전까지 이 값이 유지
        private int globalVisitCount = 0;

        public String formatPrice(int price) {
            return String.format("%,d원", price);
        }
    %>
    <%--
        2. 스크립틀릿 <% %>
        일반적 자바 코드. 지역 scope.
        매 요청마다 새롭게 실행
    --%>
    <%
        int localVisitCount = 1;

        globalVisitCount++;
        localVisitCount++; // 2 -> 매번 다시 1이 되기 때문에 ++1해서 늘어나지 않고 이 연산 이후 2로 고정된듯이 보임

        LocalDateTime now = LocalDateTime.now();

        // 조건문
        String greeting;
        int hour = now.getHour();
        if (hour < 12) {
            greeting = "좋은 아침!";
        } else if (hour < 18) {
            greeting = "좋은 오후!";
        } else {
            greeting = "좋은 저녁!";
        }
    %>

    <%-- 3. 표현식 <%= %>   --%>

    <h1>스크립틀릿 유형별 비교</h1>
    <h2>1. 표현식 (Expression) 사용 예시</h2>
    <p><%= greeting %></p>
    <%-- String -> toString --%>
    <p>현재 시각: <%= now %></p>
    <p>상품 가격: <%= formatPrice(1500000) %> </p>

    <h2>2. 변수 스코프</h2>
    <table border="1">
        <tr>
            <th>변수 종류</th>
            <th>값</th>
            <th>설명</th>
        </tr>
        <tr>
            <td>globalVisitCount (선언문)</td>
            <td><%= globalVisitCount %></td>
            <td>서버 종료까지 유지</td>
        </tr>
        <tr>
            <td>localVisitCount (스크립틀릿)</td>
            <td><%= localVisitCount %></td>
            <td>요청마다 새로운 1 값을 받음</td>
        </tr>
    </table>
</body>
</html>
