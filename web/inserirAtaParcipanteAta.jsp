<%@page import="javax.swing.JOptionPane"%>
<%@include file="funcoes.jsp"%>
<%--<%@include file="autentica.jsp"%>--%>
<%@page contentType="text/html; charset=utf8"%> 

<%   
String PARTICIPANTE = (request.getParameter("PARTICIPANTE"));
int ID_ATA = Integer.parseInt(request.getParameter("ID_ATA"));
int ID_PARTICIPANTE = 0;

    ResultSet myrs = inserirPartipante( PARTICIPANTE);  
         if(myrs.next()){
            ID_PARTICIPANTE = myrs.getInt(1);
         }  
        boolean inserirAtaParticipanteAta = inserirAtaParticipanteAta( ID_ATA,ID_PARTICIPANTE);
        if (inserirAtaParticipanteAta) {}           
%>

<script>
    ID_ATA =<%=ID_ATA%>;
    $("#tdPartipante").load("encheParticipanteAtas.jsp", {ID_ATA: ID_ATA});
    $("#txtParticipante").val("");
</script>