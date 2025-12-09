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

    <h2>5. 컬렉션 접근</h2>
    <table border="1">
        <tr>
            <th>접근 방식</th>
            <th>EL 표현식</th>
            <th>결과</th>
        </tr>
        <tr>
            <td>인덱스로 접근</td>
            <td><code>&#36;{fruits[0]}</code></td>
            <td>${fruits[0]}</td>
        </tr>
        <tr>
            <td>두 번째 요소</td>
            <td><code>&#36;{fruits[1]}</code></td>
            <td>${fruits[1]}</td>
        </tr>
    </table>

    <h2>6. 명시적 스코프 지정</h2>
    <%
        // 서로 다른 스코프에 같은 이름으로 저장
        pageContext.setAttribute("message", "페이지 스코프 메시지");
        request.setAttribute("message", "리퀘스트 스코프 메시지");
        session.setAttribute("message", "세션 스코프 메시지");
    %>
    <table border="1">
        <tr>
            <th>스코프</th>
            <th>EL 표현식</th>
            <th>결과</th>
        </tr>
        <tr>
            <td>자동 탐색</td>
            <td><code>&#36;{message}</code></td>
            <td>${message} (가장 좁은 pageScope에서 발견)</td>
        </tr>
        <tr>
            <td>pageScope 명시</td>
            <td><code>&#36;{pageScope.message}</code></td>
            <td>${pageScope.message}</td>
        </tr>
        <tr>
            <td>requestScope 명시</td>
            <td><code>&#36;{requestScope.message}</code></td>
            <td>${requestScope.message}</td>
        </tr>
        <tr>
            <td>sessionScope 명시</td>
            <td><code>&#36;{sessionScope.message}</code></td>
            <td>${sessionScope.message}</td>
        </tr>
    </table>

    <h2>7. EL의 null 안전성</h2>
    <p>EL의 큰 장점: null이어도 에러가 나지 않고 빈 문자열로 처리됩니다.</p>
    <table border="1">
        <tr>
            <th>상황</th>
            <th>스크립틀릿</th>
            <th>EL</th>
        </tr>
        <tr>
            <td>null 출력</td>
            <td>NullPointerException 가능
                <%= request.getAttribute("nullValue") %>
                <%-- NullPointerException : 특정한 타입이 갖고 있는 속성이나 메서드를 호출 했을 때 해당 타입을 담은 변수에 null이 들어갈 경우 --%>
<%--                <%= ((String) request.getAttribute("nullValue")).length() %>--%>
            </td>
            <td>${nullValue} → (아무것도 출력 안 됨) ${nullValue.size}</td>
        </tr>
        <tr>
            <td>없는 변수</td>
            <td>null 반환 (<%= request.getAttribute("nonExistent") %>)</td>
            <td>${nonExistent} → (아무것도 출력 안 됨)</td>
        </tr>
    </table>

    <br>
    <br>
    <br>
    <br>
    <br>

</body>
</html>
