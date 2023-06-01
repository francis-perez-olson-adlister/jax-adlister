<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jamesolson
  Date: 5/30/23
  Time: 3:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<%--<div class="input-group mb-3">--%>
<%--    <form action="/Search" method="post" id="search">--%>
<%--        <input type="text" class="form-control" aria-label="Default"--%>
<%--               aria-describedby="inputGroup-sizing-default"  name="inputvalue">--%>
<%--        <div class="input-group-prepend">--%>
<%--            <button>search</button>--%>
<%--        </div>--%>
<%--    </form>--%>

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
