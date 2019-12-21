<%@include file="funcoes.jsp"%>
<%--<%@include file="autentica.jsp"%>--%>
<%@page contentType="text/html; charset=utf8"%> 

<%   
    int ID_ATA = 0;
    String MATRICULA = (request.getParameter("MATRICULA"));
    //String CARGO = (request.getParameter("CARGO"));
    int PREFIXO = Integer.parseInt(request.getParameter("PREFIXO"));

    ResultSet myrs = inserirNovaAta( MATRICULA,  PREFIXO);
    if (myrs.next()) {
        ID_ATA = myrs.getInt(1);
    } else {
%>
<script>
    alert("Falha na Gravaçao !");
</script>
<%}%>

<script>
    ID_ATA =<%=ID_ATA%>;
    $("#divIdAta").html("# " + ID_ATA);
    $("#txtIdAta").val(ID_ATA);
    $("#tdMain").load("cadastroAta.jsp", {ID_ATA: ID_ATA});
    $("#btnNovaAta").attr("disabled", true);
    $("#btnEnviar").attr("disabled", false);
   detalhaMinhasAtas(ID_ATA);

    //Continuar aqui - 28/08/2019
    //Habilitar o Botão Salvar
    //$("#btnEnviar").
    
    //Desabilitar Boão - Começar Nova Ata
    //$("#btnNovaAta").
    
</script>