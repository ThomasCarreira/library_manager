<%@ page import="ch.hesge.library.domaine.Book" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: thomas.carreira
  Date: 15.11.2018
  Time: 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Liste de Livres</title>
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
        <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-danger" role="alert">
            <%=request.getAttribute("error")%>
        </div>
        <% } %>
        <table class="table">
            <thead>
            <tr>
                <th scope="col">Titre</th>
                <th scope="col">Auteur(s)</th>
                <th scope="col">Editeur</th>
                <th scope="col">Année</th>
                <th></th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Book> books = (List<Book>) request.getAttribute("books");
                for (Book book : books) {
            %>
            <tr>
                <form action="/secure/modify" method="post">
                    <td><input type="text" class="form-control" name="titre" value="<%= book.getTitre() %>"></td>
                    <td><input type="text" class="form-control" name="auteur" value="<%= book.getAuteur() %>"></td>
                    <td><input type="text" class="form-control" name="editeur" value="<%= book.getEditeur() %>"></td>
                    <td><input type="number" maxlength="4" max="9999" min="1000" class="form-control" name="annee" value="<%= book.getAnnee() %>"></td>
                    <td>
                        <input type="hidden" name="id" value="<%= book.getId() %>">
                        <input type="submit" value="Modif." class="btn btn-primary">
                </form>
                </td>
                <td>
                    <form action="/secure/delete" method="post">
                        <input type="hidden" name="id" value="<%= book.getId() %>">
                        <input type="submit" value="Suppr." class="btn btn-danger">
                    </form>
                </td>
            </tr>
            <%}%>
            </tbody>
        </table>
        <form method="get" action="/secure/new">
            <input class="btn btn-primary" type="submit" value="Nouveau" />
        </form>
    </div>
</div>
</body>
</html>
