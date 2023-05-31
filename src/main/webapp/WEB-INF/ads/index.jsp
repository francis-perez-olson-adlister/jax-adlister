<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
    <style>
        .hidden {
            display: none;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Here Are all the ads!</h1>

    <c:forEach var="ad" items="${ads}">
        <div class="adCard col-md-6">
            <div>
                <h2>${ad.title}</h2>
                <p>${ad.description}</p>
            </div>
<%--            <form class = "editForm" action="/ads" method="post">--%>
<%--                <div class="form-group">--%>
<%--                    <label for="title">Title</label>--%>
<%--                    <input id="title" name="title" class="form-control" type="text" placeholder="${ad.title}">--%>
<%--                </div>--%>
<%--                <div class="form-group">--%>
<%--                    <label for="description">Description</label>--%>
<%--                    <textarea id="description" name="description" class="form-control" type="text" placeholder="${ad.description}"></textarea>--%>
<%--                </div>--%>
<%--                <button type="submit" class="btn btn-block btn-primary">Edit</button>--%>
<%--            </form>--%>
            <form action="/edit" method="get">
                <button class="edit" id="editButton" name="editButton" value=${ad.id}>Edit</button>
                <button class="delete" id="deleteButton" name="deleteButton" value=${ad.id}>Delete</button>
            </form>
        </div>
    </c:forEach>
</div>
<script>
    // let editButtons = document.getElementsByClassName("edit");
    //
    // editButtons.forEach((button)=> {
    //     button.addEventListener('click', () => {
    //         let hiddenElement = button.parentNode.firstElementChild;
    //         hiddenElement.toggleClass('hidden');
    //     });
    // });
</script>
</body>
</html>
