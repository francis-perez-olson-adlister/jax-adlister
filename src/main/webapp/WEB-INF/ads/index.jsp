<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Here Are all the ads!</h1>
<jsp:include page="/search.jsp"/>

    <c:forEach var="ad" items="${ads}">
        <div class="adCard col-md-4">
            <div>
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
