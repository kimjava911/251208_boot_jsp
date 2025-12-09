<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%--
    공통 헤더 파일
    - CSS Framework -> Bootstrap
    - Google Analytics ...
    HTML -> body 시작까지.
    jsp:param -> getParameter
--%>
<html>
<head>
    <title>
        <% request.setAttribute("pageTitle", request.getParameter("pageTitle")); %>
        <c:if test="${not empty pageTitle}">
            ${pageTitle} -
        </c:if>
        고객 상품 관리 시스템
    </title>
    <%-- https://getbootstrap.com/ --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    <%-- https://noonnu.cc/ --%>
    <style>
        @font-face {
            font-family: 'Suit';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Thin.woff2') format('woff2');
            font-weight: 100;
            font-display: swap;
        }

        @font-face {
            font-family: 'Suit';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-ExtraLight.woff2') format('woff2');
            font-weight: 200;
            font-display: swap;
        }

        @font-face {
            font-family: 'Suit';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Light.woff2') format('woff2');
            font-weight: 300;
            font-display: swap;
        }

        @font-face {
            font-family: 'Suit';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
            font-weight: normal;
            font-display: swap;
        }

        @font-face {
            font-family: 'Suit';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Medium.woff2') format('woff2');
            font-weight: 500;
            font-display: swap;
        }

        @font-face {
            font-family: 'Suit';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-SemiBold.woff2') format('woff2');
            font-weight: 600;
            font-display: swap;
        }

        @font-face {
            font-family: 'Suit';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Bold.woff2') format('woff2');
            font-weight: 700;
            font-display: swap;
        }

        @font-face {
            font-family: 'Suit';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-ExtraBold.woff2') format('woff2');
            font-weight: 800;
            font-display: swap;
        }

        @font-face {
            font-family: 'Suit';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Heavy.woff2') format('woff2');
            font-weight: 900;
            font-display: swap;
        }

        * {
            font-family: Suit, sans-serif;
        }
    </style>
</head>
<body>
    <header>
        <h1>고객 상품 관리 시스템</h1>
    </header>