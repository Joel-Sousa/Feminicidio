
<%@page import="java.sql.Statement"%>
<%@page import="java.io.IOException"%>
<%@page import="dao.FactoryConnection_MySQL"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="sun.misc.BASE64Decoder"%>
<%@page import="dao.ConexaoMySQL"%>

<%!

/* FUNCOES RESULT SET*/

public ResultSet login(String MATRICULA) {
    PreparedStatement state = null;
    ResultSet rs = null;

    try {

        String AQuery = "select sql_cache  ID_ATA,MATRICULA from ata WHERE MATRICULA ='"+MATRICULA+"' ";

        System.out.println("minhaAtas AQuery : " + AQuery);
//        state =ConexaoMySQL.getConexaoMySQL().prepareStatement(""+AQuery+"");
          state = FactoryConnection_MySQL.getConnection("feminicidio").prepareStatement(""+AQuery+"");
//        FactoryConnection_MySQL.getConnection("feminicidio").prepareStatement(""+AQuery+"");
        rs = state.executeQuery();


    } catch (SQLException erro) {
        //////System.out.println(erro);	
    } finally {
        try {
            //////System.out.println("X DataAtualizacao - Encerrando Conexão.");
            FactoryConnection_MySQL.getConnection("feminicidio").close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
        }
    }
    return rs;
}

public ResultSet minhaAtas(int prefixo) {
    PreparedStatement state = null;
    ResultSet rs = null;

    try {

        String AQuery = "select sql_cache ";
        AQuery = "" + AQuery + "CASE WHEN A.ID_ATA IS NULL THEN 'E' ELSE  A.ID_ATA END AS ID_ATA,   ";
        AQuery = "" + AQuery + "CASE WHEN RESUMO IS NULL THEN '' ELSE RESUMO END AS RESUMO, ";
        AQuery = "" + AQuery + "CASE WHEN DT_ATA IS NULL THEN '' ELSE DATE_FORMAT(DT_ATA ,'%d/%m/%Y') END AS DT_ATA ,  "; 
        AQuery = "" + AQuery + "CASE WHEN LCL IS NULL THEN '' ELSE LCL END AS LCL, ";
        AQuery = "" + AQuery + "CASE WHEN HORA IS NULL THEN '' ELSE HORA END AS HORA,   ";
        AQuery = "" + AQuery + "CASE WHEN MATRICULA IS NULL THEN '' ELSE MATRICULA END AS MATRICULA,  ";
        AQuery = "" + AQuery + "CASE WHEN PREFIXO IS NULL THEN '' ELSE PREFIXO END AS PREFIXO,  ";
        AQuery = "" + AQuery + "CASE WHEN CARGO IS NULL THEN '' ELSE CARGO END AS CARGO,   ";
        AQuery = "" + AQuery + "CASE WHEN IP_MAQUINA IS NULL THEN '' ELSE IP_MAQUINA END AS IP_MAQUINA,  ";
        AQuery = "" + AQuery + "CASE WHEN DT_GRAVACAO IS NULL THEN '' ELSE DT_GRAVACAO END AS DT_GRAVACAO ,  ";
        AQuery = "" + AQuery + "COUNT( DISTINCT B.ID_ATA,B.ID_PAUTA ) AS QTD_PAUTAS,  ";
        AQuery = "" + AQuery + "COUNT( DISTINCT C.ID_ATA, C.ID_PAUTA, C.ID_ACAO) AS QTD_ACOES,  ";
        AQuery = "" + AQuery + "SUM( CASE WHEN C.SITUACAO_ACAO=1 THEN 1 ELSE 0 END )AS QTD_ACOES_CONCLUIDA   ";
        AQuery = "" + AQuery + "FROM ATA A  LEFT JOIN ATA_PAUTA_ATA B ON A.ID_ATA=B.ID_ATA   ";
        AQuery = "" + AQuery + "LEFT JOIN ATA_ACAO_ATA C ON A.ID_ATA=C.ID_ATA AND B.ID_PAUTA=C.ID_PAUTA  ";
        AQuery = "" + AQuery + "WHERE PREFIXO=" + prefixo + " ";
        AQuery ="" + AQuery  + "GROUP BY A.ID_ATA ORDER BY A.ID_ATA DESC ";

     //    System.out.println("minhaAtas AQuery : " + AQuery);
//        state =ConexaoMySQL.getConexaoMySQL().prepareStatement(""+AQuery+"");
          state = FactoryConnection_MySQL.getConnection("feminicidio").prepareStatement(""+AQuery+"");
//        FactoryConnection_MySQL.getConnection("feminicidio").prepareStatement(""+AQuery+"");
        rs = state.executeQuery();


    } catch (SQLException erro) {
        //////System.out.println(erro);	
    } finally {
        try {
            //////System.out.println("X DataAtualizacao - Encerrando Conexão.");
            FactoryConnection_MySQL.getConnection("feminicidio").close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
        }
    }
    return rs;
}


