<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
    <style>
        img {
            width: 350px;
            height: 300px;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Here Are all the ads!</h1>
<%--<jsp:include page="/search.jsp"/>--%>

    <c:forEach var="ad" items="${ads}">
        <div class="adCard col-md-4">
            <div>
                <img src="https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg" alt="no image found" />
                <h2>${ad.title}</h2>
                <form action="/details" method="get">
                    <button class="details" id="detailsBtn" name="detailsBtn" value="${ad.id}">Details</button>
                </form>
            </div>
        </div>
    </c:forEach>
</div>
</body>
</html>
