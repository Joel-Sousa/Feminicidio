<%--<%@include file="autentica.jsp"%>--%>
<%--<%@include file="autenticaFake.jsp"%>--%>
<%@include file="funcoes.jsp"%>
<%@page import="dao.ConexaoMySQL"%>
<%@page import="dao.FactoryConnection_MySQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="images/png" href="images/logoFem.jpg">    
        <title>#FeminicidioNÃO</title>
        
        <!-----jquery------------inicio------->
        <script src="plugins/jquery-ui/external/jquery/jquery.js"></script>
        <link rel="stylesheet" href="plugins/jquery-ui/jquery-ui.css">
        <script src="plugins/jquery-ui/jquery-ui.js"></script>
        <!-----jquery------------finali------->

        <!-----bootstrap------------inicio------->
        <link href='plugins/bootstrap/css/bootstrap.min.css' rel='stylesheet'  type='text/css'/>                 
        <!----bootstrap-------------finali------->


        <!-----fontawesome------------inicio------->
        <script src="fontawesome/svg-with-js/js/fontawesome-all.js"></script>       
        <!-----fontawesome------------finali------->

        <!-----highcharts------------inicio------->
        <script src="plugins/highcharts/code/highcharts.js"></script>
        <script src="plugins/highcharts/code/highcharts-more.js"></script>
        <script src="plugins/highcharts/code/modules/exporting.js"></script>
        <!-----highcharts------------finali------->

        <!-----uav------------inicio------->
        <link href='action/style.css' rel='stylesheet'  type='text/css'/>  
        <script type="text/javascript" src="action/action.js"></script>
        <!-----uav------------finali------->



        <style>
            .class1{border: solid 0px tomato;}
            .class2{background-color: #f8d117;}
        </style>

        <%

            ResultSet rs;
            int cont = 0;
            int lugar = 1;

        //String lc=chave_x.substring(0,1);
        //System.out.println("lc : "+lc);
        //System.out.println("chave_x : "+chave_x);
        //lc= lc.toLowerCase();
        /*
             */
        %>


        <script>
            var diretoriaUser = 0;
            var prefixoUser = 0;
            var UserChv = "";
            var classiDep = "";
            var tipoMovimento = 0;//InclusÃ£o do Minuto de Ouro
            //tipoMovimento=1;//AlteraÃ§Ã£o do Minuto de Ouro
            var IND_NO_AR = 0;

            $(document).ready(function() {
                //    diretoriaUser="9270";
                prefixoUser = "9270";
                UserChv = "F7034899";
                //    classiDep="agencia";    
                cargo_x = "4290";

                $("#divLoad").hide();
                $(document).ajaxStart(function() {
                    $("#divLoad").show();
                });
                $(document).ajaxStop(function() {
                    $("#divLoad").hide();
                });

                $(document).ajaxError(function() {
                    alert("Desculpe o transtorno, o Sistema Encontrou um Erro !");
                });

                if (prefixoUser == 9270 || prefixoUser == 8592 || prefixoUser == 9010) {
                    //        $("#main").load("encheRegional.jsp", {});
                } else {
                }

                $("#main").load("minhasAtas.jsp", {PREFIXO: prefixoUser});

                //$("#main").load("encheRegional.jsp", {});
                //detalhaMinhasAtas(2);

            });

            function encheMnuSupThumb(idx) {
                $("#divNav1").switchClass("class2", " nav-link menuuavideos", 1000, "easeInOutQuad");
                $("#divNav2").switchClass("class2", " nav-link menuuavideos", 1000, "easeInOutQuad");
                $("#divNav3").switchClass("class2", " nav-link menuuavideos", 1000, "easeInOutQuad");

                $("#divNav" + idx + "").switchClass("class1", " class2 ", 1000, "easeInOutQuad");
            }


        </script>

        <style>
            .tdFrmMO{
                padding: 10px;
            }
        </style>

    </head>
    <body>

        <style type="text/css">
            .uno
            {
                //width:10em;
                //height:5em;
                //background-color:blue;
                margin-left:300px;
                margin-top: 10px;
                color: floralwhite;

                //padding:5em;            
            }
        </style>
        
         <%
       String user = (String) session.getAttribute("nome");
       String cpf = (String) session.getAttribute("cpf");
        %>
        
        <script>
        var cpf=<%=cpf%>
        </script>

<% if(user == null){
    response.sendRedirect("cadastrarUsuario.jsp");
}
%>


    <center>
        <%//    dao.ConexaoMySQL.ReiniciarConexao();
        //    out.println(ConexaoMySQL.statusConection());
        %>
        <!---->
        <header>
            <div class="row" id="nav-h">
                <div class="col-2"  style="border: solid 0px tomato;  ">
                    <a class="navbar-brand" onclick="abrePaginaPrincipal()" href="#" style="border: solid 0px tomato; color:rgb(33,81,119); font-size: 32px; font-weight: bold; text-shadow: 2px 2px 1px rgba(0, 0, 0, 0.2); padding-left: 5px; color: #e3e3e3">
                        <img src="images/logoFem.jpg" style="position: relative; top: -2px; width:92px;">
                        #FeminicidioNÃO 
                        <span id="divLoad"><i class="fa-1x fas fa-cog fa-spin"></i></span>
                    </a>	
                </div>
                
                <!--fdfd-->
                <div class="uno"><h5>Bem Vindo ! <%=user%>&nbsp;&nbsp;<a href="sair.jsp">Sair</a></h5></div>

                <div class="col-2" style="padding: 11px 15px; border: solid 0px green; text-align: right">
                    <img src="" style="border-radius: 50%; width: 40px; ">
                </div>
            </div>

        </header>  

        <div class="row">
            <div class="col-sm-1 col-md-1 menuAta" style="border: solid 0px tomato; height: 800px; text-align: center; padding-top: 40px;">
                <i  onClick="cadastroAta()" class="fas fa-plus-circle fa-3x iconuav"></i><br><br>
                <i  onClick="mnu()" class="fas fa-align-justify fa-3x iconuav" ></i><br><br>
                <!--<i class="fas fa-search fa-3x iconuav"></i><br><br>-->            
            </div>
            <div class="col-sm-4 col-md-10 " id="main" style="border: solid 0px greenyellow;"></div>
        </div>    
        <div id="DIV_O" style="display: none; border: solid 1px ; background-color: #ffcc00; width: 330px; height:150px;"></div>    

        <div id="divLoad2" 
             style="display: none; 
             position: absolute;
             top: 0px;
             left: 0px;

             background-color: rgba(255,255,255,0.7); 
             height: 100%; 
             min-height: 100px; 

             width: 100%; 
             min-width: 100px; 
             color: #2b587a; 
             text-align: center;
             z-index:99;

             text-align: center;
             vertical-align: middle;
             ">

            <div style="position: relative; top: 250px; display: inline-block; border: solid 0px #e3e3e3; background-color: rgba(255,255,255,1); padding: 15px; border-radius: 5px;">
                <table style="width: 200px; display: inline-block">
                    <tr>
                        <td>
                            <i class="fa-2x fas fa-cog fa-spin"></i>
                        </td>
                        <td>
                            <span style="font-size:14px;"> Aguarde...</span>
                        </td>
                    </tr>
                </table>
            </div>
        </div>




        <!-- Dialogs -----------------------InÃ­cio -->
        <div id="dlgAnexo" title="Anexar Arquivo"></div>
        <div id="dlgAnexoImg" title="Anexar Arquivo"></div>

        <script src="plugins/bootstrap/js/bootstrap.min.js"></script>

    </center> 
</body>
</html>
