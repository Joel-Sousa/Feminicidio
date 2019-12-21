<%@include file="funcoes.jsp"%>
<%@page contentType="text/html; charset=utf8"%> 

<table style="border: 0px solid #cccccc; border-radius: 5px; min-width: 450px; max-width: 1200px; ">
    <tr>
        <td style="padding:10px; ">
            <!--<h5>Ações</h5>-->
            <ul class="list-group">

                <%
                    int ID_ATA = Integer.parseInt(request.getParameter("ID_ATA"));
                    int ID_PAUTA = Integer.parseInt(request.getParameter("ID_PAUTA"));
                    ResultSet rs;
                    rs = encheAcoesAtas(ID_PAUTA, ID_ATA);
                    while (rs.next()) {
                %>
                <li class="list-group-item">
                    <table>
                        <tr id="trxAcao<%=rs.getString("ID_ACAO")%>">
                            <td style="width:90%; color: black; font-size: 15px;">
                                <%=rs.getString("ACAO")%>
                            </td>
                            
                             <td  onClick="abreCampoAcao(1,<%=rs.getInt("ID_ACAO")%>)" style="width: 5%; border: 0px solid #CCCCCC; padding-left: 10px; " >
                                <div>
                                    <i   class=" edit fas fa-1x fa-pencil-alt"></i>
                                </div>
                            </td>
                            
                            <td style="width: 5%;">
                                <%  if (rs.getInt("SITUACAO_ACAO") > 0) {%>
                                <i onClick="concluirAcao(<%=ID_ATA%>,<%=ID_PAUTA%>,<%=rs.getInt("ID_ACAO")%>,0)"  title="Ação Concluída !" class="acaoConcluida  fa-2x fas   fa-check "></i>
                                <%} else {%>
                                <i onClick="concluirAcao(<%=ID_ATA%>,<%=ID_PAUTA%>,<%=rs.getInt("ID_ACAO")%>,1)" class="acaoNaoConcluida" title="Clique aqui para concluir a Ação!" ></i>
                                <%}%>  
                            </td>
                        </tr>
                        
                        <tr id="trxAcaoAltera_<%=rs.getString("ID_ACAO")%>" style="display: none;">
                            <td style=" font-size: 15px; font-weight: bold; text-transform: uppercase;  border-botom: 1px solid #ccccc; padding-left: 10px; "  >
                                <input id="txtAcao_<%=rs.getInt("ID_ACAO")%>" value="<%=rs.getString("ACAO")%>" class="form-control"  style="text-transform: uppercase;">
                            </td>

                            <td style="width: 20px; padding-bottom: 22px; padding-left: 6px;">
                                <div><i class="closeX far fa-times-circle" style=" cursor: pointer;" onClick="abreCampoAcao(2,<%=rs.getInt("ID_ACAO")%>)"></i></div>
                            </td>
                            
                            <td style="float: right" onClick="alterarAcao(<%=rs.getInt("ID_ATA")%>,<%=rs.getInt("ID_ACAO")%>)">
                                <button style="background: #ffffff;" >
                                    <i class="edit fas fa-2x  far fa-save"></i>
                                </button>
                            </td>
                        </tr>
                    </table>
                    
                </li>
                 <%}%>
                    <li class="list-group-item">
                        <table style="border: 0px solid #999999" >
                         <tr>
                             <td style="border: 0px solid #999999; width: 85%">
                                 <input class="form-control" id="txtAcao_<%=ID_PAUTA%>">
                             </td>
                             
                             <td style="width: 15%; padding-left: 10px;">
                                 <button onClick="inserirAcao(<%=ID_ATA%>,<%=ID_PAUTA%>)"   class="btn btn-secondary"  style=" background-color: #1976d2; height: 40px; "><i class="fa-1x fas fa-plus-circle"></i> Nova AÇÃO</button>
                             </td>
                         </tr>
                     </table>
                </li>
            </ul>
        </td>
    </tr>
</table>

