
function abrecadastroAta(){
//    alert("jequey ok")
    $("#main").load("cadastroAta.jsp", {ID_ATA:0, cpf:cpf});
    
}

function mnu(){
    
//    if(prefixoUser==9270||prefixoUser==8592||prefixoUser==9010){
//        $("#main").load("encheRegional.jsp", {});
//    }else{
        $("#main").load("minhasAtas.jsp", {PREFIXO:prefixoUser});
//    }
}


function listarAtas(prefixo){
        $("#main").load("minhasAtas.jsp", {PREFIXO:prefixo});
}

function cadastroAta(){
    $("#DIV_O").load("inserirNovaAta.jsp", {MATRICULA: UserChv, PREFIXO:prefixoUser,CARGO:cargo_x});
//    $("#main").load("cadastroAta.jsp", {ID_ATA:0});

}


function detalhaMinhasAtas(ID_ATA){
    $("#main").load("cadastroAta.jsp", {ID_ATA:ID_ATA,cpf:cpf});
    $("#DIV_O").load("detalhaMinhasAtas.jsp", {ID_ATA:ID_ATA});
}


function alterarAta() {
    ID_ATA=$("#txtAta").val();
    RESUMO=$("#txtResumo").val();

    if ($.trim(RESUMO) === "") {
        alert("Digite o Resumo da Ata!");
        return false;
    }

    DT_ATA=$("#txtDtAta").val();
    DT_ATA = DT_ATA.substring(6, 10) + "-" + DT_ATA.substring(3, 5) + "-" + DT_ATA.substring(0, 2);
   if ($.trim(DT_ATA) === "") {
        alert("Digite a Data da Ata!");
        return false;
    }

    LOCAL=$("#txtLocalAta").val();
   if ($.trim(LOCAL) === "") {
        alert("Digite o Local da Ata!");
        return false;
    }

    $("#DIV_O").load("alterarAta.jsp", {ID_ATA: ID_ATA, RESUMO: RESUMO, DT_ATA: DT_ATA,LOCAL:LOCAL, MATRICULA: UserChv, PREFIXO:prefixoUser});
}


function inserirPauta() {
    ID_ATA=$("#txtAta").val();
    PAUTA=$("#txtPauta").val();
    if ($.trim(PAUTA) === "") {
        alert("Digite a Pauta!");
        return false;
    }
    $("#DIV_O").load("inserirAtaPautaAta.jsp", {ID_ATA: ID_ATA, PAUTA: PAUTA, MATRICULA: UserChv, PREFIXO:prefixoUser});;
}

function inserirAcao(ID_ATA,ID_PAUTA) {
    ACAO=$("#txtAcao_"+ID_PAUTA).val();
    if ($.trim(ACAO) === "") {
        alert("Digite a AÇÃO!");
        return false;
    }
    if ($.trim(ID_PAUTA) === "") {
        alert("Adicione a Pauta antes de adicioanar a Acao!");
        return false;
    }
    
    $("#DIV_O").load("inserirAcao.jsp", {ID_ATA: ID_ATA, ID_PAUTA:ID_PAUTA, ACAO: ACAO, MATRICULA: UserChv, PREFIXO:prefixoUser});
}

function verificaPauta(PAUTA){
    
    if ($.trim(PAUTA) === "") {
        return false;
    }
   $("#DIV_O").load("verificarPauta.jsp",{PAUTA: PAUTA}); 
}


function inserirParcipante() {
    ID_ATA=$("#txtAta").val();
    PARTICIPANTE=$("#txtParticipante").val();
    PARTICIPANTE = PARTICIPANTE.trim();
//    alert(PARTICIPANTE);

    
    if ($.trim(PARTICIPANTE) === "") {
        alert("Digite o nome do participante !");
        return false;
    }
     if ($.trim(ID_ATA) === "") {
        alert("adicione ou escolha a ATA antes de adicionar partipantes !");
        return false;
    }
    
    $("#DIV_O").load("inserirAtaParcipanteAta.jsp", {ID_ATA: ID_ATA, PARTICIPANTE: PARTICIPANTE, MATRICULA: UserChv, PREFIXO:prefixoUser});;
}

function abrePaginaPrincipal() {
    location.reload();   
}

function concluirAcao(ID_ATA,ID_PAUTA,ID_ACAO,SITUACAO_ACAO){
        $("#DIV_O").load("concluirAcao.jsp", {ID_ATA: ID_ATA, ID_PAUTA:ID_PAUTA,ID_ACAO:ID_ACAO,SITUACAO_ACAO:SITUACAO_ACAO });;

}

function OMPauta(idx){
    
    if (idx==1){
        $("#tdBoxPauta").hide();
        $("#tdMostrarBoxPauta").show("slow");
    }
    
    if (idx==2){
        $("#tdBoxPauta").show("slow");
        $("#tdMostrarBoxPauta").hide();
    }

}


function abreCampoPauta(idx, ID_PAUTA){
    
    if (idx==1){
        $("#trxPauta_"+ID_PAUTA).hide();
        $("#trxPautaAltera_"+ID_PAUTA).show("slow");
    }
    
    if (idx==2){
        $("#trxPauta_"+ID_PAUTA).show("slow");
        $("#trxPautaAltera_"+ID_PAUTA).hide();
    }

}


function abreCampoAcao(idx, ID_ACAO){

    if (idx==1){
        $("#trxAcao"+ID_ACAO).hide();
        $("#trxAcaoAltera_"+ID_ACAO).show("slow");
    }
    
    if (idx==2){
        $("#trxAcao"+ID_ACAO).show("slow");
        $("#trxAcaoAltera_"+ID_ACAO).hide();
    }

}


function alterarPauta(ID_ATA, ID_PAUTA) {
    PAUTA=$("#txtPauta_"+ID_PAUTA).val();
    $("#DIV_O").load("alterarPauta.jsp", {ID_ATA: ID_ATA, ID_PAUTA:ID_PAUTA, PAUTA:PAUTA});;
}


function alterarAcao(ID_ATA, ID_ACAO) {
    ACAO=$("#txtAcao_"+ID_ACAO).val();
    $("#DIV_O").load("alterarAcao.jsp", {ID_ATA: ID_ATA, ID_ACAO:ID_ACAO, ACAO:ACAO});;
}


function excluirParticipante(ID_ATA, ID_PARTICIPANTE) {
    $("#DIV_O").load("excluirParticipante.jsp", {ID_ATA: ID_ATA, ID_PARTICIPANTE:ID_PARTICIPANTE});
}

function login() {
    usuario=$("#usuario").val();
    $("#DIV_O").load("fazerlogin.jsp", {usuario: usuario});
}


