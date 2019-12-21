<%@page contentType="text/html; charset=utf8"%> 

<%
    int ID_ATA = Integer.parseInt(request.getParameter("ID_ATA"));
    String cpf = (request.getParameter("cpf"));
%>
<script>
    $("#tdMigalhaAta").html("Nova Denúncia");
</script>  



<div class="migalha_titulo" id="tdMigalhaAta"></div>

<div id="divMigalhaMnu" style="text-align: left; padding-top: 10px ; padding-bottom: 10px;"></div>
    

<table border="0" style="border: 0px solid; width: 100%; " >
    <tr>
        <td style="border: 0px solid left; color: #cccccc; ">
            <div class="d-block w-100" style="align: center; cursor: pointer; padding: 10px; ">
                <table border="0">
                    <tr>
                        <!--<td style="width: 220px;"><button id="btnNovaAta" onclick="cadastroAta()" class="btn btn-secondary"  style="height: 55px; width: 100%;  background-color: #1976d2"><i class="fa-1x fas fa-save"></i> Comecar Nova Denuncia</button> </td>-->
                        <!--<td style="width: 30px;"></td>-->
                        <td style="width: 220px;"><button  id="btnEnviar"  onClick="alterarAta()"   class="btn btn-secondary" disabled style="display: block; height: 55px; width: 100%; background-color: #0056b3"><i class="fa-1x fas fa-save"></i> Salvar Denuncia</button> </td>

                        <td style="float: right; border: 1px solid #999999;background: #e9ecef; border-radius:5px;  height: 50px; width: 150px; padding-top: 12px; ">
                            <div id="divIdAta" style="text-align: center; font-size: 22px;"></div>
                            <input id="txtAta"  style="display: none;" >
                        </td>
                    </tr>
                </table>
                <br>
                <table border="0">
                    <tr>
                        <td style="width: 73%;">
                            <div style="border: 1px solid #cccccc; padding: 10px;">
                                <table>

                                <tr>
                                    <td colspan="3">
                                        <span style="color: #000000;"><b>Título</b></span>
                                        <br>
                                        <input id="txtResumo"  class="form-control" style="font-size: 16px; color: #000; font-weight: bold;">         
                                        <br>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="vertical-align: top; border: solid 0px tomato; padding-right: 10px; width: 115px;">
                                        <span style="color: #000000;"><b>Data da Ata: </b></span><br>
                                        <input   class="form-control " id="txtDtAta"  style="text-align: left; width: 100%;" >
                                    </td>
                                    <td style="width: 20px;"></td>
                                    <td style=" vertical-align: top; border: solid 0px tomato;">
                                        <span style="color: #000000;"><b>Local de Realização :</b></span><br>
                                        <input   class="form-control " id="txtLocalAta"  style="text-align: left; width: 100%;" >
                                    </td>
                                </tr> 
                                </table>
                            </div> pa
                            
                            <br>
                            
                            <table>
                                <tr>
                                    <td id="tdBoxPauta" style="border: 1px solid #cccccc; padding: 10px; display: none;">
                                        <table id="tbPauta">
                                            <tr>
                                                <td>
                                                    <table>
                                                        <tr>
                                                            <td><span style="color: #000000;"><b>Nova Pauta:</b></span></td>
                                                            <td style="width: 20px;">
                                                                <div><i class="far fa-times-circle" style="color: tomato; cursor: pointer;" onClick="OMPauta(1)"></i></div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    
                                                    <br>
                                                    <input id="txtIdPauta" style="display: none;">
                                                    <textarea  onkeyup="ContCaracteresResposta()"  id="txtPauta" class="form-control"   rows="25" cols="500" maxlength="5000" style="text-transform: uppercase; font-size: 20px; color: #000; font-weight: bold; font-family: courier; padding: 10px;  height: 90px; border: solid 1px silver;  border-radius: 4px;"></textarea>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td style="padding-top: 10px;  " >
                                                    <button onClick="inserirPauta()"  class="btn btn-secondary"  style=" height: 50px;  background-color: #1976d2;  "><i class="fa-1x fas fa-plus-circle"></i> Salvar PAUTA</button>
                                                    <label style="width: 80px; vertical-align: top; font-size: 12px; color: #999999; padding-left: 308px; "  id="tdQtdCaracteresResposta">5.000/5.000</label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    
                                    <td id="tdMostrarBoxPauta" style="display: block;  border: 1px solid #cccccc; padding: 10px;">
                                        <button onClick="OMPauta(2)"  class="btn btn-secondary"  style=" height: 50px;  background-color: #1976d2;  "><i class="fa-1x fas fa-plus-circle"></i> Adicionar nova PAUTA</button>
                                    </td>
                                    
                                </tr>
                                
                                <tr>
                                    <td id="tdMigalhaPauta" style="border: 0px solid tomato; padding-top: 20px; "></td>
                                </tr>

                                <tr>
                                    <td id="tdPauta" style="border: 0px solid;"></td>
                                </tr>
                            </table>
                            
                        </td>
                        
                        <td style="width: 20px;"></td>
                        
                        <td style="vertical-align: top;">
                            <div style=" padding: 20px; border: 1px solid #CCCCCC; border-radius: 4px;  width: 400px; min-height: 50px; border-top: 1px solid #ccccc; font-weight: bold;">
                                <table id="tbParticipante" border="0" >
                                    <tr>
                                        <td>
                                            <span style=" color: #000000;"><b>Responsável pelo Caso: </b></span>
                                            <input id="txtParticipante" class="form-control" style="text-transform: uppercase; ">
                                        </td>
                                        <td id="btnParticipante" style="width: 18px; padding-top: 12px;">
                                            <i class="fas fa-plus-circle fa-2x" onClick="inserirParcipante()"></i>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="tdPartipante">Participantes</td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" style="text-align: center; padding-top: 10px;">

                        </td>
                    </tr>
                </table>
            </div>
        </td>
    </tr>
