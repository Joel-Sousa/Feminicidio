<%-- 
    Document   : login
    Created on : 19/04/2019, 18:15:09
    Author     : joe
--%>

<%@include file="funcoes.jsp"%>
<%--<%@include file="autentica.jsp"%>--%>
<%@page contentType="text/html; charset=utf8"%> 

<!--<form method="post" action="fazerlogin.jsp">-->
    <input type="text" name="usuario" id="usuario" />
    <input type="password" name="senha" id="senha"/>
    <input onclick="login()" type="submit" name="btnSubmit" />&nbsp;&nbsp;&nbsp;
<!--</form>-->
<script>
   $("#usuario").val("");
   $("#senha").val("");
</script>