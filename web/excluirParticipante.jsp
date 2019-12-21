<%@include file="funcoes.jsp"%>
<%@page contentType="text/html; charset=utf8"%> 

<% 
    int ID_PARTICIPANTE = Integer.parseInt(request.getParameter("ID_PARTICIPANTE"));
    int ID_ATA = Integer.parseInt(request.getParameter("ID_ATA"));
    boolean myrs = excluirParticipante( ID_ATA,   ID_PARTICIPANTE ) ;
    if (myrs) {
%>

<script>
    alert("Participante excluido com Sucesso !");
</script>

<%
} else {
%>
<script>
    alert("Não foi Possível excluir Participante");
</script>
<%
    }
%>

<script>
    ID_ATA =<%=ID_ATA%>;
    $("#tdPartipante").load("encheParticipanteAtas.jsp", {ID_ATA: ID_ATA});
</script>