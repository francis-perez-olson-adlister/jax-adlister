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
    <title>Title</title>
</head>
<body>

<div class="input-group mb-3">
    <div class="input-group-prepend">
        <span class="input-group-text" id="inputGroup-sizing-default">Search</span>
    </div>
    <form action="/search" method="POST">
        <input type="text" class="form-control" aria-label="Default"
               aria-describedby="inputGroup-sizing-default">
    </form>
</div>

</body>
</html>