public ResultSet detalhaMinhasAtas(int ID_ATA) {
    PreparedStatement state = null;
    ResultSet rs = null;

    try {

        String AQuery="select sql_cache ";
        AQuery=""+AQuery +"CASE WHEN A.ID_ATA IS NULL THEN '' ELSE A.ID_ATA END AS ID_ATA,";
        AQuery=""+AQuery +"CASE WHEN A.RESUMO IS NULL THEN '' ELSE A.RESUMO END AS RESUMO, ";
        AQuery=""+AQuery +"CASE WHEN A.DT_ATA IS NULL THEN '' ELSE DATE_FORMAT(A.DT_ATA ,'%d/%m/%Y') END AS DT_ATA , ";
        AQuery=""+AQuery +"CASE WHEN A.LCL IS NULL THEN '' ELSE A.LCL END AS LCL, ";
        AQuery=""+AQuery +"CASE WHEN A.HORA IS NULL THEN '' ELSE A.HORA END AS HORA, ";
        AQuery=""+AQuery +"CASE WHEN A.MATRICULA IS NULL THEN '' ELSE A.MATRICULA END AS MATRICULA, ";
        AQuery=""+AQuery +"CASE WHEN A.PREFIXO IS NULL THEN '' ELSE A.PREFIXO END AS PREFIXO,  ";
        AQuery=""+AQuery +"CASE WHEN A.CARGO IS NULL THEN '' ELSE A.CARGO END AS CARGO, ";
        AQuery=""+AQuery +"CASE WHEN A.IP_MAQUINA IS NULL THEN '' ELSE A.IP_MAQUINA END AS IP_MAQUINA, ";
        AQuery=""+AQuery +"CASE WHEN A.DT_GRAVACAO IS NULL THEN '' ELSE A.DT_GRAVACAO END AS DT_GRAVACAO, ";
        AQuery=""+AQuery +"CASE WHEN A.DT_GRAVACAO IS NULL THEN '' ELSE A.DT_GRAVACAO END AS DT_GRAVACAO, ";
        AQuery=""+AQuery +"CASE WHEN B.ID_PAUTA IS NULL THEN '' ELSE B.ID_PAUTA   END AS ID_PAUTA , ";
        AQuery=""+AQuery +"CASE WHEN C.PAUTA IS NULL THEN '' ELSE C.PAUTA END AS PAUTA ";  
        AQuery=""+AQuery +"FROM ATA A  ";
        AQuery=""+AQuery +"LEFT JOIN ATA_PAUTA_ATA B ON A.ID_ATA=B.ID_ATA  ";
        AQuery=""+AQuery +"LEFT JOIN ATA_PAUTA C ON B.ID_PAUTA=C.ID_PAUTA  ";
        AQuery=""+AQuery +"WHERE A.ID_ATA=? ";



        state = FactoryConnection_MySQL.getConnection("feminicidio").prepareStatement(""+AQuery+"");

        state.setInt(1,ID_ATA);

//        //System.out.println("detalhaMinhasAtas " + state);
     
        rs = state.executeQuery();

    } catch (SQLException erro) {
        //////System.out.println(erro);	
    } finally {
        try {
            //////System.out.println("X DataAtualizacao - Encerrando Conexão.");
            FactoryConnection_MySQL.getConnection("feminicidio").close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
        }
    }
    return rs;
}



public ResultSet enchePautaAtas(int ID_ATA ) {
    PreparedStatement state = null;
    ResultSet rs = null;

    try {

        String AQuery="select sql_cache ";
        AQuery=""+AQuery +"CASE WHEN A.ID_ATA IS NULL THEN '' ELSE A.ID_ATA END AS ID_ATA, ";
        AQuery=""+AQuery +"CASE WHEN B.ID_PAUTA  IS NULL THEN '' ELSE B.ID_PAUTA  END AS ID_PAUTA, ";
        AQuery=""+AQuery +"CASE WHEN C.PAUTA  IS NULL THEN '' ELSE C.PAUTA END AS PAUTA, ";
        AQuery=""+AQuery +"CASE WHEN D.ID_ACAO IS NULL THEN '' ELSE D.ID_ACAO  END AS ID_ACAO, ";
        AQuery=""+AQuery +"CASE WHEN E.ACAO  IS NULL THEN '' ELSE E.ACAO END AS ACAO ";
        AQuery=""+AQuery +"FROM ATA A ";
        AQuery=""+AQuery +"LEFT JOIN ATA_PAUTA_ATA B ON A.ID_ATA=B.ID_ATA ";
        AQuery=""+AQuery +"LEFT JOIN ATA_PAUTA C ON B.ID_PAUTA=C.ID_PAUTA ";
        AQuery=""+AQuery +"LEFT JOIN ATA_ACAO_ATA D ON A.ID_ATA=D.ID_ATA ";
        AQuery=""+AQuery +"LEFT JOIN ATA_ACAO E ON E.ID_ACAO=D.ID_ACAO ";
        AQuery=""+AQuery +"WHERE A.ID_ATA=?  ORDER BY B.ID_PAUTA DESC  limit 1";

        state = FactoryConnection_MySQL.getConnection("feminicidio").prepareStatement(""+AQuery+"");
        state.setInt(1,ID_ATA);
        System.out.println("enchePautaAtas " + state);
     
        rs = state.executeQuery();

    } catch (SQLException erro) {
        //////System.out.println(erro);	
    } finally {
        try {
            //////System.out.println("X DataAtualizacao - Encerrando Conexão.");
            FactoryConnection_MySQL.getConnection("feminicidio").close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
        }
    }
    return rs;
}

