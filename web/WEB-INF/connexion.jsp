<%--
  Created by IntelliJ IDEA.
  User: thomas.carreira
  Date: 09.11.2018
  Time: 09:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Connexion</title>
    </head>
    <body>
        <%@ include file="navbar.jsp" %>
        <div class="container">
            <div class="panel-body">
                <form action="j_security_check" method="POST">
                    <div class="form-group">
                        <label for="identifiant">Identifiant</label>
                        <input type="text" class="form-control" name="j_username" id="identifiant">
                    </div>
                    <div class="form-group">
                        <label for="password">Mot de passe</label>
                        <input type="password" class="form-control" name="j_password" id="password">
                    </div>
                    <input type="submit" class="btn btn-primary" value="Se connecter"/>
                </form>
            </div>
        </div>
    </body>
</html>
