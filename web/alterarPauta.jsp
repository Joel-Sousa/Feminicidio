<%@include file="funcoes.jsp"%>
<%--<%@include file="autentica.jsp"%>--%>
<%@page contentType="text/html; charset=utf8"%> 

<% 
    String PAUTA = request.getParameter("PAUTA");
    int ID_PAUTA = Integer.parseInt(request.getParameter("ID_PAUTA"));
    int ID_ATA = Integer.parseInt(request.getParameter("ID_ATA"));
    boolean myrs = alterarPauta( PAUTA,   ID_PAUTA ) ;
    if (myrs) {
%>

<script>
    alert("Pauta alterada com Sucesso !");
</script>

<%
} else {
%>
<script>
    alert("Não foi Possível Alterar a Ata");
</script>
<%
    }
%>

<script>
    ID_ATA=<%=ID_ATA%>;
    $("#tdPauta").load("enchePautaAtas.jsp", {ID_ATA: ID_ATA});
</script>