public ResultSet encheParticipanteAtas(int ID_ATA ) {
    PreparedStatement state = null;
    ResultSet rs = null;

    try {

        String AQuery = "select sql_cache ";

	    AQuery = "" + AQuery + "CASE WHEN ID_ATA IS NULL THEN ''  ELSE ID_ATA END AS ID_ATA, ";
	    AQuery = "" + AQuery + "CASE WHEN A.ID_PARTICIPANTE IS NULL THEN ''  ELSE A.ID_PARTICIPANTE END AS ID_PARTICIPANTE, ";
	    AQuery = "" + AQuery + "CASE WHEN B.PARTICIPANTE IS NULL THEN ''  ELSE B.PARTICIPANTE  END AS PARTICIPANTE ";
	    AQuery = "" + AQuery + "FROM ATA_PARTICIPANTE_ATA A ";
	    AQuery = "" + AQuery + "LEFT JOIN ATA_PARTICIPANTE B ON A.ID_PARTICIPANTE=B.ID_PARTICIPANTE ";
	    AQuery = "" + AQuery + "WHERE ID_ATA=?  ";
         state = FactoryConnection_MySQL.getConnection("feminicidio").prepareStatement(""+AQuery+"");
        state.setInt(1,ID_ATA);

       ////System.out.println("encheParticipanteAtas " + state);
     
        rs = state.executeQuery();

    } catch (SQLException erro) {
        //////System.out.println(erro);	
    } finally {
        try {
            //////System.out.println("X DataAtualizacao - Encerrando Conexão.");
            FactoryConnection_MySQL.getConnection("feminicidio").close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
        }
    }
    return rs;
}


public ResultSet encheAcoesAtas(int ID_PAUTA, int ID_ATA) {
    PreparedStatement state = null;
    ResultSet rs = null;

    try {
        String AQuery="select sql_cache ";
        AQuery=""+AQuery +"A.ID_ACAO, "; 
        AQuery=""+AQuery +"A.ID_PAUTA,   "; 
        AQuery=""+AQuery +"A.ID_ATA, "; 
        AQuery=""+AQuery +"A.SITUACAO_ACAO, "; 
        AQuery=""+AQuery +"C.ACAO, "; 
        AQuery=""+AQuery +"D.PAUTA "; 
        AQuery=""+AQuery +"FROM ATA_ACAO_ATA A  "; 
        AQuery=""+AQuery +"LEFT JOIN ATA_PAUTA_ATA B ON A.ID_PAUTA=B.ID_PAUTA AND A.ID_ATA=B.ID_ATA "; 
        AQuery=""+AQuery +"LEFT JOIN ATA_ACAO C ON A.ID_ACAO=C.ID_ACAO "; 
        AQuery=""+AQuery +"LEFT JOIN ATA_PAUTA D ON B.ID_PAUTA=D.ID_PAUTA "; 
        AQuery=""+AQuery +"WHERE A.ID_PAUTA = ? AND A.ID_ATA =?  "; 


        state = FactoryConnection_MySQL.getConnection("feminicidio").prepareStatement(""+AQuery+"");
        state.setInt(1,ID_PAUTA);
        state.setInt(2,ID_ATA);

//       ////System.out.println("encheAcoesAtas " + state);
     
        rs = state.executeQuery();

    } catch (SQLException erro) {
        //////System.out.println(erro);	
    } finally {
        try {
            //////System.out.println("X DataAtualizacao - Encerrando Conexão.");
            FactoryConnection_MySQL.getConnection("feminicidio").close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
        }
    }
    return rs;
}



public ResultSet encheParticipante() {
    PreparedStatement state = null;
    ResultSet rs = null;

    try {
        String AQuery="select sql_cache ";
        AQuery=""+AQuery +"ID_PARTICIPANTE, "; 
        AQuery=""+AQuery +"PARTICIPANTE, "; 
        AQuery=""+AQuery +"NOME "; 
        AQuery=""+AQuery +"FROM ATA_PARTICIPANTE  "; 

        state = FactoryConnection_MySQL.getConnection("feminicidio").prepareStatement(""+AQuery+"");

//       ////System.out.println("encheParticipante " + state);
     
        rs = state.executeQuery();

    } catch (SQLException erro) {
        //////System.out.println(erro);	
    } finally {
        try {
            //////System.out.println("X DataAtualizacao - Encerrando Conexão.");
            FactoryConnection_MySQL.getConnection("feminicidio").close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
        }
    }
    return rs;
}



