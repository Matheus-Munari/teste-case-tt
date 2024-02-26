*** Settings ***
Resource    ../resources/setupteardown.robot
Resource    ../pages/login_page.robot
Resource    ../pages/home_page.robot
Test Setup    Dado que eu acesse o site do twitter
Test Teardown    Fechar navegador

*** Test Cases ***
Verificar se o usuário consegue realizar buscas na barra de pesquisa
    Quando o usuario tentar entrar com as credenciais corretas
    E insere um nome de usuário na barra de pesquisa
    E confirma a busca
    Então o usuário buscado deve aparecer no topo da página

Verificar se o usuario consegue realizar uma nova postagem
    Quando o usuario tentar entrar com as credenciais corretas
    E clicar no botão de nova postagem
    E escrever uma nova postagem
    E clicar no botao de postar
    Então deverá aparecer uma notificação confirmando a postagem