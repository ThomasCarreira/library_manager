<%@ page import="java.util.List" %>
<%@ page import="ch.hesge.library.book.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Liste de Livres</title>
</head>
<body>
<div class="container">
    <div class="panel-body">
        <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-danger" role="alert">
            <%=request.getAttribute("error")%>
        </div>
        <% } %>
        <% if (request.getAttribute("added") != null) { %>
        <div class="alert alert-success" role="alert">
            <%=request.getAttribute("added")%>
        </div>
        <% } %>
        <table class="table">
            <thead>
            <tr>
                <th scope="col">Titre</th>
                <th scope="col">Auteur(s)</th>
                <th scope="col">Editeur</th>
                <th scope="col">Année</th>
                <% if (request.getRemoteUser() != null) { %>
                <th></th>
                <th></th>
                <%}%>
            </tr>
            </thead>
            <tbody>
            <%
                List<Book> books = (List<Book>) request.getAttribute("books");
                for (Book book : books) {
            %>
            <tr>
                <% if (request.getRemoteUser() != null) { %>
                <form action="${pageContext.request.contextPath}/secure/modify" method="post">
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
                    <form action="${pageContext.request.contextPath}/secure/delete" method="post">
                        <input type="hidden" name="id" value="<%= book.getId() %>">
                        <input type="submit" value="Suppr." class="btn btn-danger">
                    </form>
                </td>
                <%} else {%>
                <td><%= book.getTitre() %></td>
                <td><%= book.getAuteur() %></td>
                <td><%= book.getEditeur() %></td>
                <td><%= book.getAnnee() %></td>
                <%}%>
            </tr>
            <%}%>
            </tbody>
        </table>
        <% if (request.getRemoteUser() != null) { %>
        <form method="get" action="${pageContext.request.contextPath}/secure/new">
            <input class="btn btn-primary" type="submit" value="Nouveau" />
        </form>
        <%}%>
    </div>
</div>
</body>
</html>