public ResultSet enchePauta() {
    PreparedStatement state = null;
    ResultSet rs = null;

    try {
        String AQuery="select sql_cache ";
        AQuery=""+AQuery +"ID_PAUTA, "; 
        AQuery=""+AQuery +"PAUTA "; 
        AQuery=""+AQuery +"FROM ATA_PAUTA  "; 

        state = FactoryConnection_MySQL.getConnection("feminicidio").prepareStatement(""+AQuery+"");

//       ////System.out.println("enchePauta " + state);
     
        rs = state.executeQuery();

    } catch (SQLException erro) {
        //////System.out.println(erro);	
    } finally {
        try {
            //////System.out.println("X DataAtualizacao - Encerrando Conexão.");
            FactoryConnection_MySQL.getConnection("feminicidio").close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
        }
    }
    return rs;
}


public ResultSet verificarPauta(String PAUTA ) {
    PreparedStatement state = null;
    ResultSet rs = null;

    try {

        String AQuery="select sql_cache ";
        AQuery=""+AQuery +"ID_PAUTA, ";
        AQuery=""+AQuery +"PAUTA ";
        AQuery=""+AQuery +"FROM ATA_PAUTA WHERE PAUTA LIKE '%"+PAUTA+"%'  ";
        AQuery=""+AQuery +"";


        state = FactoryConnection_MySQL.getConnection("feminicidio").prepareStatement(""+AQuery+"");
//        state.setString(1,PAUTA);

//        ////System.out.println("verificarPauta " + state);
     
        rs = state.executeQuery();

    } catch (SQLException erro) {
        //////System.out.println(erro);	
    } finally {
        try {
            //////System.out.println("X DataAtualizacao - Encerrando Conexão.");
            FactoryConnection_MySQL.getConnection("feminicidio").close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
        }
    }
    return rs;
}


public ResultSet verificarPautaAta(int ID_ATA, int ID_PAUTA ) {
    PreparedStatement state = null;
    ResultSet rs = null;

    try {

        String AQuery="select sql_cache ";
        AQuery=""+AQuery +"ID_ATA, ";
        AQuery=""+AQuery +"ID_PAUTA ";
        AQuery=""+AQuery +"FROM ATA_PAUTA_ATA WHERE ID_ATA=? AND ID_PAUTA=?  ";
        AQuery=""+AQuery +"";


        state = FactoryConnection_MySQL.getConnection("feminicidio").prepareStatement(""+AQuery+"");
        state.setInt(1,ID_ATA);
        state.setInt(2,ID_PAUTA);

//        ////System.out.println("verificarPauta " + state);
     
        rs = state.executeQuery();

    } catch (SQLException erro) {
        //////System.out.println(erro);	
    } finally {
        try {
            //////System.out.println("X DataAtualizacao - Encerrando Conexão.");
            FactoryConnection_MySQL.getConnection("feminicidio").close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
        }
    }
    return rs;
}


public ResultSet verificarAcao(String ACAO ) {
    PreparedStatement state = null;
    ResultSet rs = null;

    try {

        String AQuery = "select sql_cache ";
            AQuery = "" + AQuery + "CASE WHEN ID_ACAO IS NULL  THEN '' ELSE  ID_ACAO END AS ID_ACAO, ";
            AQuery = "" + AQuery + "CASE WHEN ACAO IS NULL  THEN '' ELSE ACAO  END AS ACAO  ";
            AQuery = "" + AQuery + "FROM ATA_ACAO WHERE ACAO LIKE '"+ACAO+"%' ";
            AQuery = "" + AQuery + "";

        state = FactoryConnection_MySQL.getConnection("feminicidio").prepareStatement(""+AQuery+"");
//        state.setString(1,PAUTA);

        ////System.out.println("verificarAcao " + state);
     
        rs = state.executeQuery();

    } catch (SQLException erro) {
        //////System.out.println(erro);	
    } finally {
        try {
            //////System.out.println("X DataAtualizacao - Encerrando Conexão.");
            FactoryConnection_MySQL.getConnection("feminicidio").close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
        }
    }
    return rs;
}


