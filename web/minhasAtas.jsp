<%--<%@include file="autentica.jsp"%>--%>
<%@include file="funcoes.jsp"%>
<%@page contentType="text/html; charset=utf8"%> 
<%   
    int prefixo = Integer.parseInt(request.getParameter("PREFIXO"));
%>

    <center>

<div class="migalha_titulo">
    Sistema para registro das denúncias entre vitima e delegacias
</div>

   
<div style="text-align: left; padding-top: 10px ; padding-bottom: 10px;">
    <span onClick='mnu()' style="color: #000 " >Minhas Denuncias:</span>
</div>
   
<br>    

<table center id="tbGrafico" style="width: 100%;">
    <tr>
        <td id="container"  ></td>
        
        <td id="tdCorreioBraziliense" style="padding-left: 5px; background-image: url('https://www.correiobraziliense.com.br/busca/feminicidio'); "  >
            <img src="images/feminicidioCR.png" usemap="#Map" />
        </td>
        <td id="tdCorreioBraziliense" style="padding-left: 5px; background-image: url('https://www.correiobraziliense.com.br/busca/feminicidio'); "  >
<!--            <img src="images/feminicidioCR1.png" usemap="#Map" /> -->
        </td>
    </tr>
</table>

<script>
    var chart = Highcharts.chart('container', {

    title: {
        text: 'Historico de Feminicidios em Brasilia'
    },

    subtitle: {
        text: 'Relatório 730'
    },

    xAxis: {
        categories: ['2015', '2016', '2017', '2018', '2019']
    },

    series: [{
        type: 'column',
        colorByPoint: true,
        data: [2,5,3,5,28],
        showInLegend: false
    }]

});
    $("#div_qtd_chv_j").html("<div style='font-size: 70px;'>200</div>");
    
</script>

<div class="migalha_titulo" style="font-weight: normal; font-size: 16px;">
    Denúncias Feminicidio:
</div>

<table class="table table-hover" style="border: 1px solid #999999; text-align: center; width: 1200px;">
    <thead>
        <tr>
            <th scope="col" style="width: 40px; background-color: #FFF; ">#</th>
            <th scope="col" style="width: 340px; background-color: #FFF; text-align: left;">Resumo</th>
            <th scope="col" style="width: 120px; background-color: #FFF;">Data</th>
            <th scope="col" style="width: 240px; background-color: #FFF;">Local</th>
        </tr>
    </thead>
    
    <tbody>
        <%
           //int prefixo=Integer.parseInt(dependencia_x);
            ResultSet rs;
            rs = minhaAtas(prefixo);
            while (rs.next()) {
        %>
        <tr onClick="detalhaMinhasAtas(<%=rs.getString("ID_ATA")%>)" class="trx" style="background: #FFF">  
            <td scope="row"  style="cursor: pointer; border: 1px solid #cccccc;"><%=rs.getString("ID_ATA")%></td>
            <td  style="cursor: pointer; border: 1px solid #cccccc; text-align: left;"><%=rs.getString("RESUMO")%></td>
            <td  style="border: 1px solid #cccccc; "><%=rs.getString("DT_ATA")%></td>
            <td  style="border: 1px solid #cccccc; "><%=rs.getString("LCL")%></td>
        </tr>
        <%}%> 
    </tbody>
</table>
<script>
        prefixo=<%=prefixo%>;
//        $("#tdCorreioBraziliense").load("https://www.google.com/");
</script>

    
    </center>

