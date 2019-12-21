<%-- 
    Document   : logado
    Created on : 12/11/2019, 11:55:56
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
       String user = (String) session.getAttribute("nome");
        %>
        <%=user%>
        
        <h1>logado!</h1>
    </body>
</html>
