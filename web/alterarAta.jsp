<%@include file="funcoes.jsp"%>
<%--<%@include file="autentica.jsp"%>--%>
<%@page contentType="text/html; charset=utf8"%> 

<% 
    String RESUMO = request.getParameter("RESUMO");
    String DT_ATA = request.getParameter("DT_ATA");
    String LOCAL = request.getParameter("LOCAL");
    String MATRICULA = request.getParameter("MATRICULA");
    String PREFIXO = request.getParameter("PREFIXO");
    int ID_ATA = Integer.parseInt(request.getParameter("ID_ATA"));

    boolean myrs = alterarAta(RESUMO, DT_ATA, LOCAL, MATRICULA, PREFIXO, ID_ATA);
    if (myrs) {
%>

<script>
    alert("Gravado com Sucesso !");
</script>

<%
} else {
%>
<script>
    alert("Falha na Gravaçao !");
</script>
<%
    }
%>

<script>
    ID_ATA =<%=ID_ATA%>;
    detalhaMinhasAtas(ID_ATA);
</script>