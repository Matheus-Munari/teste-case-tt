*** Settings ***
Resource    ../resources/setupteardown.robot
Resource    ../pages/login_page.robot
Test Setup    Dado que eu acesse o site do twitter
Test Teardown    Fechar navegador

*** Test Cases ***
Teste de login com credenciais preenchidas corretamente
    Quando o usuario tentar entrar com as credenciais corretas
    Então devo ser redirecionado para a página inicial do aplicativo