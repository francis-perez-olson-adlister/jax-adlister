<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="/ads">AdCentral</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <%-- Display login button if user is not logged in --%>
            <% if (session.getAttribute("user") == null) { %>
            <li><a href="/login">Login/Register</a></li>
            <% } %>
            <%-- Display logout button if user is logged in --%>
            <% if (session.getAttribute("user") != null) { %>
            <li><a href="/logout">Logout</a></li>
            <% } %>
        </ul>
        <form action="/Search" method="post" id="search">
            <div class="input-group">
                <input type="text" name="inputvalue" class="form-control">
                <div class="input-group-append">
                    <button type="submit" class="btn btn-primary">Search</button>
                </div>
            </div>
        </form>
    </div><!-- /.navbar-collapse -->
</nav>
