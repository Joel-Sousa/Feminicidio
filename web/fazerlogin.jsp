<%@include file="funcoes.jsp"%>
<%--<%@include file="autentica.jsp"%>--%>
<%@page contentType="text/html; charset=utf8"%> 

<% 
    String MATRICULA =(request.getParameter("usuario"));
    if(MATRICULA!=null){
          session.setAttribute("MATRICULA", MATRICULA);
    }
    ResultSet myrs = login(MATRICULA);
    if (myrs.next()) {
      
        String usuario = (String) request.getAttribute("MATRICULA");
%>
    <script>
        $("#main").load("minhasAtas.jsp", {PREFIXO:prefixoUser});
    </script>

<%
} else {}
%>
