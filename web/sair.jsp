<%-- 
    Document   : sair
    Created on : 12/11/2019, 12:13:01
    Author     : joe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            session.removeAttribute("nome");
            response.sendRedirect("cadastrarUsuario.jsp");
        %>
    </body>
</html>