public ResultSet verificarAcaoAta(int ID_ACAO, int ID_ATA,int ID_PAUTA ) {
    PreparedStatement state = null;
    ResultSet rs = null;

    try {

        String AQuery = "select sql_cache ";
        AQuery = "" + AQuery + "ID_ACAO, ";
        AQuery = "" + AQuery + "ID_ATA, ";
        AQuery = "" + AQuery + "ID_PAUTA ";
        AQuery = "" + AQuery + "FROM ATA_ACAO_ATA WHERE ID_ACAO = ? AND ID_ATA=? AND  ID_PAUTA=? ";
        AQuery = "" + AQuery + "";

        state = FactoryConnection_MySQL.getConnection("feminicidio").prepareStatement(""+AQuery+"");
        state.setInt(1,ID_ACAO);
        state.setInt(2,ID_ATA);
        state.setInt(3,ID_PAUTA);

        ////System.out.println("verificarAcaoAta " + state);
     
        rs = state.executeQuery();

    } catch (SQLException erro) {
        //////System.out.println(erro);	
    } finally {
        try {
            //////System.out.println("X DataAtualizacao - Encerrando Conexão.");
            FactoryConnection_MySQL.getConnection("feminicidio").close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
        }
    }
    return rs;
}


public ResultSet verificarParticipante(String PARTICIPANTE ) {
    PreparedStatement state = null;
    ResultSet rs = null;

    try {

        String AQuery = "select sql_cache ";
            AQuery = "" + AQuery + "CASE WHEN ID_PARTICIPANTE IS NULL  THEN '' ELSE  ID_PARTICIPANTE END AS ID_PARTICIPANTE, ";
            AQuery = "" + AQuery + "CASE WHEN PARTICIPANTE IS NULL  THEN '' ELSE  PARTICIPANTE END AS PARTICIPANTE, ";
            AQuery = "" + AQuery + "CASE WHEN NOME IS NULL  THEN '' ELSE NOME  END AS NOME  ";
            AQuery = "" + AQuery + "FROM ATA_PARTICIPANTE WHERE PARTICIPANTE LIKE '%"+PARTICIPANTE+"%' ";
            AQuery = "" + AQuery + "";

        state = FactoryConnection_MySQL.getConnection("feminicidio").prepareStatement(""+AQuery+"");
//        state.setString(1,PAUTA);

//        ////System.out.println("verificarParticipante " + state);
     
        rs = state.executeQuery();

    } catch (SQLException erro) {
        //////System.out.println(erro);	
    } finally {
        try {
            //////System.out.println("X DataAtualizacao - Encerrando Conexão.");
            FactoryConnection_MySQL.getConnection("feminicidio").close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
        }
    }
    return rs;
}


public ResultSet verificarParticipanteAta(int ID_ATA, int ID_PARTICIPANTE ) {
    PreparedStatement state = null;
    ResultSet rs = null;

    try {

        String AQuery = "select sql_cache ";
            AQuery = "" + AQuery + "ID_ATA, ";
            AQuery = "" + AQuery + "MATRICULA, ";
            AQuery = "" + AQuery + "ID_PARTICIPANTE ";
            AQuery = "" + AQuery + "FROM ATA_PARTICIPANTE_ATA  WHERE ID_ATA=? AND ID_PARTICIPANTE = ? ";
            AQuery = "" + AQuery + "";

        state = FactoryConnection_MySQL.getConnection("feminicidio").prepareStatement(""+AQuery+"");
        state.setInt(1,ID_ATA);
        state.setInt(2,ID_PARTICIPANTE);

//        ////System.out.println("verificarParticipanteAta " + state);
     
        rs = state.executeQuery();

    } catch (SQLException erro) {
        //////System.out.println(erro);	
    } finally {
        try {
            //////System.out.println("X DataAtualizacao - Encerrando Conexão.");
            FactoryConnection_MySQL.getConnection("feminicidio").close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
        }
    }
    return rs;
}


public ResultSet encheRegionalOLD() {
    PreparedStatement state = null;
    ResultSet rs = null;

    try {

        String AQuery = "select sql_cache ";
        AQuery = "" + AQuery + "A.RESUMO, ";
        AQuery = "" + AQuery + "A.PREFIXO, ";
        AQuery = "" + AQuery + "COUNT(DISTINCT A.ID_ATA ) AS QTD_ATAS, ";
        AQuery = "" + AQuery + "COUNT(DISTINCT B.ID_PAUTA, B.ID_ATA) AS QTD_PAUTAS, ";
        AQuery = "" + AQuery + "COUNT(DISTINCT D.ID_PAUTA, D.ID_ATA, D.ID_ACAO) AS QTD_ACAO, ";
        AQuery = "" + AQuery + "sum(case when D.SITUACAO_ACAO=1 THEN 1 else 0 end )as QTD_ACAO_CONCLUIDA, ";
        AQuery = "" + AQuery + "sum(case when D.SITUACAO_ACAO=0 THEN 1 else 0 end )as QTD_ACAO_NAO_CONCLUIDA, ";
        AQuery = "" + AQuery + "F.nome, ";
        AQuery = "" + AQuery + "F.super ";
        AQuery = "" + AQuery + "FROM  ATA A  ";
        AQuery = "" + AQuery + "LEFT JOIN ATA_PAUTA_ATA B ON A.ID_ATA=B.ID_ATA ";
        AQuery = "" + AQuery + "LEFT JOIN ATA_PAUTA C ON B.ID_PAUTA=C.ID_PAUTA ";
        AQuery = "" + AQuery + "LEFT JOIN ATA_ACAO_ATA D ON D.ID_ATA=A.ID_ATA ";
        AQuery = "" + AQuery + "LEFT JOIN ATA_ACAO E ON E.ID_ACAO=D.ID_ACAO ";
        AQuery = "" + AQuery + "LEFT JOIN dependencias F ON A.PREFIXO=F.prefixo  AND cod_subordinada=0  ";
        AQuery = "" + AQuery + "GROUP BY A.PREFIXO ";
        AQuery = "" + AQuery + "";

        state = FactoryConnection_MySQL.getConnection("feminicidio").prepareStatement(""+AQuery+"");

//       // //System.out.println("encheRegional " + state);
     
        rs = state.executeQuery();

    } catch (SQLException erro) {
        //////System.out.println(erro);	
    } finally {
        try {
            //////System.out.println("X DataAtualizacao - Encerrando Conexão.");
            FactoryConnection_MySQL.getConnection("feminicidio").close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
        }
    }
    return rs;
}