</table>


<script>
    ID_ATA =<%=ID_ATA%>;
    if (ID_ATA > 0) {
        $("#txtTitulo").focus();
        $("#divIdAta").html("<b># <%=ID_ATA%></b>");
        $("#txtAta").val("<%=ID_ATA%>");
        $("#tdPauta").load("enchePautaAtas.jsp", {ID_ATA: ID_ATA});
  //      $("#tdPartipante").load("encheParticipanteAtas.jsp", {ID_ATA: ID_ATA});
    } else {
        $("#btnNovaAta").focus();
        $("#tbPauta").hide();
        $("#tbParticipante").hide();
        $("#tdMostrarBoxPauta").hide();
    }


if(cpf=='2019000'){}else {
    $("#txtParticipante").attr("disabled", true);
    $("#btnParticipante").hide();
    
}

    $(function () {

        $("#txtDtAta").datepicker({
            dateFormat: 'dd/mm/yy',
            dayNames: ['Domingo', 'Segunda', 'TerÃ§a', 'Quarta', 'Quinta', 'Sexta', 'SÃ¡bado'],
            dayNamesMin: ['D', 'S', 'T', 'Q', 'Q', 'S', 'S', 'D'],
            dayNamesShort: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'SÃ¡b', 'Dom'],
            monthNames: ['Janeiro', 'Fevereiro', 'MarÃ§o', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
            monthNamesShort: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
            nextText: 'PrÃ³ximo',
            prevText: 'Anterior',
            onSelect: function (dateText, inst) {}
        });
    });




    function ContCaracteresResposta() {
        var limite = 5000;
        var caracteresDigitados = $("#txtPauta").val().length;
        var caracteresRestantes = limite - caracteresDigitados;

        caracteresRestantesXXX = "" + caracteresRestantes + "";
        tam = caracteresRestantesXXX.length;

        caracteresRestantesFormated = caracteresRestantesXXX;
        if (tam == 4) {
            mil = caracteresRestantesXXX.substr(0, 1);
            cem = caracteresRestantesXXX.substr(1, 3);
            caracteresRestantesFormated = "" + mil + "." + cem + "";
        }
        if (limite == tam) {
            alert("Você atingiu o máximo de caractéres permitido !");
        }

        $("#tdQtdCaracteresResposta").text("" + caracteresRestantesFormated + "/5.000");
    }

</script>
