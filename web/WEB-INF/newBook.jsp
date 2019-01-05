<%--
  Created by IntelliJ IDEA.
  User: thomas.carreira
  Date: 16.11.2018
  Time: 09:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Nouveau Livre</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body>
<div class="container">
    <div class="panel-heading">
        <%@ include file="navbar.jspf" %>
    </div>
    <div class="panel-body">
        <form action="/secure/new" method="post">
            <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger" role="alert">
                <%=request.getAttribute("error")%>
            </div>
            <% } %>
            <div class="form-group">
                <label for="titre">Titre</label>
                <input type="text" class="form-control" name="titre" id="titre">
            </div>
            <div class="form-group">
                <label for="auteur">Auteur</label>
                <input type="text" class="form-control" name="auteur" id="auteur">
            </div>
            <div class="form-group">
                <label for="editeur">Editeur</label>
                <input type="text" class="form-control" name="editeur" id="editeur">
            </div>
            <div class="form-group">
                <label for="annee">Année</label>
                <input type="number" maxlength="4" max="9999" min="1000" class="form-control" name="annee" id="annee">
            </div>
            <input type="submit" class="btn btn-primary" value="Créer">
        </form>
    </div>
</div>
</body>
</html>