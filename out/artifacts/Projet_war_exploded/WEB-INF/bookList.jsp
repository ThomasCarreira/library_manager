<%@ page import="java.util.List" %>
<%@ page import="ch.hesge.library.domaine.Book" %><%--
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
        <table class="table">
            <thead>
            <tr>
                <th scope="col">Titre</th>
                <th scope="col">Auteur(s)</th>
                <th scope="col">Editeur</th>
                <th scope="col">Année</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Book> books = (List<Book>) request.getAttribute("books");
                for (Book book : books) {
            %>
            <tr>
                <td><%= book.getTitre() %></td>
                <td><%= book.getAuteur() %></td>
                <td><%= book.getEditeur() %></td>
                <td><%= book.getAnnee() %></td>
            </tr>
            <%}%>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