public ResultSet encheRegional() {
    PreparedStatement state = null;
    ResultSet rs = null;

    try {

        String AQuery = "select sql_cache ";
        AQuery = "" + AQuery + "A.RESUMO, ";
        AQuery = "" + AQuery + "A.PREFIXO, ";
        AQuery = "" + AQuery + "COUNT(DISTINCT A.ID_ATA ) AS QTD_ATAS, ";
        AQuery = "" + AQuery + "COUNT(DISTINCT B.ID_PAUTA, B.ID_ATA) AS QTD_PAUTAS, ";
        AQuery = "" + AQuery + "COUNT(DISTINCT C.ID_PAUTA, C.ID_ATA, C.ID_ACAO) AS QTD_ACAO,  ";
        AQuery = "" + AQuery + "sum(case when C.SITUACAO_ACAO=1 THEN 1 else 0 end )as QTD_ACAO_CONCLUIDA, ";
        AQuery = "" + AQuery + "D.nome, ";
        AQuery = "" + AQuery + "D.super ";
        AQuery = "" + AQuery + "FROM  ATA A  ";
        AQuery = "" + AQuery + "LEFT JOIN ATA_PAUTA_ATA B ON A.ID_ATA=B.ID_ATA ";
        AQuery = "" + AQuery + "LEFT JOIN ATA_ACAO_ATA C ON C.ID_ATA=A.ID_ATA AND C.ID_PAUTA=B.ID_PAUTA ";
        AQuery = "" + AQuery + "LEFT JOIN dependencias D ON A.PREFIXO=D.prefixo  AND cod_subordinada=0  ";
        AQuery = "" + AQuery + "GROUP BY A.PREFIXO  ";
        state = FactoryConnection_MySQL.getConnection("feminicidio").prepareStatement(""+AQuery+"");

//        //System.out.println("encheRegional " + state);
     
        rs = state.executeQuery();

    } catch (SQLException erro) {
        //////System.out.println(erro);	
    } finally {
        try {
            //////System.out.println("X DataAtualizacao - Encerrando Conexão.");
            FactoryConnection_MySQL.getConnection("feminicidio").close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
        }
    }
    return rs;
}



public ResultSet encheRelatorio(int prefixo) {
    PreparedStatement state = null;
    ResultSet rs = null;

    try {
        String AQuery = "select sql_cache ";
        AQuery = "" + AQuery + "A.Prefixo, ";
        AQuery = "" + AQuery + "A.super, ";
        AQuery = "" + AQuery + "desen_acumulado_mes, ";
        AQuery = "" + AQuery + "desen_acumulado_sem, ";
        AQuery = "" + AQuery + "qtd_chv_j, ";
        AQuery = "" + AQuery + "Orc, ";
        AQuery = "" + AQuery + "Rlz ";
        AQuery = "" + AQuery + "FROM relatorio_730 A, relatorio_597 B ";
        AQuery = "" + AQuery + "WHERE A.Prefixo="+prefixo+" AND B.Prefixo= "+prefixo+" ";

        state = FactoryConnection_MySQL.getConnection("feminicidio").prepareStatement(""+AQuery+"");

//        //System.out.println("encheRelatorio " + state);
     
        rs = state.executeQuery();

    } catch (SQLException erro) {
        //////System.out.println(erro);	
    } finally {
        try {
            //////System.out.println("X DataAtualizacao - Encerrando Conexão.");
            FactoryConnection_MySQL.getConnection("feminicidio").close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
        }
    }
    return rs;
}


