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
</head>
<body>
<div class="container">
    <div class="panel-body">
        <form action="${pageContext.request.contextPath}/secure/new" method="post">
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