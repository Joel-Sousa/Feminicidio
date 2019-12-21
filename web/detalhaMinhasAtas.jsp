<%@include file="funcoes.jsp"%>
<%@page contentType="text/html; charset=utf8"%> 
<%
int ID_ATA = Integer.parseInt(request.getParameter("ID_ATA"));
ResultSet rs;
rs = detalhaMinhasAtas(ID_ATA);
if (rs.next()) {
%>



<script>
    ID_ATA =<%=rs.getString("ID_ATA")%>;
    PREFIXO =<%=rs.getString("PREFIXO")%>;
    
    conteudo="";
    if (prefixoUser == 9270 || prefixoUser == 9007 || prefixoUser == 9010) {
        conteudo=""+conteudo+"   <span onClick='mnu()'  style='color: #003eff; cursor: pointer; '>Denúncias Gerais > </span>";
    }
    conteudo=""+conteudo+"  <span  onClick='listarAtas("+PREFIXO+")' style='color: #003eff; cursor: pointer;' >Minhas Denúncias > </span>";
    conteudo=""+conteudo+"  <span   style='color: #000'>Detalhar Denúncia</span>";

    $("#divMigalhaMnu").html(conteudo);
    
    $("#divIdAta").html("# "+ID_ATA);

    $("#txtPauta").val("");

    RESUMO = "<%=rs.getString("RESUMO")%>" ;
    $("#txtResumo").val(RESUMO);


    DT_ATA = "<%=rs.getString("DT_ATA")%>" ;
    $("#txtDtAta").val(DT_ATA);

    LOCAL = "<%=rs.getString("LCL")%>" ;
    $("#txtLocalAta").val(LOCAL);

    
    
     $("#btnEnviar").attr("disabled", false);
     $("#btnEnviar").focus();
     
    if ($.trim(RESUMO) === "" & $.trim(DT_ATA) === "" & $.trim(LOCAL) === "") {
        $("#tdMigalhaAta").html("Nova Denuncia");
        $("#txtResumo").focus();
        $("#tbParticipante").hide();
    }else{
        $("#tdMostrarBoxPauta").show();
         $("#tdMigalhaAta").html("ATA");
        $("#txtPauta").focus();
        $("#tbPauta").show();
        $("#tbParticipante").show();
    }     
    
    
    PAUTA="<%=rs.getString("PAUTA")%>";
    if ($.trim(PAUTA) === "") {}
    else{
        $("#tdMostrarBoxPauta").hide();
        $("#tdMigalhaPauta").html("<b style='color: black;'>Pautas:</b>");
        
    }
</script>

<%}%> 