public ResultSet encheGrPromotiva(int prefixo) {
    PreparedStatement state = null;
    ResultSet rs = null;

    try {

        String AQuery = "select sql_cache ";
        AQuery = "" + AQuery + "CASE WHEN Prefixo IS NULL THEN '' ELSE Prefixo  END AS Prefixo,   ";
        AQuery = "" + AQuery + "CASE WHEN NomeRegional IS NULL THEN '' ELSE NomeRegional  END AS NomeRegional  , ";
        AQuery = "" + AQuery + "CASE WHEN GRPROMOTIVA IS NULL THEN '' ELSE GRPROMOTIVA  END AS GRPROMOTIVA  ";
        AQuery = "" + AQuery + "FROM tb_gerev_super_2708 ";
        AQuery = "" + AQuery + "WHERE PREFIXO=? ";

        state = FactoryConnection_MySQL.getConnection("feminicidio").prepareStatement(""+AQuery+"");
        state.setInt(1,prefixo);

//       //System.out.println("encheGrPromotiva " + state);
     
        rs = state.executeQuery();

    } catch (SQLException erro) {
        //////System.out.println(erro);	
    } finally {
        try {
            //////System.out.println("X DataAtualizacao - Encerrando Conexão.");
            FactoryConnection_MySQL.getConnection("feminicidio").close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
        }
    }
    return rs;
}






/* FUNCOES BOOLEAN*/

public ResultSet inserirNovaAta(String MATRICULA, int prefixo) {
PreparedStatement state = null;
boolean ok = false;
ResultSet myrs = null;
try {
	state = FactoryConnection_MySQL.getConnection("feminicidio").prepareStatement("INSERT ATA (ID_ATA, MATRICULA,PREFIXO, DT_GRAVACAO) VALUES (null,?,?, NOW()) ", Statement.RETURN_GENERATED_KEYS);
        state.setString(1,MATRICULA);
        state.setInt(2,prefixo);
       // System.out.println("2 inserirNovaAta state : "+state);

	ok = !state.execute();

        myrs = state.getGeneratedKeys();
		
//        ////System.out.println("inserirNovaAta :"+state);


} catch (SQLException ex) {
	ex.printStackTrace();
}
return myrs;
}


public ResultSet inserirPauta(String PAUTA) {
PreparedStatement state = null;
boolean ok = false;
ResultSet myrs = null;

try {
	state = FactoryConnection_MySQL.getConnection("feminicidio").prepareStatement("INSERT INTO ATA_PAUTA (PAUTA) VALUES (?);", Statement.RETURN_GENERATED_KEYS);

        state.setString(1,PAUTA);

	ok = !state.execute();

        myrs = state.getGeneratedKeys();
		
        //System.out.println("inserirPauta :"+state);


} catch (SQLException ex) {
	ex.printStackTrace();
}
return myrs;
}



boolean inserirAtaPautaAta(int ID_ATA, int ID_PAUTA) {
PreparedStatement state = null;
boolean ok = false;
try {
	state = FactoryConnection_MySQL.getConnection("feminicidio").prepareStatement("INSERT INTO ATA_PAUTA_ATA () VALUES (?, ?)");

        state.setInt(1,ID_ATA);
        state.setInt(2,ID_PAUTA);

	ok = !state.execute();

        ////System.out.println("inserirAtaPauta :"+state);

} catch (SQLException ex) {
	ex.printStackTrace();
}
return ok;
}



public ResultSet inserirAcao(String ACAO) {
PreparedStatement state = null;
boolean ok = false;
ResultSet myrs = null;
try {
	state = FactoryConnection_MySQL.getConnection("feminicidio").prepareStatement("INSERT INTO ATA_ACAO (ACAO) VALUES (?);", Statement.RETURN_GENERATED_KEYS);
	state.setString(1, ACAO);

        ////System.out.println("inserirAcao state : "+state);

	//int numero = stmt.executeUpdate(state, Statement.RETURN_GENERATED_KEYS);
	ok = !state.execute();

        myrs = state.getGeneratedKeys();


} catch (SQLException ex) {
	ex.printStackTrace();
}
return myrs;
}



boolean inserirAtaAcaoAta(int ID_ATA, int ID_PAUTA, int ID_ACAO) {
PreparedStatement state = null;
boolean ok = false;
try {
	state = FactoryConnection_MySQL.getConnection("feminicidio").prepareStatement("INSERT INTO ATA_ACAO_ATA () VALUES (?,?,?,0)");

        state.setInt(1, ID_ATA);
	state.setInt(2, ID_PAUTA);
	state.setInt(3, ID_ACAO);

	ok = !state.execute();

        ////System.out.println("inserirAtaAcaoAta :"+state);

} catch (SQLException ex) {
	ex.printStackTrace();
}
return ok;
}


boolean concluirAcao(int SITUACAO_ACAO,  int ID_ATA, int ID_PAUTA, int ID_ACAO) {
PreparedStatement state = null;
boolean ok = false;
try {
	state = FactoryConnection_MySQL.getConnection("feminicidio").prepareStatement("UPDATE ATA_ACAO_ATA SET SITUACAO_ACAO=? WHERE ID_ATA=? AND ID_PAUTA=? AND ID_ACAO =?");
        state.setInt(1, SITUACAO_ACAO);
        state.setInt(2, ID_ATA);
	state.setInt(3, ID_PAUTA);
	state.setInt(4, ID_ACAO);

	ok = !state.execute();

        ////System.out.println("concluirAcao :"+state);

} catch (SQLException ex) {
	ex.printStackTrace();
}
return ok;
}




