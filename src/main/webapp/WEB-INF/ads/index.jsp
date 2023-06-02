<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
    <style>
        body {
            background-image: url("/img/background.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
        }

        .container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            grid-gap: 20px;
            margin-top: 10px; /* Add margin to adjust for the fixed navbar */
        }

        .container::before,
        .container::after {
            content: none;
        }

        .adCard {
            height: 420px;
            color: black;
            border-radius: 1rem;
            border: 1px solid transparent;
            backdrop-filter: blur(1rem);
            box-shadow: 1.3rem 1.3rem 1.3rem rgba(0, 0, 0, 0.5);
            border-top-color: rgba(225, 225, 225, 0.5);
            border-left-color: rgba(225, 225, 225, 0.5);
            border-bottom-color: rgba(225, 225, 225, 0.1);
            border-right-color: rgba(225, 225, 225, 0.1);
            background: linear-gradient(to right bottom, rgba(225, 225, 225, 0.5), rgba(225, 225, 225, 0.3));
        }

        .adCard > div {
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .adCard h2 {
            margin-top: 10px;
        }

        .adCard form {
            margin-top: 20px;
        }

        img {
            width: 100%;
            height: auto;
            object-fit: cover;
            border-radius: 1rem 1rem 0 0;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <c:forEach var="ad" items="${ads}">
        <div class="adCard">
            <img src="https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg" alt="no image found" />
            <div>
                <h2>${ad.title}</h2>
                <form action="/details" method="get">
                    <button class="btn btn-primary my-2 my-sm-0" id="detailsBtn" name="detailsBtn" value="${ad.id}">Details</button>
                </form>
            </div>
        </div>
    </c:forEach>
</div>
</body>
</html>
