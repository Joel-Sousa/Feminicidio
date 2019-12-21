<%@include file="funcoes.jsp"%>
<%@page contentType="text/html; charset=utf8"%> 


<ul  class="list-group">
    <%
        int ID_ATA = Integer.parseInt(request.getParameter("ID_ATA"));
        ResultSet rs;
        rs = encheParticipanteAtas(ID_ATA);
        while (rs.next()) {
    %>
    <li  class="list-group-item" style="text-transform: uppercase; font-size: 13px; color: #000; font-weight: bold;">
        <table>
            <tr>
                <td>
                    <%=rs.getString("PARTICIPANTE")%>
                </td>
                
                <td onClick="excluirParticipante(<%=rs.getString("ID_ATA")%>, <%=rs.getString("ID_PARTICIPANTE")%>)" style="float: right;">
                   <i class="closeX far fa-times-circle" style="cursor: pointer;"></i> 
                </td>
            </tr>
        </table>
    
    </li>

    <%}%> 
</ul>

