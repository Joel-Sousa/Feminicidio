<%@include file="funcoes.jsp"%>
<%@page contentType="text/html; charset=utf8"%> 

<%
    int ID_ATA = Integer.parseInt(request.getParameter("ID_ATA"));
    ResultSet rs;
    rs = enchePautaAtas(ID_ATA);
    while (rs.next()) {
    if (rs.getString("ID_PAUTA").equals("")) {} else{
%>
<table  style="padding-bottom: 50px;">
    <tr>
        <td style="border: 1px solid #CCCCCC; border-radius: 20px;  padding: 10px;  ">
            <div style=" font-size: 17px; font-weight: bold; text-transform: uppercase;  border-botom: 1px solid #ccccc; padding-left: 10px; " class="list-group-item"  >
                <table>
                    <tr id="trxPauta_<%=rs.getString("ID_PAUTA")%>">
                        <td style=" color: #000; font-size: 15px; font-weight: bold; text-transform: uppercase;  border-botom: 1px solid #ccccc; padding-left: 10px; "  >
                            <div id="divPauta"  ><%=rs.getString("PAUTA")%></div>
                        </td>
                        
                        <td style="float: right; border: 0px solid #CCCCCC;"  class="ex1" >
                             <div onClick="abreCampoPauta(1, <%=rs.getString("ID_PAUTA")%>)" >
                                  <i    class="edit fas fa-1x fa-pencil-alt" ></i>
                             </div>
                        </td>
                    </tr>
                    
                    <tr id="trxPautaAltera_<%=rs.getString("ID_PAUTA")%>" style="display: none;">
                        <td style=" font-size: 15px; font-weight: bold; text-transform: uppercase;  border-botom: 1px solid #ccccc; padding-left: 10px; "  >
                            <input id="txtPauta_<%=rs.getString("ID_PAUTA")%>" value="<%=rs.getString("PAUTA")%>" class="form-control"  style="text-transform: uppercase;">
                        </td>
                        
                         <td style="width: 20px; padding-bottom: 22px; padding-left: 6px;">
                            <div style="position: relative; top: 11px;"><i class="closeX far fa-times-circle" style="cursor: pointer;" onClick="abreCampoPauta(2, <%=rs.getString("ID_PAUTA")%>)"></i></div>
                        </td>
                        
                         <td style="float: right" onClick="alterarPauta(<%=ID_ATA%>,<%=rs.getString("ID_PAUTA")%>)">
                             <div style="position: relative; top: 3px; background: #ffffff; cursor: pointer;" >
                                 <i class=" edit fas fa-2x  far fa-save"></i>
                             </div>
                        </td>
                    </tr>
                    
                </table>
            </div>
            <table>
                <tr>
                    <td  id="tdAcoes_<%=rs.getString("ID_PAUTA")%>" style="padding-left: 10px; padding-left: 30px; padding-right: 30px; " ></td>
                </tr>
                <tr>
                    <td  border="1" colspan="3" style="padding: 10px;"></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td style=" border-bottom: solid white 8px; color: #cccccc "></td>
        <!--<td style=" border: solid  2px #CCCCCC ; "></td>-->
    </tr>
</table>

<script>
    ID_ATA =<%=rs.getString("ID_ATA")%>;
    ID_PAUTA =<%=rs.getString("ID_PAUTA")%>;

    if (ID_PAUTA == "") {
    } else {
        $("#tdAcoes_" + ID_PAUTA).load("encheAcaoAtas.jsp", {ID_ATA: ID_ATA, ID_PAUTA: ID_PAUTA});
    }
</script>

<%}
}%> 