public ResultSet inserirPartipante(String PARTICIPANTE) {
PreparedStatement state = null;
boolean ok = false;
ResultSet myrs = null;
try {
	state = FactoryConnection_MySQL.getConnection("feminicidio").prepareStatement("INSERT INTO ATA_PARTICIPANTE (ID_PARTICIPANTE,PARTICIPANTE) VALUES (NULL,? ); ", Statement.RETURN_GENERATED_KEYS);
	state.setString(1, PARTICIPANTE);
//	state.setString(2, NOME);

        System.out.println("inserirPartipante state : "+state);

	//int numero = stmt.executeUpdate(state, Statement.RETURN_GENERATED_KEYS);
	ok = !state.execute();

        myrs = state.getGeneratedKeys();


} catch (SQLException ex) {
	ex.printStackTrace();
}
return myrs;
}



boolean inserirAtaParticipanteAta( int ID_ATA,int ID_PARTICIPANTE) {
PreparedStatement state = null;
boolean ok = false;
try {
	state = FactoryConnection_MySQL.getConnection("feminicidio").prepareStatement("INSERT INTO ATA_PARTICIPANTE_ATA (ID_ATA,ID_PARTICIPANTE) VALUES (?, ?)");

        state.setInt(1, ID_ATA);
        state.setInt(2, ID_PARTICIPANTE);

	ok = !state.execute();

//        ////System.out.println("inserirAtaParticipanteAta :"+state);

} catch (SQLException ex) {
	ex.printStackTrace();
}
return ok;
}


public boolean alterarAta(String RESUMO,  String DT_ATA, String LCL,  String MATRICULA, String PREFIXO ,int ID_ATA ) {
    PreparedStatement state = null;
    boolean ok = false;

    try {
        String AQuery = "";
        AQuery = "UPDATE ATA SET RESUMO = ? , DT_ATA = ?, LCL= ? ,MATRICULA= ? , PREFIXO = ? WHERE ID_ATA = ? ";

        state = FactoryConnection_MySQL.getConnection("feminicidio").prepareStatement("" + AQuery + "");
        state.setString(1, RESUMO);
        state.setString(2, DT_ATA);
        state.setString(3, LCL);
        state.setString(4, MATRICULA);
        state.setString(5, PREFIXO);
        state.setInt(6, ID_ATA);
        ok = !state.execute();

      ////System.out.println("alterarAta " + state);
    } catch (SQLException ex) {
        ex.printStackTrace();
        return false;
    }
    return ok;

}


public boolean alterarPauta(String PAUTA,  int ID_PAUTA ) {
    PreparedStatement state = null;
    boolean ok = false;

    try {
        String AQuery = "";
        AQuery = " UPDATE ATA_PAUTA SET PAUTA=? WHERE ID_PAUTA=? ";

        state = FactoryConnection_MySQL.getConnection("feminicidio").prepareStatement("" + AQuery + "");
        state.setString(1, PAUTA);
        state.setInt(2, ID_PAUTA);
        ok = !state.execute();

//        //System.out.println("alterarPauta " + state);

    } catch (SQLException ex) {
        ex.printStackTrace();
        return false;
    }
    return ok;

}


public boolean alterarAcao(String ACAO,  int ID_ACAO ) {
    PreparedStatement state = null;
    boolean ok = false;

    try {
        String AQuery = "";
        AQuery = " UPDATE ATA_ACAO SET ACAO =? WHERE ID_ACAO=?";

        state = FactoryConnection_MySQL.getConnection("feminicidio").prepareStatement("" + AQuery + "");
        state.setString(1, ACAO);
        state.setInt(2, ID_ACAO);
        ok = !state.execute();

//        //System.out.println("alterarPauta " + state);

    } catch (SQLException ex) {
        ex.printStackTrace();
        return false;
    }
    return ok;

}


public boolean excluirParticipante(int ID_ATA,  int ID_PARTICIPANTE ) {
    PreparedStatement state = null;
    boolean ok = false;

    try {
        String AQuery = "";
        AQuery = "DELETE FROM ATA_PARTICIPANTE_ATA WHERE ID_ATA=? AND ID_PARTICIPANTE= ?";

        state = FactoryConnection_MySQL.getConnection("feminicidio").prepareStatement("" + AQuery + "");
        state.setInt(1, ID_ATA);
        state.setInt(2, ID_PARTICIPANTE);
        ok = !state.execute();

//        //System.out.println("excluirParticipante " + state);

    } catch (SQLException ex) {
        ex.printStackTrace();
        return false;
    }
    return ok;

}


%>





