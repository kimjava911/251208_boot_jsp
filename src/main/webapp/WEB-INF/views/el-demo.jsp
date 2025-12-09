<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html;charset=UTF-8"%>

<html>
<head>
    <title>EL DEMO</title>
</head>
<body>
    <h1>EL (Expression Language) 기본 문법</h1>
    <%-- 테스트용 데이터 --%>
    <%
        request.setAttribute("siteName", "테스트 사이트");
        request.setAttribute("visitorCount", 1234);
        request.setAttribute("price", 50000);
        request.setAttribute("discount", 0.1);
        request.setAttribute("now", LocalDateTime.now());

        List<String> fruits = Arrays.asList("사과", "바나나", "오렌지");
        request.setAttribute("fruits", fruits);

        request.setAttribute("nullValue", null);

        request.setAttribute("emptyList", new ArrayList<>());

        // Model -> model.addAttribute
    %>
    <%--  스크립틀릿 표현식  --%>
    <p><%= request.getAttribute("siteName") %></p>
    <%--  EL 문법  --%>
    <p>${siteName}</p>

    <h2>1. 기본값 출력</h2>
    <table border="1">
        <tr>
            <th>설명</th>
            <th>스크립틀릿</th>
            <th>EL</th>
            <th>결과</th>
        </tr>
        <tr>
            <td>단순 문자열</td>
            <td><code>
                <%-- less than -> "<" --%>
                <%-- greater than -> ">" --%>
                &lt;%= request.getAttribute("siteName") %&gt;
            </code></td>
            <td><code>
                &#36;{siteName}
            </code></td>
            <td>${siteName}</td>
        </tr>
        <tr>
            <td>숫자</td>
            <td><code>&lt;%= request.getAttribute("visitorCount") %&gt;</code></td>
            <td><code>&#36;{visitorCount}</code></td>
            <td>${visitorCount}</td>
        </tr>
    </table>

    <h2>2. 연산자 사용</h2>
    <table border="1">
        <tr>
            <th>연산</th>
            <th>EL 표현식</th>
            <th>결과</th>
        </tr>
        <tr>
            <td>산술 연산</td>
            <td><code>&#36;{price * (1 - discount)}</code></td>
            <td>${price * (1 - discount)}원 (할인가)</td>
        </tr>
        <tr>
            <td>비교 연산 (==, eq)</td>
            <td><code>&#36;{visitorCount == 1234}</code></td>
            <td>${visitorCount == 1234} ${visitorCount eq 1000}</td>
        </tr>
        <tr>
            <td>비교 연산 (>, gt)</td>
            <td><code>&#36;{visitorCount > 1000}</code></td>
            <td>${visitorCount > 1000} ${visitorCount gt 1000}
                ${visitorCount < 1000} ${visitorCount lt 1000}
                ${visitorCount >= 1000} ${visitorCount <= 1000}</td>
        </tr>
        <tr>
            <td>논리 연산 (&&, and)</td>
            <td><code>&#36;{visitorCount > 100 and price < 100000}</code></td>
            <td>
                ${visitorCount > 100 and price < 100000}
                ${visitorCount > 100 && price < 100000}
                ${visitorCount > 100 or price < 100000}
                ${visitorCount > 100 || price < 100000}
                ${!(visitorCount > 100)}
            </td>
        </tr>
    </table>

    <h2>3. empty 연산자 (핵심!)</h2>
    <p><code>empty</code>는 null, 빈 문자열, 빈 컬렉션 모두를 검사합니다.</p>
    <table border="1">
        <tr>
            <th>검사 대상</th>
            <th>EL 표현식</th>
            <th>결과</th>
        </tr>
        <tr>
            <td>null 값</td>
            <td><code>&#36;{empty nullValue}</code></td>
            <td>${empty nullValue} (null이면 true) ${nullValue}</td>
        </tr>
        <tr>
            <td>값이 있는 리스트</td>
            <td><code>&#36;{empty fruits}</code></td>
            <td>${empty fruits} (값이 있으면 false) ${fruits} </td>
        </tr>
        <tr>
            <td>빈 리스트</td>
            <td><code>&#36;{empty emptyList}</code></td>
            <td>${empty emptyList} (비어있으면 true)</td>
        </tr>
        <tr>
            <td>존재하지 않는 변수</td>
            <td><code>&#36;{empty noSuchVariable}</code></td>
            <td>${empty noSuchVariable} (없으면 true)</td>
        </tr>
    </table>

    <h2>4. 삼항 연산자</h2>
    <p><code>조건 ? 참일때값 : 거짓일때값</code></p>
    <table border="1">
        <tr>
            <th>상황</th>
            <th>EL 표현식</th>
            <th>결과</th>
        </tr>
        <tr>
            <td>리스트 비어있는지</td>
            <td><code>&#36;{empty fruits ? '과일 없음' : '과일 있음'}</code></td>
            <td>${empty fruits ? '과일 없음' : '과일 있음'}</td>
        </tr>
        <tr>
            <td>VIP 여부 판단</td>
            <td><code>&#36;{visitorCount > 1000 ? 'VIP' : '일반'}</code></td>
            <td>${visitorCount > 1000 ? 'VIP' : '일반'}</td>
        </tr>
    </table>












</body>
</html>
