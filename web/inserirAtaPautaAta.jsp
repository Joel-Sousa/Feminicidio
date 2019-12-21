<%@include file="funcoes.jsp"%>
<%--<%@include file="autentica.jsp"%>--%>
<%@page contentType="text/html; charset=utf8"%> 

<%   
String PAUTA = (request.getParameter("PAUTA"));
int ID_ATA = Integer.parseInt(request.getParameter("ID_ATA"));
int ID_PAUTA=0;
//System.out.println("ID_ATA: "+ ID_ATA);

         ResultSet myrs = inserirPauta(PAUTA);  
         if(myrs.next()){
            ID_PAUTA = myrs.getInt(1);
//            System.out.println("ID_PAUTA "+ ID_PAUTA);
            boolean inserirAtaPautaAta = inserirAtaPautaAta(ID_ATA, ID_PAUTA);
            if (inserirAtaPautaAta) {}
         }  
%>

<script>
    ID_ATA=<%=ID_ATA%>;
    detalhaMinhasAtas(ID_ATA);
</script>