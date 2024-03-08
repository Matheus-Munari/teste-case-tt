*** Settings ***
Resource    ../resources/setupteardown.robot
Resource    ../pages/login_page.robot
Test Setup    Dado que eu acesse o site do twitter
Test Teardown    Fechar navegador

*** Test Cases ***
Teste de login com credenciais preenchidas corretamente
    Quando o usuario tentar entrar com as credenciais corretas
    Então devo ser redirecionado para a página inicial do aplicativo

Teste de login com usuario errado
    Quando o usuario tentar entrar com o usuario errado
    Então o usuário deverá ser impedido de entrar no aplicativo

Teste de login com senha errada 
    Quando o usuario tentar entrar com a senha incorreta
    Então o usuario será impedido de acessar a conta e uma notificação aparecerá

Teste de login com usuario vazio
    Quando o usuario não preencher o nome de usuario
    Então o usuário deverá ser impedido de entrar no aplicativo

Teste de login com senha vazia
    Quando o usuario tentar entrar com a senha vazia
    Então o botao de entrar devera estar intivo, impedindo o login

Teste de login usando o email
    Quando o usuario tentar logar com o email
    E preencher o nome de usuario certo
    E preencher a senha correta
    E apertar "Enter"
    Então o usuario devera ser redirecionado para a pagina inicial