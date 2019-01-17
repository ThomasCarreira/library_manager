<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body>
<div class="container">
<nav class="navbar navbar-light bg-light">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/index">App Bibliothèque</a>
    <a class="nav-link active" href="${pageContext.request.contextPath}/bookList">Livres</a>
    <% if (request.getRemoteUser() == null) {
        if (!"/WEB-INF/connexion.jsp".equals(request.getServletPath())) {
    %>
    <a class="btn btn-primary" href="${pageContext.request.contextPath}/secure/login">Connexion</a>
    <%
        }
    } else {
    %>
    <a class="btn btn-primary" href="${pageContext.request.contextPath}/secure/logout">Déconnexion</a>
    <% }%>
</nav>
</div>
</body>
</html>
