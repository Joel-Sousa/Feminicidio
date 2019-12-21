<%-- 
    Document   : login
    Created on : 19/04/2019, 18:15:09
    Author     : joe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/my_login.css"/>
        <!--<style> body{ background: #8ea1f3;}</style>-->
        <style> body{ background: #660000;}</style>
        

        
        <title>JSP Page</title>
        
    </head>
    <body>
        <br>
        <div class="centerLogin">
    <center><h2>Cadastrar</h2></center>    
            <form method="post" name="frmLogin" action="cadu">
                
                <div class="emailLogin formularioLogin">
                    <img src="img/user.png" alt="E-mail" />
                    <input type="text" name="cpf" required="true" placeholder="CPF" autocomplete="off" />
                </div>
                
                <div class="emailLogin formularioLogin">
                    <img src="img/user.png" alt="E-mail" />
                    <input type="text" name="endereco" required="true" placeholder="Endereco" autocomplete="off" />
                </div>
                
                <div class="emailLogin formularioLogin">
                    <img src="img/user.png" alt="E-mail" />
                    <input type="text" name="nome" required="true" placeholder="Nome" autocomplete="off" />
                </div>

                <div class="senhaLogin formularioLogin">
                    <img src="img/pass.png" alt="Senha" />
                    <input type="password" name="senha" required="senha" placeholder="********" autocomplete="off" />
                </div>

                <input type="submit" name="btnSubmit" value="Cadastrar" class="btnSubmitLogin" />&nbsp;&nbsp;&nbsp;
                <font color="red" size="4">
        </font>
            </form>
            
        </div>
        
    <div class="centerLogin">
    <center><h2>Login</h2></center>    
            <form method="post" name="frmLogin" action="lu">
                <div class="emailLogin formularioLogin">
                    <img src="img/user.png" alt="E-mail" />
                    <input type="text" name="nome" required="true" placeholder="Nome" autocomplete="off" />
                </div>

                <div class="senhaLogin formularioLogin">
                    <img src="img/pass.png" alt="Senha" />
                    <input type="password" name="senha" required="senha" placeholder="********" autocomplete="off" />
                </div>

                <input type="submit" name="btnSubmit" value="Login" class="btnSubmitLogin" />&nbsp;&nbsp;&nbsp;
                <font color="red" size="4">
        </font>
            </form>
            
        </div>
    </body>
</html>