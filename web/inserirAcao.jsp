<%@include file="funcoes.jsp"%>
<%@page contentType="text/html; charset=utf8"%> 

<%   
String ACAO = (request.getParameter("ACAO"));
int ID_ATA = Integer.parseInt(request.getParameter("ID_ATA"));
int ID_PAUTA = Integer.parseInt(request.getParameter("ID_PAUTA"));
int ID_ACAO=0;

         ResultSet myrs = inserirAcao(ACAO);  
         if(myrs.next()){
            ID_ACAO = myrs.getInt(1);
            boolean inserirAtaAcaoAta = inserirAtaAcaoAta(ID_ATA, ID_PAUTA, ID_ACAO ); 
            if(inserirAtaAcaoAta){}
            
%>

<%
}
%>

<script>
    ID_ATA=<%=ID_ATA%>;
    ID_PAUTA=<%=ID_PAUTA%>;
    $("#tdAcoes_" + ID_PAUTA).load("encheAcaoAtas.jsp", {ID_ATA: ID_ATA, ID_PAUTA: ID_PAUTA});
//    detalhaMinhasAtas(ID_ATA);
</script>